"""Tests for scripts/catalog.py, the bilingual manifest of the image library (img/catalog.json)."""

from __future__ import annotations

import hashlib
import json
import shutil
from pathlib import Path

import pytest
from PIL import Image

import catalog

REPO_IMG = Path(__file__).resolve().parent.parent / "img"


def make_image(img: Path, folder: str, name: str) -> None:
    """A tiny WebP whose colour comes from its name, so two images are never the same file by chance."""
    (img / folder).mkdir(parents=True, exist_ok=True)
    colour = tuple(hashlib.sha1(f"{folder}/{name}".encode()).digest()[:3])
    Image.new("RGB", (8, 8), colour).save(img / folder / f"{name}.webp", "WEBP", lossless=True)


def copy_image(img: Path, source: str, target: str) -> None:
    """Save the file of ``source`` again as ``target`` (both ``<folder>/<name>``), byte for byte."""
    (img / target).parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(img / f"{source}.webp", img / f"{target}.webp")


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


# The library is published under MIT: no third-party brand may come back through a title or a tag.
BLOCKED_BRANDS = (
    "coca-cola",
    "coca cola",
    "fanta",
    "sprite",
    "aquarius",
    "jäger",
    "jager",
    "jägermeister",
    "jagermeister",
    "nutella",
    "frappuccino",
    "pastoret",
    "dabur",
    "unox",
    "maminat",
)


@pytest.mark.parametrize("brand", BLOCKED_BRANDS)
def test_a_title_naming_a_brand_is_a_problem(img: Path, brand: str) -> None:
    title = {"en": "Espresso", "es": f"Vaso de {brand}"}

    problems = problems_of(img, entry("hospitality", "coffee_espresso", title=title))

    assert f"hospitality/coffee_espresso: title.es names a third-party brand «{brand}»" in problems


@pytest.mark.parametrize("brand", BLOCKED_BRANDS)
def test_a_tag_naming_a_brand_is_a_problem(img: Path, brand: str) -> None:
    tags = {"en": ["coffee", f"{brand} drink"], "es": ["café"]}

    problems = problems_of(img, entry("hospitality", "coffee_espresso", tags=tags))

    assert f"hospitality/coffee_espresso: tags.en «{brand} drink» names a third-party brand" in problems


def test_a_brand_is_found_whatever_its_case(img: Path) -> None:
    title = {"en": "Coca-Cola Zero", "es": "Chupito de JÄGER"}

    problems = problems_of(img, entry("hospitality", "coffee_espresso", title=title))

    assert "hospitality/coffee_espresso: title.en names a third-party brand «Coca-Cola»" in problems
    assert "hospitality/coffee_espresso: title.es names a third-party brand «JÄGER»" in problems


def test_a_brand_inside_another_word_is_not_a_brand(img: Path) -> None:
    title = {"en": "Fantasy earrings", "es": "Pendientes de fantasía"}
    tags = {"en": ["costume jewellery", "spritely", "aquariums"], "es": ["bisutería", "fantasía", "infanta"]}

    problems = problems_of(img, entry("hospitality", "coffee_espresso", title=title, tags=tags))

    assert not [p for p in problems if "brand" in p]


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


def test_one_drawing_under_two_names_is_a_problem(valid: Path) -> None:
    copy_image(valid, "hospitality/coffee_espresso", "hospitality/coffee_latte")
    images = json.loads((valid / "catalog.json").read_text())["images"]
    images.append(entry("hospitality", "coffee_latte"))

    assert problems_of(valid, *images) == [
        "same drawing under 2 names: hospitality/coffee_espresso, hospitality/coffee_latte "
        "(one drawing, one file: keep the name that describes it)"
    ]


