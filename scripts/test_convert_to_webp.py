"""Tests for scripts/convert_to_webp.py, which turns PNG/JPG sources into library WebPs."""

from __future__ import annotations

from pathlib import Path

import pytest
from PIL import Image

import convert_to_webp


def make_image(path: Path, size=(100, 50), fmt="PNG", mode="RGB") -> Path:
    path.parent.mkdir(parents=True, exist_ok=True)
    Image.new(mode, size).save(path, fmt)
    return path


def run_main(monkeypatch: pytest.MonkeyPatch, *args: str) -> None:
    monkeypatch.setattr("sys.argv", ["convert_to_webp.py", *args])
    convert_to_webp.main()


def test_a_png_becomes_a_512_square_webp_next_to_it(tmp_path: Path) -> None:
    src = make_image(tmp_path / "bread.png")

    assert convert_to_webp.convert_image(src, quality=85, dry_run=False) is True

    with Image.open(tmp_path / "bread.webp") as im:
        assert (im.format, im.size) == ("WEBP", (512, 512))


def test_a_palette_image_is_converted(tmp_path: Path) -> None:
    src = make_image(tmp_path / "logo.png", mode="P")

    assert convert_to_webp.convert_image(src, quality=85, dry_run=False) is True
    with Image.open(tmp_path / "logo.webp") as im:
        assert im.format == "WEBP"


def test_an_existing_webp_is_never_overwritten(tmp_path: Path) -> None:
    src = make_image(tmp_path / "bread.png")
    (tmp_path / "bread.webp").write_bytes(b"keep me")

    assert convert_to_webp.convert_image(src, quality=85, dry_run=False) is False
    assert (tmp_path / "bread.webp").read_bytes() == b"keep me"


def test_dry_run_writes_nothing_and_says_it_would_resize(
    tmp_path: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    src = make_image(tmp_path / "bread.png")

    assert convert_to_webp.convert_image(src, quality=85, dry_run=True) is True
    assert not (tmp_path / "bread.webp").exists()
    assert capsys.readouterr().out == "  [dry-run] bread.png -> bread.webp (resize 100x50)\n"


def test_a_corrupt_source_is_reported_and_skipped(
    tmp_path: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    src = tmp_path / "broken.png"
    src.write_bytes(b"not an image")

    assert convert_to_webp.convert_image(src, quality=85, dry_run=False) is False
    assert not (tmp_path / "broken.webp").exists()
    assert capsys.readouterr().out.startswith("  [error] broken.png: ")


def test_a_lower_quality_gives_a_smaller_file(tmp_path: Path) -> None:
    noisy = Image.effect_noise((512, 512), 64).convert("RGB")
    noisy.save(tmp_path / "low.png")
    noisy.save(tmp_path / "high.png")

    convert_to_webp.convert_image(tmp_path / "low.png", quality=10, dry_run=False)
    convert_to_webp.convert_image(tmp_path / "high.png", quality=95, dry_run=False)

    assert (tmp_path / "low.webp").stat().st_size < (tmp_path / "high.webp").stat().st_size


def test_a_directory_yields_its_png_and_jpg_sources_but_not_webp(tmp_path: Path) -> None:
    a = make_image(tmp_path / "retail" / "a.png")
    b = make_image(tmp_path / "retail" / "sub" / "b.jpg", fmt="JPEG")
    c = make_image(tmp_path / "retail" / "c.jpeg", fmt="JPEG")
    make_image(tmp_path / "retail" / "d.webp", fmt="WEBP")

    assert convert_to_webp.collect_sources([str(tmp_path / "retail")]) == [a, b, c]


def test_a_missing_path_aborts(tmp_path: Path) -> None:
    with pytest.raises(SystemExit) as exit_info:
        convert_to_webp.collect_sources([str(tmp_path / "nope.png")])

    assert exit_info.value.code == 1


def test_an_unsupported_file_aborts(tmp_path: Path) -> None:
    gif = make_image(tmp_path / "anim.gif", fmt="GIF")

    with pytest.raises(SystemExit) as exit_info:
        convert_to_webp.collect_sources([str(gif)])

    assert exit_info.value.code == 1


def test_no_path_means_the_whole_library(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    src = make_image(tmp_path / "img" / "retail" / "bread.png")
    monkeypatch.setattr(convert_to_webp, "ASSETS_DIR", tmp_path / "img")

    assert convert_to_webp.collect_sources([]) == [src]


def test_main_converts_and_deletes_the_originals_when_asked(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    make_image(tmp_path / "bread.png")
    make_image(tmp_path / "milk.png")
    (tmp_path / "milk.webp").write_bytes(b"already there")

    run_main(monkeypatch, str(tmp_path), "--delete-originals")

    assert sorted(p.name for p in tmp_path.iterdir()) == ["bread.webp", "milk.png", "milk.webp"]
    out = capsys.readouterr().out
    assert "Converted: 1\n" in out
    assert "Skipped (webp exists): 1\n" in out


def test_main_dry_run_changes_nothing(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    make_image(tmp_path / "bread.png")

    run_main(monkeypatch, str(tmp_path), "--dry-run", "--delete-originals")

    assert [p.name for p in tmp_path.iterdir()] == ["bread.png"]
    assert "** DRY RUN — no files will be modified **" in capsys.readouterr().out
