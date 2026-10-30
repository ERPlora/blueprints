"""Tests for scripts/catalog.py, the bilingual manifest of the image library (img/catalog.json)."""

from __future__ import annotations

import json
from pathlib import Path

import pytest
from PIL import Image

import catalog

REPO_IMG = Path(__file__).resolve().parent.parent / "img"


def make_image(img: Path, folder: str, name: str) -> None:
    (img / folder).mkdir(parents=True, exist_ok=True)
    Image.new("RGB", (8, 8), "white").save(img / folder / f"{name}.webp", "WEBP")


def entry(folder: str, name: str, **overrides) -> dict:
    data = {
        "name": name,
        "folder": folder,
        "title": {"en": "Espresso", "es": "Café solo"},
        "tags": {"en": ["coffee", "short coffee"], "es": ["café", "expreso"]},
    }
    data.update(overrides)
    return data


def write_manifest(img: Path, images: list, version=1) -> None:
    (img / "catalog.json").write_text(json.dumps({"version": version, "images": images}))


@pytest.fixture
def img(tmp_path: Path) -> Path:
    root = tmp_path / "img"
    make_image(root, "hospitality", "coffee_espresso")
    make_image(root, "beauty_hair", "corte_senora")
    return root


@pytest.fixture
def valid(img: Path) -> Path:
    write_manifest(
        img,
        [
            entry(
                "beauty_hair",
                "corte_senora",
                title={"en": "Women's haircut", "es": "Corte de señora"},
                tags={"en": ["haircut", "cut"], "es": ["corte de pelo", "corte"]},
            ),
            entry("hospitality", "coffee_espresso"),
        ],
    )
    return img


def problems_of(img: Path, *images: dict) -> list[str]:
    write_manifest(img, list(images))
    return catalog.validate(img)


# -- validate ---------------------------------------------------------------------------------


def test_a_complete_manifest_has_no_problems(valid: Path) -> None:
    assert catalog.validate(valid) == []


def test_a_missing_manifest_is_a_problem(img: Path) -> None:
    assert catalog.validate(img) == ["catalog.json not found"]


def test_invalid_json_is_a_problem(img: Path) -> None:
    (img / "catalog.json").write_text("{not json")

    [problem] = catalog.validate(img)

    assert problem.startswith("catalog.json is not valid JSON (")


@pytest.mark.parametrize(
    "document, problem",
    [
        ([], "catalog.json must be an object with «version» and «images»"),
        ({"images": []}, "catalog.json must be an object with «version» and «images»"),
        ({"version": 2, "images": []}, "version must be 1"),
        ({"version": True, "images": []}, "version must be 1"),
        ({"version": 1, "images": {}}, "images must be a list"),
        ({"version": 1, "images": [], "extra": 1}, "unexpected top-level keys: extra"),
    ],
)
def test_the_document_shape_is_checked(img: Path, document, problem: str) -> None:
    (img / "catalog.json").write_text(json.dumps(document))

    assert problem in catalog.validate(img)


def test_an_entry_that_is_not_an_object_is_a_problem(valid: Path) -> None:
    images = json.loads((valid / "catalog.json").read_text())["images"]
    images.append("coffee_espresso")

    assert problems_of(valid, *images) == ["images[2] must be an object"]


def test_missing_and_unexpected_keys_are_problems(img: Path) -> None:
    broken = entry("hospitality", "coffee_espresso", colour="brown")
    del broken["tags"]

    assert problems_of(img, broken) == [
        "hospitality/coffee_espresso: missing keys: tags",
        "hospitality/coffee_espresso: unexpected keys: colour",
        "beauty_hair/corte_senora: image has no entry in the manifest",
    ]


def test_an_entry_without_folder_or_name_is_named_by_its_index(img: Path) -> None:
    broken = entry("hospitality", "coffee_espresso")
    del broken["name"]

    assert "images[0]: missing keys: name" in problems_of(img, broken)


@pytest.mark.parametrize(
    "title, problem",
    [
        ({"en": "", "es": "Café solo"}, "title.en is empty"),
        ({"en": "Espresso", "es": "   "}, "title.es is empty"),
        ({"en": "Espresso"}, "title.es is missing"),
        ({"en": "Espresso", "es": "Café solo", "fr": "Café"}, "title has unexpected languages: fr"),
        ("Espresso", "title must be an object with «en» and «es»"),
        ({"en": "Espresso", "es": 3}, "title.es must be a string"),
        ({"en": "coffee_espresso", "es": "Café solo"}, "title.en contains an underscore"),
        ({"en": "espresso", "es": "Café solo"}, "title.en must start with a capital letter"),
        ({"en": "Espresso ", "es": "Café solo"}, "title.en has surrounding spaces"),
    ],
)
def test_titles_are_checked(img: Path, title, problem: str) -> None:
    problems = problems_of(img, entry("hospitality", "coffee_espresso", title=title))

    assert f"hospitality/coffee_espresso: {problem}" in problems