def test_every_group_of_copies_is_listed_even_without_entries(valid: Path) -> None:
    copy_image(valid, "hospitality/coffee_espresso", "fitness/water")
    copy_image(valid, "hospitality/coffee_espresso", "beauty_hair/zz_copy")
    copy_image(valid, "beauty_hair/corte_senora", "beauty_hair/corte_tijera")

    copies = [problem for problem in catalog.validate(valid) if problem.startswith("same drawing")]

    assert copies == [
        "same drawing under 2 names: beauty_hair/corte_senora, beauty_hair/corte_tijera "
        "(one drawing, one file: keep the name that describes it)",
        "same drawing under 3 names: beauty_hair/zz_copy, fitness/water, hospitality/coffee_espresso "
        "(one drawing, one file: keep the name that describes it)",
    ]


def test_images_that_differ_by_one_byte_are_two_drawings(valid: Path) -> None:
    copy_image(valid, "hospitality/coffee_espresso", "hospitality/coffee_latte")
    path = valid / "hospitality" / "coffee_latte.webp"
    path.write_bytes(path.read_bytes() + b"\0")
    images = json.loads((valid / "catalog.json").read_text())["images"]
    images.append(entry("hospitality", "coffee_latte"))

    assert problems_of(valid, *images) == []


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


# -- references: the Hub's templates (ERPlora/blueprints#5) -----------------------------------
#
# The Hub's templates (base/seeds/<vertical>.<language>.json of ERPlora/hub) name images of this library as
# catalog:<folder>/<name>, and the Hub's CI loads them against this repository's main: a drawing a template uses
# that leaves the manifest turns the whole Hub red. The check fails here, in the library's pull request, first.


def write_seed(path: Path, *references: str, extra: dict | None = None) -> Path:
    """A template like the Hub's: rows of datasets, each naming its image wherever the seed puts it."""
    path.parent.mkdir(parents=True, exist_ok=True)
    rows = [{"name": f"Row {index}", "image": reference} for index, reference in enumerate(references)]
    document = {"vertical": "restaurant", "data": {"inventory.product": rows, **(extra or {})}}
    path.write_text(json.dumps(document, ensure_ascii=False), encoding="utf-8")
    return path


def test_references_in_the_manifest_have_no_problems(valid: Path, tmp_path: Path) -> None:
    seed = write_seed(tmp_path / "restaurant.es.json", "catalog:hospitality/coffee_espresso")

    assert catalog.missing_references(valid, [seed]) == []


def test_a_reference_missing_from_the_manifest_names_the_template_and_the_reference(
    valid: Path, tmp_path: Path
) -> None:
    seed = write_seed(
        tmp_path / "restaurant.es.json", "catalog:hospitality/coffee_espresso", "catalog:hospitality/tonica"
    )

    assert catalog.missing_references(valid, [seed]) == [
        f"{seed}: catalog:hospitality/tonica is not in the manifest"
    ]


def test_the_manifest_decides_not_the_files(valid: Path, tmp_path: Path) -> None:
    # The Hub serves and offers only what the manifest names: a file without its entry is gone for it.
    make_image(valid, "hospitality", "tonica")
    seed = write_seed(tmp_path / "restaurant.es.json", "catalog:hospitality/tonica")

    assert catalog.missing_references(valid, [seed]) == [
        f"{seed}: catalog:hospitality/tonica is not in the manifest"
    ]


def test_a_reference_anywhere_in_the_template_is_checked(valid: Path, tmp_path: Path) -> None:
    services = [{"name": "Corte", "photo": {"main": "catalog:beauty_hair/mechas"}}]
    seed = write_seed(tmp_path / "hair_salon.es.json", extra={"service.service": services})

    assert catalog.missing_references(valid, [seed]) == [
        f"{seed}: catalog:beauty_hair/mechas is not in the manifest"
    ]


def test_only_a_whole_value_is_a_reference(valid: Path, tmp_path: Path) -> None:
    # As the Hub reads it (base/image_catalog.py, REFERENCE_RE): the whole string, nothing else.
    seed = write_seed(
        tmp_path / "restaurant.es.json",
        "catalog:hospitality/coffee_espresso",
        "Photo: catalog:hospitality/tonica",
        "catalog:Hospitality/tonica",
        "file:inventory/products/0193.webp",
        extra={"catalog:hospitality/tonica": []},
    )

    assert catalog.missing_references(valid, [seed]) == []


