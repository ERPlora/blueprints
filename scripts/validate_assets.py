#!/usr/bin/env python3
"""Validation gate for the image library.

Rules (see README.md, «Convenciones»):
- Only ``.webp`` files may live under ``img/``, plus the manifest ``img/catalog.json``
  (its contract is checked by ``scripts/catalog.py validate``).
- File names are ``snake_case.webp`` ([a-z0-9] joined by ``_``).
- Sector folders are snake_case too.
- Every WebP must be a real WebP (not a renamed .jpg) of exactly 512x512.

Usage:
    python scripts/validate_assets.py [assets_dir]

Exits 0 when everything is valid, 1 when there are violations (it lists all of them).
Needs Pillow to check the format and the size.
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

from PIL import Image

SNAKE_CASE_FILE = re.compile(r"^[a-z0-9]+(_[a-z0-9]+)*\.webp$")
SNAKE_CASE_DIR = re.compile(r"^[a-z0-9]+(_[a-z0-9]+)*$")
EXPECTED_SIZE = (512, 512)
MANIFEST_NAME = "catalog.json"


def validate(assets_dir: Path) -> list[str]:
    errors: list[str] = []

    if not assets_dir.is_dir():
        return [f"Assets directory not found: {assets_dir}"]

    for path in sorted(assets_dir.rglob("*")):
        rel = path.relative_to(assets_dir.parent)

        if path.is_dir():
            if not SNAKE_CASE_DIR.match(path.name):
                errors.append(f"{rel}: folder is not snake_case")
            continue

        if path.name == ".gitkeep":
            continue

        if path.name == MANIFEST_NAME and path.parent == assets_dir:
            continue

        if path.suffix.lower() != ".webp":
            errors.append(f"{rel}: not a WebP file (only .webp is allowed)")
            continue

        if not SNAKE_CASE_FILE.match(path.name):
            errors.append(f"{rel}: name is not snake_case.webp")

        try:
            with Image.open(path) as im:
                if im.format != "WEBP":
                    errors.append(f"{rel}: .webp extension but actual format {im.format}")
                if im.size != EXPECTED_SIZE:
                    errors.append(
                        f"{rel}: size {im.size[0]}x{im.size[1]} "
                        f"(expected {EXPECTED_SIZE[0]}x{EXPECTED_SIZE[1]})"
                    )
        except Exception as exc:  # noqa: BLE001 — corrupt file or not an image: reported, not raised
            errors.append(f"{rel}: cannot be opened as an image ({exc})")

    return errors


def main() -> int:
    assets_dir = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("img")
    errors = validate(assets_dir)

    total = sum(1 for _ in assets_dir.rglob("*.webp")) if assets_dir.is_dir() else 0
    if errors:
        print(f"FAILED: {len(errors)} violation(s) in {assets_dir}/:\n")
        for err in errors:
            print(f"  - {err}")
        return 1

    print(f"OK: {total} WebP files validated in {assets_dir}/ (512x512, snake_case, WebP only)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
