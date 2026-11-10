#!/usr/bin/env bash
# Battery of the repo's git hooks (.githooks/): every case builds a throwaway world (a bare remote,
# a clone wired to this repo's hooks, a fake ERPlora/hub, stub tools on PATH and a throwaway global
# git config that points https://github.com/ERPlora/hub.git at the fake Hub and every other https
# URL at nothing), pushes or commits for real, and reads what ran. No case reaches the network.
# Run from the repo root with bash 5 (on the Mac, Homebrew's: bash 3.2 gives false greens):
#   bash .githooks/pre-push.test.sh
set -u

HERE=$(cd "$(dirname "$0")/.." && pwd -P)
# Resolved (-P): the stubs log `pwd -P`, and on the Mac $TMPDIR sits behind the /var symlink.
SCRATCH=$(cd "$(mktemp -d "${TMPDIR:-/tmp}/blueprints-hooks-test.XXXXXX")" && pwd -P)
# No case reads a terminal: the stub hooks read their stdin to the end.
exec < /dev/null
trap 'rm -rf "${SCRATCH:?}"' EXIT
BASE_PATH=$PATH
ZERO=0000000000000000000000000000000000000000
HUB_URL=https://github.com/ERPlora/hub.git
passed=0
failed=0
n=0
# Until the first world exists, git runs with a throwaway global config too: no hook of this machine
# runs on the fixtures.
printf '[user]\n\tname = test\n\temail = test@example.com\n[init]\n\tdefaultBranch = main\n' > "$SCRATCH/gitconfig"
export GIT_CONFIG_NOSYSTEM=1 GIT_CONFIG_GLOBAL="$SCRATCH/gitconfig"

ok() { passed=$((passed + 1)); echo "ok   - $1"; }
ko() { failed=$((failed + 1)); echo "FAIL - $1"; [ -f "$W/out" ] && sed 's/^/       | /' "$W/out"; }
check() { local name=$1; shift; if "$@"; then ok "$name"; else ko "$name"; fi; }

# fake_hub <dir> [--no-e2e]: a bare repo shaped like ERPlora/hub (templates in base/seeds, e2e tests
# in tests/e2e, plus files outside both), served with blob filters as GitHub does.
fake_hub() {
  local src
  src="$SCRATCH/src-$(basename "$1")"
  mkdir -p "$src/base/seeds" "$src/tests/e2e" "$src/apps/sale"
  echo '{"image": "catalog:hospitality/coffee"}' > "$src/base/seeds/restaurant.es.json"
  echo "print('app')" > "$src/apps/sale/models.py"
  echo "# hub" > "$src/README.md"
  echo '{}' > "$src/tests/e2e/tsconfig.json"
  if [ "${2:-}" != --no-e2e ]; then
    echo "const a = 'catalog:hospitality/coffee'" > "$src/tests/e2e/sale.spec.ts"
    echo "export const b = 1" > "$src/tests/e2e/helpers.ts"
  fi
  git -C "$src" init -q
  git -C "$src" add -A
  git -C "$src" commit -q -m hub
  git clone -q --bare "$src" "$1"
  git -C "$1" config uploadpack.allowFilter true
}
fake_hub "$SCRATCH/hub.git"
fake_hub "$SCRATCH/hub-no-e2e.git" --no-e2e

# The global hooks are stubs: each one records its arguments and stdin and exits with the code in
# <world>/<hook>.rc (0 when the file is missing).
write_global_stub() {
  cat > "$1" <<'EOF'
#!/usr/bin/env bash
world=$(cd "$(dirname "$0")/.." && pwd -P)
name=$(basename "$0")
printf '%s\n' "$@" > "$world/$name.args"
cat > "$world/$name.stdin"
exit "$(cat "$world/$name.rc" 2>/dev/null || echo 0)"
EOF
  chmod +x "$1"
}