def test_a_reference_missing_twice_in_a_template_is_listed_once(valid: Path, tmp_path: Path) -> None:
    seed = write_seed(
        tmp_path / "restaurant.es.json",
        "catalog:hospitality/tonica",
        "catalog:hospitality/coffee_espresso",
        "catalog:hospitality/tonica",
        "catalog:hospitality/agua_mineral",
    )

    assert catalog.missing_references(valid, [seed]) == [
        f"{seed}: catalog:hospitality/agua_mineral is not in the manifest",
        f"{seed}: catalog:hospitality/tonica is not in the manifest",
    ]


def test_a_folder_checks_every_template_in_it(valid: Path, tmp_path: Path) -> None:
    seeds = tmp_path / "seeds"
    restaurant = write_seed(seeds / "restaurant.es.json", "catalog:hospitality/tonica")
    write_seed(seeds / "hair_salon.es.json", "catalog:beauty_hair/corte_senora")
    hair_en = write_seed(seeds / "hair_salon.en.json", "catalog:beauty_hair/mechas")
    (seeds / "README.md").write_text("catalog:hospitality/not_a_template\n", encoding="utf-8")

    assert catalog.missing_references(valid, [seeds]) == [
        f"{hair_en}: catalog:beauty_hair/mechas is not in the manifest",
        f"{restaurant}: catalog:hospitality/tonica is not in the manifest",
    ]


def test_templates_without_any_reference_are_a_problem(valid: Path, tmp_path: Path) -> None:
    # A check that finds nothing to check must not pass: the Hub moving its templates would turn it green forever.
    seeds = tmp_path / "seeds"
    write_seed(seeds / "restaurant.es.json")

    assert catalog.missing_references(valid, [seeds]) == [
        f"no catalog:<folder>/<name> reference in {seeds}: nothing was checked"
    ]


def test_a_folder_without_templates_is_a_problem(valid: Path, tmp_path: Path) -> None:
    seeds = tmp_path / "seeds"
    seeds.mkdir()
    other = write_seed(tmp_path / "restaurant.es.json", "catalog:hospitality/coffee_espresso")

    assert catalog.missing_references(valid, [seeds, other]) == [f"{seeds}: no JSON template in it"]


def test_a_path_that_does_not_exist_is_a_problem(valid: Path, tmp_path: Path) -> None:
    gone = tmp_path / "hub" / "base" / "seeds"
    other = write_seed(tmp_path / "restaurant.es.json", "catalog:hospitality/coffee_espresso")

    assert catalog.missing_references(valid, [gone, other]) == [f"{gone}: not found"]


def test_a_template_that_is_not_json_is_a_problem(valid: Path, tmp_path: Path) -> None:
    broken = tmp_path / "restaurant.es.json"
    broken.write_text("{not json", encoding="utf-8")
    other = write_seed(tmp_path / "hair_salon.es.json", "catalog:hospitality/coffee_espresso")

    problems = catalog.missing_references(valid, [broken, other])

    assert len(problems) == 1
    assert problems[0].startswith(f"{broken}: not valid JSON (")


def test_an_unreadable_manifest_is_a_problem(img: Path, tmp_path: Path) -> None:
    seed = write_seed(tmp_path / "restaurant.es.json", "catalog:hospitality/coffee_espresso")

    assert catalog.missing_references(img, [seed]) == ["catalog.json not found"]


# -- references: the Hub's e2e tests (ERPlora/blueprints#8) ----------------------------------
#
# The Hub's e2e tests (tests/e2e/*.ts of ERPlora/hub) pick an image of this library and expect it back, both as the
# reference the product keeps ('catalog:<folder>/<name>') and as the URL the Hub serves it at
# ('/p/catalog/<folder>/<name>.webp'). They do not run in the Hub's CI, so a drawing they use that leaves the
# manifest breaks them silently (ERPlora/hub#706): the check reads them too, as whole string literals only.