def test_a_title_may_start_with_a_digit(img: Path) -> None:
    title = {"en": "7 days pass", "es": "Bono 7 días"}

    problems = problems_of(img, entry("hospitality", "coffee_espresso", title=title))

    assert not [p for p in problems if "title" in p]


@pytest.mark.parametrize(
    "tags, problem",
    [
        ({"en": [], "es": ["café"]}, "tags.en needs at least one tag"),
        ({"en": ["coffee"]}, "tags.es is missing"),
        ({"en": ["coffee"], "es": "café"}, "tags.es must be a list"),
        ({"en": ["coffee"], "es": ["café"], "it": ["caffè"]}, "tags has unexpected languages: it"),
        ("coffee", "tags must be an object with «en» and «es»"),
        ({"en": ["coffee", 3], "es": ["café"]}, "tags.en must hold only strings"),
        ({"en": ["coffee", ""], "es": ["café"]}, "tags.en has an empty tag"),
        ({"en": ["Coffee"], "es": ["café"]}, "tags.en «Coffee» is not lowercase"),
        ({"en": ["coffee "], "es": ["café"]}, "tags.en «coffee » has surrounding spaces"),
        ({"en": ["coffee", "coffee"], "es": ["café"]}, "tags.en repeats «coffee»"),
        ({"en": ["espresso"], "es": ["café"]}, "tags.en «espresso» repeats the title"),
        ({"en": ["coffee"], "es": ["café solo"]}, "tags.es «café solo» repeats the title"),
        ({"en": ["coffee"], "es": ["Café solo"]}, "tags.es «Café solo» repeats the title"),
    ],
)
def test_tags_are_checked(img: Path, tags, problem: str) -> None:
    problems = problems_of(img, entry("hospitality", "coffee_espresso", tags=tags))

    assert f"hospitality/coffee_espresso: {problem}" in problems


def test_an_entry_whose_file_does_not_exist_is_a_problem(valid: Path) -> None:
    images = json.loads((valid / "catalog.json").read_text())["images"]
    images.append(entry("hospitality", "coffee_latte", title={"en": "Latte", "es": "Café con leche"}))

    assert problems_of(valid, *images) == [
        "hospitality/coffee_latte: file hospitality/coffee_latte.webp does not exist"
    ]


def test_an_entry_in_a_folder_that_does_not_exist_is_a_problem(valid: Path) -> None:
    images = json.loads((valid / "catalog.json").read_text())["images"]
    images.append(entry("snacks", "crisps", title={"en": "Crisps", "es": "Patatas fritas"}))

    assert problems_of(valid, *images) == ["snacks/crisps: file snacks/crisps.webp does not exist"]


def test_folder_and_name_must_be_strings(valid: Path) -> None:
    images = json.loads((valid / "catalog.json").read_text())["images"]
    images.append(entry(["retail"], 7))

    assert problems_of(valid, *images) == [
        "images[2]: folder must be a string",
        "images[2]: name must be a string",
    ]


def test_an_image_without_entry_is_a_problem(img: Path) -> None:
    assert problems_of(img, entry("hospitality", "coffee_espresso")) == [
        "beauty_hair/corte_senora: image has no entry in the manifest"
    ]


def test_a_duplicate_entry_is_a_problem(valid: Path) -> None:
    images = json.loads((valid / "catalog.json").read_text())["images"]
    images.append(images[1])

    assert problems_of(valid, *images) == ["hospitality/coffee_espresso: duplicate entry"]


def test_entries_must_be_sorted_by_folder_then_name(valid: Path) -> None:
    images = json.loads((valid / "catalog.json").read_text())["images"]

    assert problems_of(valid, images[1], images[0]) == [
        "images are not sorted by folder, then name (first out of place: beauty_hair/corte_senora)"
    ]


def test_every_problem_is_listed(img: Path) -> None:
    broken = entry("hospitality", "coffee_espresso", title={"en": "", "es": ""})

    assert problems_of(img, broken) == [
        "hospitality/coffee_espresso: title.en is empty",
        "hospitality/coffee_espresso: title.es is empty",
        "beauty_hair/corte_senora: image has no entry in the manifest",
    ]


# -- build ------------------------------------------------------------------------------------


def read(img: Path) -> dict:
    return json.loads((img / "catalog.json").read_text(encoding="utf-8"))


def test_build_writes_a_skeleton_for_every_image(img: Path) -> None:
    assert catalog.build(img) == 2

    assert read(img) == {
        "version": 1,
        "images": [
            {
                "name": "corte_senora",
                "folder": "beauty_hair",
                "title": {"en": "", "es": ""},
                "tags": {"en": [], "es": []},
            },
            {
                "name": "coffee_espresso",
                "folder": "hospitality",
                "title": {"en": "", "es": ""},
                "tags": {"en": [], "es": []},
            },
        ],
    }