# new_world [--no-global-path | --global-path <dir>] [--hub <bare repo>]: a fresh world in $W, its
# clone in $W/work.
new_world() {
  n=$((n + 1))
  W="$SCRATCH/case$n"
  mkdir -p "$W/bin" "$W/global-hooks"
  local global_path="$W/global-hooks" hub="$SCRATCH/hub.git"
  while [ $# -gt 0 ]; do
    case "$1" in
      --no-global-path) global_path= ;;
      --global-path) global_path=$2; shift ;;
      --hub) hub=$2; shift ;;
    esac
    shift
  done
  {
    printf '[user]\n\tname = test\n\temail = test@example.com\n[init]\n\tdefaultBranch = main\n'
    printf '[advice]\n\tdetachedHead = false\n'
    printf '[url "file://%s"]\n\tinsteadOf = %s\n' "$hub" "$HUB_URL"
    printf '[url "file://%s/offline/"]\n\tinsteadOf = https://\n' "$SCRATCH"
    [ -n "$global_path" ] && printf '[core]\n\thooksPath = %s\n' "$global_path"
  } > "$W/gitconfig"
  export GIT_CONFIG_NOSYSTEM=1 GIT_CONFIG_GLOBAL="$W/gitconfig" CALLS="$W/calls"
  for h in pre-push commit-msg pre-commit applypatch-msg; do write_global_stub "$W/global-hooks/$h"; done
  # uv stub: logs `uv <args> @ <commit> <clean|dirty> <dir> hub=<yes|no>` (hub: ../hub, the Hub's
  # clone beside the checkout, exists) and exits with the code in stub-rc/uv-<key>.rc of its
  # checkout; key = the args with the Hub's seeds folder as SEEDS, its e2e files as E2E, and _ for
  # spaces and slashes. A references call also lists the arguments it got and the Hub's files.
  cat > "$W/bin/uv" <<'EOF'
#!/usr/bin/env bash
state=clean; [ -n "$(git status --porcelain 2>/dev/null)" ] && state=dirty
hub=no; [ -d ../hub ] && hub=yes
echo "uv $* @ $(git rev-parse HEAD 2>/dev/null) $state $(pwd -P) hub=$hub" >> "$CALLS"
key=$(printf '%s' "$*" | sed -E 's#[^ ]*/hub/base/seeds#SEEDS#; s#( [^ ]*/hub/tests/e2e/[^ ]*)+# E2E#' | tr ' /' '__')
if [ "${4:-}" = scripts/catalog.py ] && [ "${5:-}" = references ]; then
  shift 5
  for a in "$@"; do if [ -e "$a" ]; then echo "arg $a exists"; else echo "arg $a missing"; fi; done >> "$CALLS.refs"
  (cd .. && find hub -path hub/.git -prune -o -type f -print | sort) > "$CALLS.hubfiles"
fi
exit "$(cat "stub-rc/uv-$key.rc" 2>/dev/null || echo 0)"
EOF
  # actionlint stub: logs like uv, exits with the code in stub-rc/actionlint.rc of its checkout.
  cat > "$W/bin/actionlint" <<'EOF'
#!/usr/bin/env bash
state=clean; [ -n "$(git status --porcelain 2>/dev/null)" ] && state=dirty
echo "actionlint${*:+ $*} @ $(git rev-parse HEAD 2>/dev/null) $state $(pwd -P)" >> "$CALLS"
exit "$(cat stub-rc/actionlint.rc 2>/dev/null || echo 0)"
EOF
  printf '#!/usr/bin/env bash\nexit 0\n' > "$W/bin/shellcheck"
  chmod +x "$W/bin/uv" "$W/bin/actionlint" "$W/bin/shellcheck"
  PATH="$W/bin:$BASE_PATH"
  git init -q --bare "$W/remote.git"
  git init -q "$W/work"
  cp -R "$HERE/.githooks" "$W/work/.githooks"
  mkdir -p "$W/work/scripts" "$W/work/img/hospitality" "$W/work/.github/workflows"
  echo "" > "$W/work/scripts/catalog.py"
  echo "" > "$W/work/scripts/validate_assets.py"
  echo "{}" > "$W/work/img/catalog.json"
  echo "webp" > "$W/work/img/hospitality/coffee.webp"
  printf 'name: publish\non: workflow_dispatch\n' > "$W/work/.github/workflows/publish.yml"
  echo "# blueprints" > "$W/work/README.md"
  git -C "$W/work" config core.hooksPath .githooks
  git -C "$W/work" remote add origin "$W/remote.git"
  git -C "$W/work" add -A
  git -C "$W/work" commit -q -m "initial"
  : > "$W/calls"
}

