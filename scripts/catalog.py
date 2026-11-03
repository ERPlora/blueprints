#!/usr/bin/env python3
"""Bilingual manifest of the image library: ``img/catalog.json``.

The Hub and its assistant find an image by what a person would call the product, in English or
Spanish, never by the file name (files are snake_case and mix languages). The manifest is a
contract the Hub depends on:

    {"version": 1,
     "images": [{"name": "coffee_espresso", "folder": "hospitality",
                 "title": {"en": "Espresso", "es": "Café solo"},
                 "tags": {"en": ["coffee", "short coffee"], "es": ["café", "expreso"]}}]}

Usage:
    python scripts/catalog.py build [--img DIR]     add an empty entry for every image without one
    python scripts/catalog.py validate [--img DIR]  check the whole contract (exit 1 lists every problem)
    python scripts/catalog.py references PATH... [--img DIR]
                                                    every catalog:<folder>/<name> of the Hub's templates (JSON
                                                    files, or folders of them) is in the manifest

``build`` never removes an entry and never invents a title: the skeleton it writes fails
``validate`` until a person fills the titles and tags.

One drawing, one name: ``validate`` also fails when two WebP files of the library are byte for byte the
same, because the Hub's assistant picks an image by its name and title, and a copy saved under the name of
another product (a gym card as «yoga class») makes it offer the wrong picture.

The Hub's templates (``base/seeds/*.json`` of ERPlora/hub) name images of this library, and the Hub's CI loads
them against this repository's main: ``references`` fails here, in the pull request that retires or renames a
drawing a template uses, before it can turn the whole Hub red.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from pathlib import Path

DEFAULT_IMG = Path(__file__).resolve().parent.parent / "img"
MANIFEST_NAME = "catalog.json"
VERSION = 1
LANGUAGES = ("en", "es")
ENTRY_KEYS = ("name", "folder", "title", "tags")
TOP_LEVEL_KEYS = ("version", "images")
# A reference of the Hub to an image of this library, as the Hub reads it (base/image_catalog.py, REFERENCE_RE).
REFERENCE_RE = re.compile(r"^catalog:([a-z][a-z0-9_]*)/([a-z0-9][a-z0-9_]*)$")
MISSING = "is not in the manifest"
RETIRE_IN_STEPS = (
    "A drawing a template uses is never retired or renamed in one step: add the new name here, "
    "move the template in ERPlora/hub, then retire the old name."
)
# Third-party brands a title or a tag must never name: the library is published under MIT and holds
# only generic products (README, «Convenciones»). Matched as whole words, whatever the case.
BLOCKED_BRANDS = (
    "aquarius",
    "coca cola",
    "coca-cola",
    "dabur",
    "fanta",
    "frappuccino",
    "jager",
    "jagermeister",
    "jäger",
    "jägermeister",
    "maminat",
    "nutella",
    "pastoret",
    "sprite",
    "unox",
)
BRAND_PATTERN = re.compile(
    r"(?<!\w)(?:"
    + "|".join(re.escape(brand) for brand in BLOCKED_BRANDS)
    + r")(?!\w)",
    re.IGNORECASE,
)


class UnreadableManifest(Exception):
    """The manifest is missing pieces the rest of the checks need."""


def library_images(img: Path) -> list[tuple[str, str]]:
    """(folder, name) of every WebP in the library, sorted."""
    return sorted((path.parent.name, path.stem) for path in img.glob("*/*.webp"))


def duplicate_drawings(img: Path) -> list[list[tuple[str, str]]]:
    """Groups of (folder, name) whose files are byte for byte the same; each group and the list sorted."""
    by_digest: dict[str, list[tuple[str, str]]] = {}
    for folder, name in library_images(img):
        digest = hashlib.sha256((img / folder / f"{name}.webp").read_bytes()).hexdigest()
        by_digest.setdefault(digest, []).append((folder, name))
    return sorted(group for group in by_digest.values() if len(group) > 1)


def load(img: Path) -> tuple[dict, list[str]]:
    """Read the manifest; raise UnreadableManifest when its shape blocks any further check."""
    path = img / MANIFEST_NAME
    if not path.is_file():
        raise UnreadableManifest(f"{MANIFEST_NAME} not found")
    try:
        document = json.loads(path.read_text(encoding="utf-8"))
    except (json.JSONDecodeError, UnicodeDecodeError) as exc:
        raise UnreadableManifest(f"{MANIFEST_NAME} is not valid JSON ({exc})") from exc
    if not isinstance(document, dict) or any(key not in document for key in TOP_LEVEL_KEYS):
        raise UnreadableManifest(
            f"{MANIFEST_NAME} must be an object with «version» and «images»"
        )

    problems: list[str] = []
    version = document["version"]
    if type(version) is not int or version != VERSION:
        problems.append(f"version must be {VERSION}")
    extra = sorted(set(document) - set(TOP_LEVEL_KEYS))
    if extra:
        problems.append(f"unexpected top-level keys: {', '.join(extra)}")
    if not isinstance(document["images"], list):
        problems.append("images must be a list")
        raise UnreadableManifest("\n".join(problems))
    return document, problems


def brand_in(text: str) -> str | None:
    """The first blocked brand named in ``text``, as written there, or None."""
    match = BRAND_PATTERN.search(text)
    return match.group(0) if match else None


def entry_key(entry: object) -> tuple[str, str] | None:
    """(folder, name) of an entry, or None when it cannot be named that way."""
    if isinstance(entry, dict):
        folder, name = entry.get("folder"), entry.get("name")
        if isinstance(folder, str) and isinstance(name, str):
            return folder, name
    return None


def check_title(title: object) -> list[str]:
    if not isinstance(title, dict):
        return ["title must be an object with «en» and «es»"]
    problems: list[str] = []
    extra = sorted(set(title) - set(LANGUAGES))
    if extra:
        problems.append(f"title has unexpected languages: {', '.join(extra)}")
    for lang in LANGUAGES:
        field = f"title.{lang}"
        if lang not in title:
            problems.append(f"{field} is missing")
            continue
        text = title[lang]
        if not isinstance(text, str):
            problems.append(f"{field} must be a string")
        elif not text.strip():
            problems.append(f"{field} is empty")
        else:
            if text != text.strip():
                problems.append(f"{field} has surrounding spaces")
            if "_" in text:
                problems.append(f"{field} contains an underscore")
            first = text.strip()[0]
            if first.isalpha() and not first.isupper():
                problems.append(f"{field} must start with a capital letter")
            brand = brand_in(text)
            if brand:
                problems.append(f"{field} names a third-party brand «{brand}»")
    return problems


def check_tags(tags: object, title: object) -> list[str]:
    if not isinstance(tags, dict):
        return ["tags must be an object with «en» and «es»"]
    problems: list[str] = []
    extra = sorted(set(tags) - set(LANGUAGES))
    if extra:
        problems.append(f"tags has unexpected languages: {', '.join(extra)}")
    for lang in LANGUAGES:
        field = f"tags.{lang}"
        if lang not in tags:
            problems.append(f"{field} is missing")
            continue
        values = tags[lang]
        if not isinstance(values, list):
            problems.append(f"{field} must be a list")
            continue
        if not values:
            problems.append(f"{field} needs at least one tag")
            continue
        if not all(isinstance(value, str) for value in values):
            problems.append(f"{field} must hold only strings")
            continue
        own_title = title.get(lang) if isinstance(title, dict) else None
        seen: set[str] = set()
        for value in values:
            if not value.strip():
                problems.append(f"{field} has an empty tag")
                continue
            if value != value.lower():
                problems.append(f"{field} «{value}» is not lowercase")
            if value != value.strip():
                problems.append(f"{field} «{value}» has surrounding spaces")
            if brand_in(value):
                problems.append(f"{field} «{value}» names a third-party brand")
            if value in seen:
                problems.append(f"{field} repeats «{value}»")
            seen.add(value)
            if isinstance(own_title, str) and value.strip().casefold() == own_title.strip().casefold():
                problems.append(f"{field} «{value}» repeats the title")
    return problems


def check_entry(index: int, entry: object, files: set[tuple[str, str]]) -> list[str]:
    if not isinstance(entry, dict):
        return [f"images[{index}] must be an object"]
    key = entry_key(entry)
    label = f"{key[0]}/{key[1]}" if key else f"images[{index}]"
    problems: list[str] = []
    missing = [name for name in ENTRY_KEYS if name not in entry]
    if missing:
        problems.append(f"missing keys: {', '.join(missing)}")
    extra = sorted(set(entry) - set(ENTRY_KEYS))
    if extra:
        problems.append(f"unexpected keys: {', '.join(extra)}")
    for name in ("folder", "name"):
        if name in entry and not isinstance(entry[name], str):
            problems.append(f"{name} must be a string")
    if "title" in entry:
        problems.extend(check_title(entry["title"]))
    if "tags" in entry:
        problems.extend(check_tags(entry["tags"], entry.get("title")))
    if key and key not in files:
        problems.append(f"file {key[0]}/{key[1]}.webp does not exist")
    return [f"{label}: {problem}" for problem in problems]


def validate(img: Path) -> list[str]:
    """Every problem of the manifest of ``img``; an empty list means the contract holds."""
    try:
        document, problems = load(img)
    except UnreadableManifest as exc:
        return str(exc).split("\n")

    images = document["images"]
    files = set(library_images(img))
    keys: list[tuple[str, str]] = []
    seen: set[tuple[str, str]] = set()
    for index, entry in enumerate(images):
        problems.extend(check_entry(index, entry, files))
        key = entry_key(entry)
        if key is None:
            continue
        if key in seen:
            problems.append(f"{key[0]}/{key[1]}: duplicate entry")
        seen.add(key)
        keys.append(key)

    for folder, name in sorted(files - seen):
        problems.append(f"{folder}/{name}: image has no entry in the manifest")

    for group in duplicate_drawings(img):
        names = ", ".join(f"{folder}/{name}" for folder, name in group)
        problems.append(
            f"same drawing under {len(group)} names: {names} "
            "(one drawing, one file: keep the name that describes it)"
        )

    out_of_place = next((keys[i] for i in range(1, len(keys)) if keys[i] < keys[i - 1]), None)
    if out_of_place:
        problems.append(
            "images are not sorted by folder, then name "
            f"(first out of place: {out_of_place[0]}/{out_of_place[1]})"
        )
    return problems


def references_in(value: object) -> set[tuple[str, str]]:
    """(folder, name) of every ``catalog:<folder>/<name>`` value anywhere in a template's JSON."""
    if isinstance(value, dict):
        return set().union(*map(references_in, value.values()))
    if isinstance(value, list):
        return set().union(*map(references_in, value))
    match = REFERENCE_RE.match(value) if isinstance(value, str) else None
    return {(match.group(1), match.group(2))} if match else set()