def write_spec(path: Path, *lines: str) -> Path:
    """A TypeScript file like the Hub's e2e tests, made of the given lines."""
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(("import { expect, test } from '@playwright/test';", *lines)) + "\n", encoding="utf-8")
    return path


def test_an_e2e_test_naming_a_missing_drawing_names_the_file_and_the_reference(valid: Path, tmp_path: Path) -> None:
    spec = write_spec(
        tmp_path / "e2e" / "combo-photo.spec.ts",
        "  expect(await detail(page, daily.id)).toMatchObject({ image: 'catalog:hospitality/menu_dia' });",
    )

    assert catalog.missing_references(valid, [spec]) == [
        f"{spec}: catalog:hospitality/menu_dia is not in the manifest"
    ]


def test_the_url_an_e2e_test_loads_names_its_drawing(valid: Path, tmp_path: Path) -> None:
    spec = write_spec(
        tmp_path / "e2e" / "inventory-photo.spec.ts", "const LIBRARY_URL = '/p/catalog/hospitality/tonica.webp';"
    )

    assert catalog.missing_references(valid, [spec]) == [
        f"{spec}: catalog:hospitality/tonica is not in the manifest"
    ]


def test_drawings_of_the_manifest_named_by_an_e2e_test_have_no_problems(valid: Path, tmp_path: Path) -> None:
    spec = write_spec(
        tmp_path / "e2e" / "service-photo.spec.ts",
        "const LIBRARY_URL = '/p/catalog/beauty_hair/corte_senora.webp';",
        "  expect(saved).toMatchObject({ image: 'catalog:beauty_hair/corte_senora', image_url: LIBRARY_URL });",
    )

    assert catalog.missing_references(valid, [spec]) == []


def test_every_quote_of_typescript_holds_a_reference(valid: Path, tmp_path: Path) -> None:
    spec = write_spec(
        tmp_path / "e2e" / "photo.spec.ts",
        'const DOUBLE = "catalog:hospitality/tonica";',
        "const TEMPLATE = `/p/catalog/beauty_hair/mechas.webp`;",
        "const SINGLE = 'catalog:hospitality/agua_mineral';",
    )

    assert catalog.missing_references(valid, [spec]) == [
        f"{spec}: catalog:beauty_hair/mechas is not in the manifest",
        f"{spec}: catalog:hospitality/agua_mineral is not in the manifest",
        f"{spec}: catalog:hospitality/tonica is not in the manifest",
    ]


def test_only_a_whole_string_literal_is_a_reference_in_an_e2e_test(valid: Path, tmp_path: Path) -> None:
    # Strict on purpose: a guard that reads prose or patterns as references would turn the library red for nothing.
    spec = write_spec(
        tmp_path / "e2e" / "photo.spec.ts",
        "const KEPT = 'catalog:hospitality/coffee_espresso';",
        "// the library's tray (catalog:hospitality/tonica) and its URL /p/catalog/hospitality/tonica.webp",
        "const PROSE = 'Photo: catalog:hospitality/tonica';",
        "const UPPER = 'catalog:Hospitality/tonica';",
        "const WITH_EXTENSION = 'catalog:hospitality/tonica.webp';",
        "const NO_EXTENSION = '/p/catalog/hospitality/tonica';",
        "const PNG = '/p/catalog/hospitality/tonica.png';",
        "const ABSOLUTE = 'https://hub.erplora.com/p/catalog/hospitality/tonica.webp';",
        "const MIXED = 'catalog:hospitality/tonica\";",
        "const BUILT = `/p/catalog/${folder}/tonica.webp`;",
        "const TESTID = '[data-testid=combo-menu-form-image-library-modal-image-hospitality-tonica]';",
        r"expect(saved.image).toMatch(/^file:combo\/combos\/[0-9a-f]+\.webp$/);",
    )

    assert catalog.missing_references(valid, [spec]) == []