push() { (cd "$W/work" && git push "$@") > "$W/out" 2>&1; }
remote_tip() { git -C "$W/remote.git" rev-parse -q --verify "refs/heads/$1" || echo none; }
head_sha() { git -C "$W/work" rev-parse HEAD; }
commit_file() {
  mkdir -p "$(dirname "$W/work/$1")"
  echo "$2" > "$W/work/$1"
  git -C "$W/work" add -A
  git -C "$W/work" commit -q -m "$1=$2"
}
called() { grep -qF -- "$1" "$W/calls"; }
not_called() { ! grep -q . "$W/calls"; }
# The calls, one per line, as <tool and its arguments> with the Hub's paths shortened.
call_list() { sed -E 's/ @ .*//; s#[^ ]*/hub/base/seeds#SEEDS#; s#( [^ ]*/hub/tests/e2e/[^ ]*)+# E2E#' "$W/calls"; }

ACTIONLINT="actionlint"
SYNC="uv sync --locked"
PYTEST="uv run --locked pytest -q"
ASSETS="uv run --locked python scripts/validate_assets.py img"
VALIDATE="uv run --locked python scripts/catalog.py validate"
REFS="uv run --locked python scripts/catalog.py references"
CLONE="git clone --quiet --depth 1 --filter=blob:none --sparse $HUB_URL ../hub"
SPARSE="git -C ../hub sparse-checkout set base/seeds tests/e2e"

echo "== pre-push: the checks of the removed validate workflow"

new_world
push origin main
sha=$(head_sha)
check "first push of main (new branch) is accepted when the checks pass" test "$(remote_tip main)" = "$sha"
check "actionlint lints the workflows of the pushed commit" called "$ACTIONLINT @ $sha clean"
check "uv sync --locked runs on the pushed commit" called "$SYNC @ $sha clean"
check "pytest runs on the pushed commit" called "$PYTEST @ $sha clean"
check "validate_assets.py img runs on the pushed commit" called "$ASSETS @ $sha clean"
check "catalog.py validate runs on the pushed commit" called "$VALIDATE @ $sha clean"
check "catalog.py references runs on the Hub's templates, beside the checkout" called "$REFS ../hub/base/seeds @ $sha clean"
check "catalog.py references runs on the Hub's e2e tests, beside the checkout" \
  called "$REFS ../hub/tests/e2e/helpers.ts ../hub/tests/e2e/sale.spec.ts @ $sha clean"
check "the order is the workflow's: actionlint, sync, pytest, images, manifest, templates, e2e tests" \
  test "$(call_list | tr '\n' ',')" = "$ACTIONLINT,$SYNC,$PYTEST,$ASSETS,$VALIDATE,$REFS SEEDS,$REFS E2E,"
check "the Hub is fetched after the manifest check and before the references, beside the checkout" \
  test "$(grep '^uv ' "$W/calls" | awk '{print $NF}' | tr '\n' ',')" = "hub=no,hub=no,hub=no,hub=no,hub=yes,hub=yes,"
check "the Hub's templates are its base/seeds folder, fetched from $HUB_URL" \
  grep -qxF 'arg ../hub/base/seeds exists' "$W/calls.refs"