def templates(paths: list[Path]) -> tuple[list[Path], list[str]]:
    """The JSON templates ``paths`` name (a file, or the ``*.json`` of a folder), and what is wrong with them."""
    files: list[Path] = []
    problems: list[str] = []
    for path in paths:
        if path.is_dir():
            found = sorted(path.glob("*.json"))
            if not found:
                problems.append(f"{path}: no JSON template in it")
            files.extend(found)
        elif path.is_file():
            files.append(path)
        else:
            problems.append(f"{path}: not found")
    return files, problems


def template_references(paths: list[Path]) -> tuple[dict[Path, set[tuple[str, str]]], list[str]]:
    """The references of every template ``paths`` name, by file, and what could not be read."""
    files, problems = templates(paths)
    found: dict[Path, set[tuple[str, str]]] = {}
    for path in files:
        try:
            found[path] = references_in(json.loads(path.read_text(encoding="utf-8")))
        except (json.JSONDecodeError, UnicodeDecodeError) as exc:
            problems.append(f"{path}: not valid JSON ({exc})")
    return found, problems


def missing_references(img: Path, paths: list[Path]) -> list[str]:
    """Every ``catalog:`` reference of the templates ``paths`` name that the manifest of ``img`` lacks."""
    try:
        document, _ = load(img)
    except UnreadableManifest as exc:
        return str(exc).split("\n")
    known = {key for key in map(entry_key, document["images"]) if key}

    found, problems = template_references(paths)
    if not problems and not any(found.values()):
        listed = ", ".join(str(path) for path in paths)
        return [f"no catalog:<folder>/<name> reference in {listed}: nothing was checked"]
    for path in sorted(found):
        problems.extend(
            f"{path}: catalog:{folder}/{name} {MISSING}"
            for folder, name in sorted(found[path] - known)
        )
    return problems