def test_a_reference_missing_twice_in_an_e2e_test_is_listed_once(valid: Path, tmp_path: Path) -> None:
    spec = write_spec(
        tmp_path / "e2e" / "combo-photo.spec.ts",
        "const LIBRARY_URL = '/p/catalog/hospitality/menu_dia.webp';",
        "  expect(saved).toMatchObject({ image: 'catalog:hospitality/menu_dia', image_url: LIBRARY_URL });",
    )

    assert catalog.missing_references(valid, [spec]) == [
        f"{spec}: catalog:hospitality/menu_dia is not in the manifest"
    ]


def test_templates_and_e2e_tests_are_checked_together(valid: Path, tmp_path: Path) -> None:
    seeds = tmp_path / "hub" / "base" / "seeds"
    seed = write_seed(seeds / "restaurant.es.json", "catalog:hospitality/tonica")
    e2e = tmp_path / "hub" / "tests" / "e2e"
    combo = write_spec(e2e / "combo-photo.spec.ts", "const I = 'catalog:hospitality/menu_dia';")
    helpers = write_spec(e2e / "helpers.ts", "export const A = 'catalog:hospitality/coffee_espresso';")

    assert catalog.missing_references(valid, [seeds, combo, helpers]) == [
        f"{seed}: catalog:hospitality/tonica is not in the manifest",
        f"{combo}: catalog:hospitality/menu_dia is not in the manifest",
    ]


def test_e2e_tests_without_any_reference_are_a_problem(valid: Path, tmp_path: Path) -> None:
    # The Hub dropping or moving its photo tests must not leave the check green forever.
    spec = write_spec(tmp_path / "e2e" / "helpers.ts", "export const A = 1;")

    assert catalog.missing_references(valid, [spec]) == [
        f"no catalog:<folder>/<name> reference in {spec}: nothing was checked"
    ]


def test_an_e2e_test_that_is_not_utf8_is_a_problem(valid: Path, tmp_path: Path) -> None:
    broken = tmp_path / "e2e" / "broken.spec.ts"
    broken.parent.mkdir(parents=True)
    broken.write_bytes(b"const A = '\xff';\n")
    other = write_spec(tmp_path / "e2e" / "photo.spec.ts", "const A = 'catalog:hospitality/coffee_espresso';")

    problems = catalog.missing_references(valid, [broken, other])

    assert len(problems) == 1
    assert problems[0].startswith(f"{broken}: not valid UTF-8 (")


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