check "the Hub's e2e tests are every .ts file of its tests/e2e, and only those" \
  test "$(grep -F tests/e2e "$W/calls.refs" | tr '\n' ',')" = "arg ../hub/tests/e2e/helpers.ts exists,arg ../hub/tests/e2e/sale.spec.ts exists,"
check "the Hub is fetched with the workflow's commands: a shallow sparse clone of $HUB_URL, then base/seeds and tests/e2e" \
  bash -c "grep -qF 'pre-push: $CLONE (' '$W/out' && grep -qF 'pre-push: $SPARSE (' '$W/out'"
check "the Hub's clone is sparse: base/seeds and tests/e2e, nothing of its apps" \
  bash -c "grep -qx hub/base/seeds/restaurant.es.json '$W/calls.hubfiles' && grep -qx hub/tests/e2e/sale.spec.ts '$W/calls.hubfiles' && ! grep -q '^hub/apps/' '$W/calls.hubfiles'"
check "the checks run in a checkout other than the working tree" \
  bash -c "grep -q . '$W/calls' && ! grep -qF ' $W/work' '$W/calls'"
check "the global pre-push gets the same arguments" \
  test "$(cat "$W/pre-push.args" 2>/dev/null)" = "$(printf 'origin\n%s' "$W/remote.git")"
check "the global pre-push gets the same stdin" \
  test "$(cat "$W/pre-push.stdin" 2>/dev/null)" = "refs/heads/main $sha refs/heads/main $ZERO"

commit_file README.md "docs only"
: > "$W/calls"
push origin main
sha2=$(head_sha)
check "an update touching only docs is checked too (the workflow had no path filter)" called "$PYTEST @ $sha2 clean"
check "the global pre-push gets the update's old and new tips" \
  test "$(cat "$W/pre-push.stdin" 2>/dev/null)" = "refs/heads/main $sha2 refs/heads/main $sha"

for step in "$ACTIONLINT" "$SYNC" "$PYTEST" "$ASSETS" "$VALIDATE" "$REFS SEEDS" "$REFS E2E"; do
  new_world
  push origin main
  before=$(remote_tip main)
  if [ "$step" = "$ACTIONLINT" ]; then rc_file=stub-rc/actionlint.rc; else rc_file="stub-rc/uv-$(printf '%s' "${step#uv }" | tr ' /' '__').rc"; fi
  commit_file "$rc_file" 1
  : > "$W/calls"
  push origin main; rc=$?
  case "$step" in
    *SEEDS) shown="$REFS ../hub/base/seeds" ;;
    *E2E) shown="$REFS ../hub/tests/e2e/helpers.ts ../hub/tests/e2e/sale.spec.ts" ;;
    *) shown=$step ;;
  esac
  check "a red «${step}» aborts the push" test "$rc" -ne 0 -a "$(remote_tip main)" = "$before"
  check "the abort names «${step}» as the step that failed" grep -qF "pre-push: $shown failed on" "$W/out"
  check "the abort after «${step}» says the push is aborted" grep -q "failed on .*: push aborted" "$W/out"
  check "a red «${step}» runs nothing after it" test "$(call_list | tail -n 1)" = "$step"
done

new_world
push origin main
before=$(remote_tip main)
commit_file "stub-rc/uv-run_--locked_pytest_-q.rc" 1
echo 0 > "$W/work/stub-rc/uv-run_--locked_pytest_-q.rc"
push origin main; rc=$?
check "a red commit is refused even if the working tree is green" test "$rc" -ne 0 -a "$(remote_tip main)" = "$before"
git -C "$W/work" checkout -q -- stub-rc
commit_file "stub-rc/uv-run_--locked_pytest_-q.rc" 0
echo 1 > "$W/work/stub-rc/uv-run_--locked_pytest_-q.rc"
echo junk > "$W/work/untracked.txt"
push origin main; rc=$?
check "a green commit is pushed even if the working tree is red" test "$rc" -eq 0 -a "$(remote_tip main)" = "$(head_sha)"

