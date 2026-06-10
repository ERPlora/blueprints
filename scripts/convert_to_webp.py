#!/usr/bin/env python3
"""
Convert PNG and JPG images under assets/ to WebP format (512x512, quality 85).

Usage:
    python scripts/convert_to_webp.py [paths ...] [--quality 85] [--delete-originals] [--dry-run]

Arguments:
    paths               Optional image files or directories to convert.
                        Defaults to the whole assets/ tree.

Options:
    --quality N         WebP quality (1-100, default 85)
    --delete-originals  Delete original PNG/JPG files after conversion
    --dry-run           Show what would be done without converting
"""

import argparse
import sys
from pathlib import Path

try:
    from PIL import Image
except ImportError:
    print("Error: Pillow is required. Install with: pip3 install Pillow")
    sys.exit(1)

REPO_ROOT = Path(__file__).resolve().parent.parent
ASSETS_DIR = REPO_ROOT / "assets"
# Legacy layout (pre-73295d7); kept as fallback for old checkouts.
LEGACY_ASSETS_DIR = REPO_ROOT / "data" / "assets"

TARGET_SIZE = (512, 512)
SOURCE_SUFFIXES = (".png", ".jpg", ".jpeg")


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


def collect_sources(paths: list[str]) -> list[Path]:
    """Resolve CLI paths (or the assets/ tree) into a list of source images."""
    if paths:
        files: list[Path] = []
        for raw in paths:
            p = Path(raw)
            if not p.exists():
                print(f"Error: path not found: {p}")
                sys.exit(1)
            if p.is_dir():
                files.extend(
                    f
                    for suffix in SOURCE_SUFFIXES
                    for f in sorted(p.rglob(f"*{suffix}"))
                )
            elif p.suffix.lower() in SOURCE_SUFFIXES:
                files.append(p)
            else:
                print(f"Error: unsupported file type (expected PNG/JPG): {p}")
                sys.exit(1)
        return files

    assets_dir = ASSETS_DIR if ASSETS_DIR.exists() else LEGACY_ASSETS_DIR
    if not assets_dir.exists():
        print(f"Error: Assets directory not found: {ASSETS_DIR}")
        sys.exit(1)

    return [
        f for suffix in SOURCE_SUFFIXES for f in sorted(assets_dir.rglob(f"*{suffix}"))
    ]


def main():
    parser = argparse.ArgumentParser(description="Convert images to WebP (512x512)")
    parser.add_argument(
        "paths",
        nargs="*",
        help="Image files or directories to convert (default: whole assets/ tree)",
    )
    parser.add_argument(
        "--quality", type=int, default=85, help="WebP quality (default 85)"
    )
    parser.add_argument(
        "--delete-originals",
        action="store_true",
        help="Delete originals after conversion",
    )
    parser.add_argument(
        "--dry-run", action="store_true", help="Show what would be done"
    )
    args = parser.parse_args()

    all_files = collect_sources(args.paths)

    print(f"Found {len(all_files)} PNG/JPG images")
    print(f"Quality: {args.quality}, Delete originals: {args.delete_originals}")
    if args.dry_run:
        print("** DRY RUN — no files will be modified **")
    print()

    converted = 0
    skipped = 0
    errors = 0
    saved_bytes = 0

    by_dir: dict[Path, list[Path]] = {}
    for f in all_files:
        by_dir.setdefault(f.parent, []).append(f)

    for parent in sorted(by_dir):
        files = by_dir[parent]
        print(f"[{parent.name}] {len(files)} images")

        for src in files:
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

    print()
    print("Done.")


if __name__ == "__main__":
    main()