def test_a_skeleton_does_not_pass_validation(img: Path) -> None:
    catalog.build(img)

    assert "hospitality/coffee_espresso: title.en is empty" in catalog.validate(img)


def test_build_keeps_existing_entries_and_adds_only_the_missing(valid: Path) -> None:
    before = read(valid)["images"]
    make_image(valid, "hospitality", "coffee_latte")

    assert catalog.build(valid) == 1

    after = read(valid)["images"]
    assert after[:2] == before
    assert after[2]["name"] == "coffee_latte"
    assert after[2]["title"] == {"en": "", "es": ""}


def test_build_sorts_the_entries(valid: Path) -> None:
    images = read(valid)["images"]
    write_manifest(valid, [images[1], images[0]])

    catalog.build(valid)

    assert [e["folder"] for e in read(valid)["images"]] == ["beauty_hair", "hospitality"]


def test_build_never_removes_an_entry(valid: Path, capsys: pytest.CaptureFixture[str]) -> None:
    (valid / "hospitality" / "coffee_espresso.webp").unlink()

    assert catalog.build(valid) == 0

    assert [e["name"] for e in read(valid)["images"]] == ["corte_senora", "coffee_espresso"]
    assert capsys.readouterr().out == (
        "Warning: hospitality/coffee_espresso has no file; build never removes an entry\n"
    )


def test_build_writes_the_keys_in_canonical_order(valid: Path) -> None:
    images = read(valid)["images"]
    write_manifest(valid, [dict(reversed(list(e.items()))) for e in images])

    catalog.build(valid)

    assert [list(e) for e in read(valid)["images"]] == [["name", "folder", "title", "tags"]] * 2


def test_build_writes_one_line_per_image_in_utf8(valid: Path) -> None:
    catalog.build(valid)

    text = (valid / "catalog.json").read_text(encoding="utf-8")
    assert text == (
        "{\n"
        '  "version": 1,\n'
        '  "images": [\n'
        '    {"name": "corte_senora", "folder": "beauty_hair", '
        '"title": {"en": "Women\'s haircut", "es": "Corte de señora"}, '
        '"tags": {"en": ["haircut", "cut"], "es": ["corte de pelo", "corte"]}},\n'
        '    {"name": "coffee_espresso", "folder": "hospitality", '
        '"title": {"en": "Espresso", "es": "Café solo"}, '
        '"tags": {"en": ["coffee", "short coffee"], "es": ["café", "expreso"]}}\n'
        "  ]\n"
        "}\n"
    )


@pytest.mark.parametrize("text", ["{not json", "[]", '{"version": 1}', '{"version": 1, "images": [], "x": 1}'])
def test_build_refuses_a_manifest_it_cannot_read(img: Path, text: str) -> None:
    (img / "catalog.json").write_text(text)

    with pytest.raises(SystemExit) as exit_info:
        catalog.build(img)

    assert exit_info.value.code == 1
    assert (img / "catalog.json").read_text() == text


# -- command line -----------------------------------------------------------------------------


def test_validate_command_exits_zero_and_counts_the_entries(
    valid: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    assert catalog.main(["validate", "--img", str(valid)]) == 0
    assert capsys.readouterr().out == f"OK: 2 images in {valid}/catalog.json, 0 problems\n"


def test_validate_command_exits_one_and_lists_every_problem(
    img: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    write_manifest(img, [entry("hospitality", "coffee_espresso", title={"en": "", "es": "Café solo"})])

    assert catalog.main(["validate", "--img", str(img)]) == 1
    assert capsys.readouterr().out == (
        f"FAILED: 2 problem(s) in {img}/catalog.json:\n"
        "  - hospitality/coffee_espresso: title.en is empty\n"
        "  - beauty_hair/corte_senora: image has no entry in the manifest\n"
    )


def test_build_command_reports_what_it_added(img: Path, capsys: pytest.CaptureFixture[str]) -> None:
    assert catalog.main(["build", "--img", str(img)]) == 0
    assert capsys.readouterr().out == (
        f"Added 2 skeleton entries to {img}/catalog.json; fill their titles and tags.\n"
    )


def test_the_default_library_is_the_repository_img_folder() -> None:
    assert catalog.DEFAULT_IMG == REPO_IMG


# -- the real library -------------------------------------------------------------------------


def test_the_library_manifest_is_complete() -> None:
    assert catalog.validate(REPO_IMG) == []
    assert len(read(REPO_IMG)["images"]) == len(list(REPO_IMG.glob("*/*.webp")))