new_world --hub "$SCRATCH/offline/hub.git"
push origin main; rc=$?
check "a Hub that cannot be fetched aborts the push" test "$rc" -ne 0 -a "$(remote_tip main)" = none
check "the abort names the Hub's clone as the step that failed" grep -qF "pre-push: $CLONE failed on" "$W/out"
check "an unfetched Hub runs no reference check" bash -c "! grep -qF '$REFS' '$W/calls'"

new_world --hub "$SCRATCH/hub-no-e2e.git"
push origin main
check "a Hub without e2e tests hands catalog.py the unmatched glob, so it fails (never a silent green)" \
  grep -qxF 'arg ../hub/tests/e2e/*.ts missing' "$W/calls.refs"

new_world
push origin main
git -C "$W/work" rm -q .github/workflows/publish.yml
git -C "$W/work" commit -q -m "no workflows"
: > "$W/calls"
# Without actionlint and shellcheck on PATH: with no workflow to lint, neither is needed.
mkdir -p "$W/minbin"
for tool in git bash python3; do ln -s "$(command -v "$tool")" "$W/minbin/$tool"; done
ln -s "$W/bin/uv" "$W/minbin/uv"
if PATH="/usr/bin:/bin" command -v actionlint > /dev/null; then
  echo "skip - actionlint is in /usr/bin or /bin: the commit-without-workflows case cannot hide it"
else
  PATH="$W/minbin:/usr/bin:/bin" push origin main; rc=$?
  check "a commit without workflows is pushed without actionlint (nothing to lint)" test "$rc" -eq 0 -a "$(remote_tip main)" = "$(head_sha)"
  check "a commit without workflows still runs the other checks" called "$PYTEST @ $(head_sha) clean"
  check "a commit without workflows says actionlint was skipped" grep -q "pre-push: no workflow under .github/workflows" "$W/out"
fi

new_world
push origin main
git -C "$W/work" checkout -q -b feature
commit_file README.md feature
: > "$W/calls"
push origin feature; rc=$?
fsha=$(head_sha)
check "a new non-main branch is checked (the workflow checked every pull request)" \
  test "$rc" -eq 0 -a "$(remote_tip feature)" = "$fsha" -a -n "$(grep -F "$PYTEST @ $fsha" "$W/calls")"
: > "$W/calls"
push origin --delete feature; rc=$?
check "deleting a remote branch is accepted" test "$rc" -eq 0 -a "$(remote_tip feature)" = none
check "deleting a remote branch runs no checks" not_called
check "the global pre-push still sees the deletion" \
  test "$(cat "$W/pre-push.stdin" 2>/dev/null)" = "(delete) $ZERO refs/heads/feature $fsha"

new_world
push origin main
git -C "$W/work" checkout -q -b one
commit_file README.md one
one=$(head_sha)
git -C "$W/work" checkout -q -b two main
commit_file README.md two
two=$(head_sha)
: > "$W/calls"
push origin one two; rc=$?
check "a push of two branches checks the commit of each" \
  test "$rc" -eq 0 -a -n "$(grep -F "$PYTEST @ $one clean" "$W/calls")" -a -n "$(grep -F "$PYTEST @ $two clean" "$W/calls")"
check "a push of two branches fetches the Hub once and checks both against it" \
  test "$(grep -cF "$REFS ../hub/base/seeds @" "$W/calls")" -eq 2

new_world
echo 1 > "$W/pre-push.rc"
push origin main; rc=$?
check "a failing global pre-push aborts the push" test "$rc" -ne 0 -a "$(remote_tip main)" = none
check "a failing global pre-push stops before the checks" not_called