def test_references_command_exits_zero_and_counts_what_it_checked(
    valid: Path, tmp_path: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    seeds = tmp_path / "seeds"
    write_seed(seeds / "restaurant.es.json", "catalog:hospitality/coffee_espresso")
    write_seed(seeds / "restaurant.en.json", "catalog:hospitality/coffee_espresso")
    write_seed(seeds / "hair_salon.es.json", "catalog:beauty_hair/corte_senora")

    assert catalog.main(["references", str(seeds), "--img", str(valid)]) == 0
    assert capsys.readouterr().out == (
        f"OK: the 2 images named by 3 files of the Hub are in {valid}/catalog.json\n"
    )


def test_references_command_counts_the_e2e_tests_it_checked(
    valid: Path, tmp_path: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    e2e = tmp_path / "e2e"
    combo = write_spec(e2e / "combo-photo.spec.ts", "const I = 'catalog:hospitality/coffee_espresso';")
    service = write_spec(e2e / "service-photo.spec.ts", "const U = '/p/catalog/beauty_hair/corte_senora.webp';")
    helpers = write_spec(e2e / "helpers.ts", "export const A = 1;")

    assert catalog.main(["references", str(combo), str(service), str(helpers), "--img", str(valid)]) == 0
    assert capsys.readouterr().out == (
        f"OK: the 2 images named by 3 files of the Hub are in {valid}/catalog.json\n"
    )


def test_references_command_exits_one_and_says_how_to_retire_a_drawing(
    valid: Path, tmp_path: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    seed = write_seed(tmp_path / "restaurant.es.json", "catalog:hospitality/tonica")

    assert catalog.main(["references", str(seed), "--img", str(valid)]) == 1
    assert capsys.readouterr().out == (
        f"FAILED: 1 problem(s) with the images the Hub names and {valid}/catalog.json:\n"
        f"  - {seed}: catalog:hospitality/tonica is not in the manifest\n"
        "A drawing a template or an e2e test of the Hub uses is never retired or renamed in one step: "
        "add the new name here, move the template or the test in ERPlora/hub, then retire the old name.\n"
    )


def test_references_command_fails_on_an_e2e_test_naming_a_missing_drawing(
    valid: Path, tmp_path: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    spec = write_spec(
        tmp_path / "e2e" / "combo-photo.spec.ts", "const LIBRARY_URL = '/p/catalog/hospitality/menu_dia.webp';"
    )

    assert catalog.main(["references", str(spec), "--img", str(valid)]) == 1
    assert capsys.readouterr().out == (
        f"FAILED: 1 problem(s) with the images the Hub names and {valid}/catalog.json:\n"
        f"  - {spec}: catalog:hospitality/menu_dia is not in the manifest\n"
        "A drawing a template or an e2e test of the Hub uses is never retired or renamed in one step: "
        "add the new name here, move the template or the test in ERPlora/hub, then retire the old name.\n"
    )


def test_references_command_gives_the_retire_steps_only_for_a_missing_reference(
    valid: Path, tmp_path: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    gone = tmp_path / "hub" / "base" / "seeds"

    assert catalog.main(["references", str(gone), "--img", str(valid)]) == 1
    assert capsys.readouterr().out == (
        f"FAILED: 1 problem(s) with the images the Hub names and {valid}/catalog.json:\n"
        f"  - {gone}: not found\n"
    )


def test_references_command_needs_a_path(valid: Path) -> None:
    with pytest.raises(SystemExit) as exit_info:
        catalog.main(["references", "--img", str(valid)])
    assert exit_info.value.code == 2


@pytest.mark.parametrize("command", ["build", "validate"])
def test_build_and_validate_take_no_path(valid: Path, tmp_path: Path, command: str) -> None:
    with pytest.raises(SystemExit) as exit_info:
        catalog.main([command, str(tmp_path), "--img", str(valid)])
    assert exit_info.value.code == 2


def test_the_default_library_is_the_repository_img_folder() -> None:
    assert catalog.DEFAULT_IMG == REPO_IMG


# -- the real library -------------------------------------------------------------------------


def test_the_library_manifest_is_complete() -> None:
    assert catalog.validate(REPO_IMG) == []
    assert len(read(REPO_IMG)["images"]) == len(list(REPO_IMG.glob("*/*.webp")))


def test_the_pre_push_hook_checks_the_hubs_templates_on_every_push() -> None:
    # The Hub's templates live in ERPlora/hub (public, no token): the pre-push hook fetches them from its main
    # beside the checkout of the pushed commit and runs the check, so a push that retires a drawing they use is
    # aborted (GitHub Actions is kept for ERPlora/aws only: the validate workflow that did this is gone).
    hook = (REPO_IMG.parent / ".githooks" / "pre-push").read_text(encoding="utf-8")

    assert "https://github.com/ERPlora/hub.git ../hub" in hook
    assert "sparse-checkout set base/seeds" in hook
    assert "python scripts/catalog.py references ../hub/base/seeds" in hook


def test_the_pre_push_hook_checks_the_hubs_e2e_tests_on_every_push() -> None:
    # The Hub's e2e tests (tests/e2e/*.ts) do not run in the Hub's CI: a renamed drawing they expect breaks them
    # silently (ERPlora/hub#706). The pre-push hook fetches them with the templates and checks every TypeScript
    # file of the folder; a glob that matches nothing reaches the command as a path that is not found, and fails.
    hook = (REPO_IMG.parent / ".githooks" / "pre-push").read_text(encoding="utf-8")

    assert "sparse-checkout set base/seeds tests/e2e" in hook
    assert "python scripts/catalog.py references ../hub/tests/e2e/*.ts" in hook
