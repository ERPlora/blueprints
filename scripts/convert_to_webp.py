#!/usr/bin/env python3
"""
Convert all PNG and JPG images in data/assets/ to WebP format.

Usage:
    python scripts/convert_to_webp.py [--quality 85] [--delete-originals] [--dry-run]

Options:
    --quality N         WebP quality (1-100, default 85)
    --delete-originals  Delete original PNG/JPG files after conversion
    --dry-run           Show what would be done without converting
    --update-json       Update image references in data/products/es/*.json
"""

import argparse
import json
import os
import sys
from pathlib import Path

try:
    from PIL import Image
except ImportError:
    print("Error: Pillow is required. Install with: pip3 install Pillow")
    sys.exit(1)

REPO_ROOT = Path(__file__).resolve().parent.parent
ASSETS_DIR = REPO_ROOT / "data" / "assets"
PRODUCTS_DIR = REPO_ROOT / "data" / "products" / "es"


TARGET_SIZE = (512, 512)


def convert_image(src: Path, quality: int, dry_run: bool) -> bool:
    """Convert a single image to WebP at 512x512. Returns True if successful."""
    dest = src.with_suffix(".webp")

    if dest.exists():
        return False

    if dry_run:
        try:
            with Image.open(src) as img:
                w, h = img.size
                resized = "" if (w, h) == TARGET_SIZE else f" (resize {w}x{h})"
        except Exception:
            resized = ""
        print(f"  [dry-run] {src.name} -> {dest.name}{resized}")
        return True

    try:
        with Image.open(src) as img:
            # Ensure RGBA for transparency support
            if img.mode not in ("RGBA", "RGB"):
                img = img.convert("RGBA")

            # Resize to 512x512 if needed
            if img.size != TARGET_SIZE:
                img = img.resize(TARGET_SIZE, Image.LANCZOS)

            img.save(dest, "WEBP", quality=quality, lossless=False)
        return True
    except Exception as e:
        print(f"  [error] {src.name}: {e}")
        return False


def update_json_refs(ext: str, dry_run: bool) -> int:
    """Update .png/.jpg references to .webp in all JSON catalogs."""
    if not PRODUCTS_DIR.exists():
        return 0

    total = 0
    for json_file in sorted(PRODUCTS_DIR.glob("*.json")):
        text = json_file.read_text(encoding="utf-8")
        new_text = text.replace(f".{ext}\"", '.webp"')

        changes = text.count(f".{ext}\"") - new_text.count(f".{ext}\"")
        if changes > 0:
            if not dry_run:
                json_file.write_text(new_text, encoding="utf-8")
            print(f"  {json_file.name}: {changes} refs .{ext} -> .webp")
            total += changes

    return total


def main():
    parser = argparse.ArgumentParser(description="Convert images to WebP")
    parser.add_argument("--quality", type=int, default=85, help="WebP quality (default 85)")
    parser.add_argument("--delete-originals", action="store_true", help="Delete originals after conversion")
    parser.add_argument("--dry-run", action="store_true", help="Show what would be done")
    parser.add_argument("--update-json", action="store_true", help="Update JSON catalog refs")
    args = parser.parse_args()

    if not ASSETS_DIR.exists():
        print(f"Error: Assets directory not found: {ASSETS_DIR}")
        sys.exit(1)

    # Collect all PNG and JPG files
    png_files = sorted(ASSETS_DIR.rglob("*.png"))
    jpg_files = sorted(ASSETS_DIR.rglob("*.jpg"))
    all_files = png_files + jpg_files

    print(f"Found {len(png_files)} PNG + {len(jpg_files)} JPG = {len(all_files)} images")
    print(f"Quality: {args.quality}, Delete originals: {args.delete_originals}")
    if args.dry_run:
        print("** DRY RUN — no files will be modified **")
    print()

    converted = 0
    skipped = 0
    errors = 0
    saved_bytes = 0

    for sector_dir in sorted(ASSETS_DIR.iterdir()):
        if not sector_dir.is_dir():
            continue

        sector_files = [f for f in all_files if f.parent == sector_dir]
        if not sector_files:
            continue

        print(f"[{sector_dir.name}] {len(sector_files)} images")

        for src in sector_files:
            original_size = src.stat().st_size
            if convert_image(src, args.quality, args.dry_run):
                converted += 1
                if not args.dry_run:
                    webp_size = src.with_suffix(".webp").stat().st_size
                    saved_bytes += original_size - webp_size

                if args.delete_originals and not args.dry_run:
                    src.unlink()
            else:
                if src.with_suffix(".webp").exists():
                    skipped += 1
                else:
                    errors += 1

    print()
    print(f"Converted: {converted}")
    print(f"Skipped (webp exists): {skipped}")
    if errors:
        print(f"Errors: {errors}")
    if saved_bytes and not args.dry_run:
        mb = saved_bytes / (1024 * 1024)
        print(f"Space saved: {mb:.1f} MB")

    if args.update_json:
        print()
        print("Updating JSON references...")
        total_refs = 0
        for ext in ("png", "jpg"):
            refs = update_json_refs(ext, args.dry_run)
            total_refs += refs
        print(f"Total refs updated: {total_refs}")

    print()
    print("Done.")


if __name__ == "__main__":
    main()