new_world --no-global-path
push origin main; rc=$?
check "without a global hooksPath the push works" test "$rc" -eq 0 -a "$(remote_tip main)" = "$(head_sha)"
check "without a global hooksPath the checks still run" called "$PYTEST @ $(head_sha)"

new_world --global-path "$SCRATCH/empty-global-hooks"
mkdir -p "$SCRATCH/empty-global-hooks"
push origin main; rc=$?
check "a global hooksPath without pre-push does not break the push" test "$rc" -eq 0 -a "$(remote_tip main)" = "$(head_sha)"

new_world
git -C "$W/work" config core.hooksPath "$W/work/.githooks"
printf '[core]\n\thooksPath = %s\n' "$W/work/.githooks" >> "$W/gitconfig"
perl -e 'alarm 60; exec @ARGV' bash -c 'cd "$1" && git push origin main' _ "$W/work" > "$W/out" 2>&1; rc=$?
check "a global hooksPath that is .githooks itself does not loop" test "$rc" -eq 0 -a "$(remote_tip main)" = "$(head_sha)"

# Missing tools: PATH keeps git, bash and python3 and the stubs that are not the missing one.
for missing in uv actionlint shellcheck; do
  new_world
  mkdir -p "$W/minbin"
  for tool in git bash python3; do ln -s "$(command -v "$tool")" "$W/minbin/$tool"; done
  for tool in uv actionlint shellcheck; do [ "$tool" = "$missing" ] || ln -s "$W/bin/$tool" "$W/minbin/$tool"; done
  if PATH="/usr/bin:/bin" command -v "$missing" > /dev/null; then
    echo "skip - $missing is in /usr/bin or /bin: the missing-$missing case cannot hide it"
    continue
  fi
  PATH="$W/minbin:/usr/bin:/bin" push origin main; rc=$?
  check "without $missing the push is aborted" test "$rc" -ne 0 -a "$(remote_tip main)" = none
  check "the abort says $missing is missing" grep -q "pre-push: $missing is missing" "$W/out"
done

echo "== delegates to the global hooks"

for hook in commit-msg pre-commit applypatch-msg; do
  new_world
  echo msg > "$W/msg"
  # pre-commit takes no arguments; commit-msg and applypatch-msg take the message file.
  args="$W/msg"; [ "$hook" = pre-commit ] && args=
  (cd "$W/work" && bash ".githooks/$hook" $args) > "$W/out" 2>&1; rc=$?
  check "$hook: passes when the global one passes" test "$rc" -eq 0
  check "$hook: the global one gets the same arguments" test -f "$W/$hook.args" -a "$(cat "$W/$hook.args" 2>/dev/null)" = "$args"
  echo 1 > "$W/$hook.rc"
  (cd "$W/work" && bash ".githooks/$hook" $args) > "$W/out" 2>&1; rc=$?
  check "$hook: fails when the global one fails" test "$rc" -ne 0
  new_world --no-global-path
  (cd "$W/work" && bash ".githooks/$hook" $args) > "$W/out" 2>&1; rc=$?
  check "$hook: exits 0 without a global hooksPath" test "$rc" -eq 0
done

new_world
echo 1 > "$W/commit-msg.rc"
echo x > "$W/work/x.txt"
git -C "$W/work" add x.txt
before=$(head_sha)
git -C "$W/work" commit -q -m "x" > "$W/out" 2>&1; rc=$?
check "git commit runs the global commit-msg through .githooks" test "$rc" -ne 0 -a "$(head_sha)" = "$before"
rm "$W/commit-msg.rc"
echo 1 > "$W/pre-commit.rc"
git -C "$W/work" commit -q -m "x" > "$W/out" 2>&1; rc=$?
check "git commit runs the global pre-commit through .githooks" test "$rc" -ne 0 -a "$(head_sha)" = "$before"

echo
if [ "$failed" -eq 0 ]; then echo "GREEN: $passed passed"; else echo "RED: $failed failed, $passed passed"; fi
[ "$failed" -eq 0 ]
