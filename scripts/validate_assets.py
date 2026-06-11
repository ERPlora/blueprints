#!/usr/bin/env python3
"""Gate de validación de la librería de assets.

Reglas (ver architecture/blueprints/README.md §1):
- Bajo ``assets/`` solo puede haber ficheros ``.webp``.
- Nombre de fichero ``snake_case.webp`` ([a-z0-9] separados por ``_``).
- Carpetas de sector también en snake_case.
- Cada WebP debe ser un WebP real (no un .jpg renombrado) de exactamente 512x512.

Uso:
    python scripts/validate_assets.py [ruta_assets]

Sale con código 0 si todo es válido; 1 si hay violaciones (las lista todas).
Requiere Pillow para la comprobación de formato/dimensiones.
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

from PIL import Image

SNAKE_CASE_FILE = re.compile(r"^[a-z0-9]+(_[a-z0-9]+)*\.webp$")
SNAKE_CASE_DIR = re.compile(r"^[a-z0-9]+(_[a-z0-9]+)*$")
EXPECTED_SIZE = (512, 512)


def validate(assets_dir: Path) -> list[str]:
    errors: list[str] = []

    if not assets_dir.is_dir():
        return [f"No existe el directorio de assets: {assets_dir}"]

    for path in sorted(assets_dir.rglob("*")):
        rel = path.relative_to(assets_dir.parent)

        if path.is_dir():
            if not SNAKE_CASE_DIR.match(path.name):
                errors.append(f"{rel}: carpeta no snake_case")
            continue

        if path.name == ".gitkeep":
            continue

        if path.suffix.lower() != ".webp":
            errors.append(f"{rel}: fichero no-WebP (solo se permiten .webp)")
            continue

        if not SNAKE_CASE_FILE.match(path.name):
            errors.append(f"{rel}: nombre no snake_case.webp")

        try:
            with Image.open(path) as im:
                if im.format != "WEBP":
                    errors.append(
                        f"{rel}: extensión .webp pero formato real {im.format}"
                    )
                if im.size != EXPECTED_SIZE:
                    errors.append(
                        f"{rel}: dimensiones {im.size[0]}x{im.size[1]} "
                        f"(esperado {EXPECTED_SIZE[0]}x{EXPECTED_SIZE[1]})"
                    )
        except Exception as exc:  # noqa: BLE001 — fichero corrupto/no imagen
            errors.append(f"{rel}: no se puede abrir como imagen ({exc})")

    return errors


def main() -> int:
    assets_dir = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("assets")
    errors = validate(assets_dir)

    total = sum(1 for _ in assets_dir.rglob("*.webp")) if assets_dir.is_dir() else 0
    if errors:
        print(f"FALLO: {len(errors)} violacion(es) en {assets_dir}/:\n")
        for err in errors:
            print(f"  - {err}")
        return 1

    print(
        f"OK: {total} WebP validados en {assets_dir}/ (512x512, snake_case, solo WebP)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