def skeleton(folder: str, name: str) -> dict:
    return {
        "name": name,
        "folder": folder,
        "title": {lang: "" for lang in LANGUAGES},
        "tags": {lang: [] for lang in LANGUAGES},
    }


def canonical(entry: object) -> object:
    if not isinstance(entry, dict):
        return entry
    ordered = {key: entry[key] for key in ENTRY_KEYS if key in entry}
    ordered.update((key, value) for key, value in entry.items() if key not in ordered)
    return ordered


def dump(document: dict) -> str:
    """One line per image, so adding or editing an image is a one-line diff."""
    lines = [json.dumps(entry, ensure_ascii=False) for entry in document["images"]]
    body = ",\n".join(f"    {line}" for line in lines)
    images = f"[\n{body}\n  ]" if lines else "[]"
    return f'{{\n  "version": {json.dumps(document["version"])},\n  "images": {images}\n}}\n'


def build(img: Path) -> int:
    """Add a skeleton entry for every image without one; return how many were added."""
    path = img / MANIFEST_NAME
    if path.exists():
        try:
            document, problems = load(img)
        except UnreadableManifest as exc:
            problems = str(exc).split("\n")
        else:
            problems = [p for p in problems if p.startswith("unexpected top-level keys")]
        if problems:
            print(f"Cannot read {path}: {'; '.join(problems)}. Fix it by hand first.")
            raise SystemExit(1)
    else:
        document = {"version": VERSION, "images": []}

    images = [canonical(entry) for entry in document["images"]]
    known = {key for key in map(entry_key, images) if key}
    files = library_images(img)
    added = [skeleton(folder, name) for folder, name in files if (folder, name) not in known]
    for folder, name in sorted(known - set(files)):
        print(f"Warning: {folder}/{name} has no file; build never removes an entry")

    images.extend(added)
    images.sort(key=lambda entry: entry_key(entry) or ("", ""))
    path.write_text(dump({"version": document["version"], "images": images}), encoding="utf-8")
    return len(added)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Bilingual manifest of the image library")
    parser.add_argument("command", choices=("build", "validate", "references"))
    parser.add_argument(
        "paths", nargs="*", type=Path, help="references only: the Hub's templates (JSON files or folders of them)"
    )
    parser.add_argument("--img", type=Path, default=DEFAULT_IMG, help="library folder (default: img/)")
    args = parser.parse_args(argv)
    path = args.img / MANIFEST_NAME
    if (args.command == "references") != bool(args.paths):
        parser.error("references needs the templates to check; build and validate take no path")

    if args.command == "references":
        problems = missing_references(args.img, args.paths)
        if problems:
            print(f"FAILED: {len(problems)} problem(s) with the templates' images and {path}:")
            for problem in problems:
                print(f"  - {problem}")
            if any(problem.endswith(MISSING) for problem in problems):
                print(RETIRE_IN_STEPS)
            return 1
        found, _ = template_references(args.paths)
        images = set().union(*found.values())
        print(f"OK: the {len(images)} images named by {len(found)} templates are in {path}")
        return 0

    if args.command == "build":
        added = build(args.img)
        print(f"Added {added} skeleton entries to {path}; fill their titles and tags.")
        return 0

    problems = validate(args.img)
    if problems:
        print(f"FAILED: {len(problems)} problem(s) in {path}:")
        for problem in problems:
            print(f"  - {problem}")
        return 1
    count = len(json.loads(path.read_text(encoding="utf-8"))["images"])
    print(f"OK: {count} images in {path}, 0 problems")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
