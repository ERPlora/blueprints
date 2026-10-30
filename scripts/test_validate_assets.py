"""Tests for scripts/validate_assets.py, the gate every image under img/ must pass."""

from __future__ import annotations

from pathlib import Path

import pytest
from PIL import Image

import validate_assets


def make_image(path: Path, size=(512, 512), fmt="WEBP") -> Path:
    path.parent.mkdir(parents=True, exist_ok=True)
    Image.new("RGB", size, "white").save(path, fmt)
    return path


@pytest.fixture
def assets(tmp_path: Path) -> Path:
    root = tmp_path / "img"
    make_image(root / "hospitality" / "coffee_espresso.webp")
    make_image(root / "beauty_hair" / "corte_senora.webp")
    return root


def test_a_clean_library_has_no_violations(assets: Path) -> None:
    assert validate_assets.validate(assets) == []


def test_a_missing_directory_is_reported(tmp_path: Path) -> None:
    errors = validate_assets.validate(tmp_path / "nope")

    assert errors == [f"Assets directory not found: {tmp_path / 'nope'}"]


def test_gitkeep_is_ignored(assets: Path) -> None:
    (assets / "fitness").mkdir()
    (assets / "fitness" / ".gitkeep").write_text("")

    assert validate_assets.validate(assets) == []


def test_the_manifest_at_the_root_of_the_library_is_allowed(assets: Path) -> None:
    (assets / "catalog.json").write_text('{"version": 1, "images": []}')

    assert validate_assets.validate(assets) == []


def test_a_manifest_inside_a_folder_is_not_allowed(assets: Path) -> None:
    (assets / "retail").mkdir()
    (assets / "retail" / "catalog.json").write_text("{}")

    assert validate_assets.validate(assets) == [
        "img/retail/catalog.json: not a WebP file (only .webp is allowed)"
    ]


def test_a_file_that_is_not_webp_is_rejected(assets: Path) -> None:
    make_image(assets / "retail" / "bread.png", fmt="PNG")

    assert validate_assets.validate(assets) == [
        "img/retail/bread.png: not a WebP file (only .webp is allowed)"
    ]


def test_a_name_that_is_not_snake_case_is_rejected(assets: Path) -> None:
    make_image(assets / "retail" / "Bread-Loaf.webp")

    assert validate_assets.validate(assets) == [
        "img/retail/Bread-Loaf.webp: name is not snake_case.webp"
    ]


def test_a_folder_that_is_not_snake_case_is_rejected(assets: Path) -> None:
    make_image(assets / "Wellness-Spa" / "sauna.webp")

    assert validate_assets.validate(assets) == ["img/Wellness-Spa: folder is not snake_case"]


def test_a_renamed_png_is_rejected_by_its_real_format(assets: Path) -> None:
    make_image(assets / "retail" / "bread.webp", fmt="PNG")

    assert validate_assets.validate(assets) == [
        "img/retail/bread.webp: .webp extension but actual format PNG"
    ]


def test_an_image_that_is_not_512_square_is_rejected(assets: Path) -> None:
    make_image(assets / "retail" / "bread.webp", size=(512, 256))

    assert validate_assets.validate(assets) == [
        "img/retail/bread.webp: size 512x256 (expected 512x512)"
    ]


def test_a_corrupt_file_is_reported_not_raised(assets: Path) -> None:
    (assets / "retail").mkdir()
    (assets / "retail" / "bread.webp").write_bytes(b"not an image")

    [error] = validate_assets.validate(assets)

    assert error.startswith("img/retail/bread.webp: cannot be opened as an image (")


def test_every_violation_is_listed(assets: Path) -> None:
    make_image(assets / "retail" / "Bread.webp", size=(10, 10))
    make_image(assets / "retail" / "milk.jpg", fmt="JPEG")

    assert validate_assets.validate(assets) == [
        "img/retail/Bread.webp: name is not snake_case.webp",
        "img/retail/Bread.webp: size 10x10 (expected 512x512)",
        "img/retail/milk.jpg: not a WebP file (only .webp is allowed)",
    ]


def test_main_exits_zero_and_counts_the_images(
    assets: Path, monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    monkeypatch.setattr("sys.argv", ["validate_assets.py", str(assets)])

    assert validate_assets.main() == 0
    assert capsys.readouterr().out == (
        f"OK: 2 WebP files validated in {assets}/ (512x512, snake_case, WebP only)\n"
    )


def test_main_exits_one_and_lists_the_violations(
    assets: Path, monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    make_image(assets / "retail" / "bread.png", fmt="PNG")
    monkeypatch.setattr("sys.argv", ["validate_assets.py", str(assets)])

    assert validate_assets.main() == 1
    assert capsys.readouterr().out == (
        f"FAILED: 1 violation(s) in {assets}/:\n\n"
        "  - img/retail/bread.png: not a WebP file (only .webp is allowed)\n"
    )
