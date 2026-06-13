#!/usr/bin/env python3
"""Genera un catálogo starter (menú) por sector a partir de la librería de imágenes.

Mapea cada `assets/<sector>/<nombre>.webp` a una categoría de menú y le asigna un precio
por defecto (con overrides para platos premium), y escribe `starter_catalogs/<sector>.json`.

El JSON resultante es la **fuente de datos** que el Hub/Cloud usa para sembrar el catálogo
inicial de un hub nuevo de ese sector (productos + categorías de `inventory`). El `image` de
cada producto es la **s3_key** relativa (`assets/<sector>/<file>.webp`), igual que devuelve
`GET /api/v1/catalog/assets/?sector=<sector>` en Cloud, para que el consumidor construya la URL
del CDN (`erplora-storage`).

Uso:
    python scripts/build_starter_catalog.py                 # todos los sectores con reglas
    python scripts/build_starter_catalog.py hospitality     # solo un sector

Es determinista e idempotente: misma entrada → mismo JSON (orden estable, sin timestamps).
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ASSETS = ROOT / "assets"
OUT_DIR = ROOT / "starter_catalogs"

# --- Definición de categorías por sector ----------------------------------------------------
# Cada categoría: clave estable + nombre visible + icono (Iconify ion:) + precio por defecto (€).
# Las reglas son una lista ORDENADA de (categoría, [subcadenas]); gana la PRIMERA que casa, así
# que las reglas específicas van antes que las genéricas (p. ej. `cafe_helado` → cafés, no helados).

HOSPITALITY_CATEGORIES = [
    # clave            nombre                  icono                 precio
    ("cafes", "Cafés e infusiones", "cafe-outline", 1.80),
    ("refrescos", "Refrescos y zumos", "nutrition-outline", 2.20),
    ("cervezas", "Cervezas", "beer-outline", 2.50),
    ("vinos", "Vinos y vermut", "wine-outline", 3.20),
    ("cocteles", "Cócteles y copas", "wine-outline", 6.50),
    ("desayunos", "Desayunos y tostadas", "sunny-outline", 2.80),
    ("tapas", "Tapas y raciones", "restaurant-outline", 6.50),
    ("ensaladas", "Ensaladas", "leaf-outline", 7.50),
    ("arroces", "Arroces y pastas", "restaurant-outline", 11.00),
    ("pizzas", "Pizzas", "pizza-outline", 9.50),
    ("kebabs", "Kebabs y durum", "fast-food-outline", 7.00),
    ("bocadillos", "Bocadillos y wraps", "fast-food-outline", 5.00),
    ("japones", "Sushi y cocina asiática", "fish-outline", 9.50),
    ("carnes", "Carnes", "restaurant-outline", 13.50),
    ("pescados", "Pescados", "fish-outline", 14.00),
    ("menus", "Menús", "list-outline", 12.00),
    ("postres", "Postres y helados", "ice-cream-outline", 4.50),
    ("panes", "Panadería", "pizza-outline", 1.50),
    ("extras", "Extras y complementos", "add-circle-outline", 1.20),
]

# Reglas ordenadas: (categoría, subcadenas que disparan). Primera coincidencia gana.
HOSPITALITY_RULES = [
    # Cafés / infusiones (antes que helados/refrescos para `cafe_helado`, `granizado_cafe`).
    (
        "cafes",
        [
            "cafe",
            "espresso",
            "capuchino",
            "capuchino",
            "latte",
            "americano",
            "cortado",
            "bombom",
            "carajillo",
            "descafeinado",
            "chai",
            "matcha",
            "mocha",
            "flat_white",
            "frappuccino",
            "granizado_cafe",
            "te_",
            "poleo",
            "manzanilla",
        ],
    ),
    # Menús (antes que sus componentes: `menu_hamburguesa`, `menu_kebab`).
    ("menus", ["menu_", "desayuno_buffet", "mesa_dulce"]),
    # Desayunos / bollería / tostadas.
    (
        "desayunos",
        [
            "tostada",
            "croissant",
            "napolitana",
            "ensaimada",
            "magdalena",
            "muffin",
            "churros",
            "desayuno_",
            "gofre",
            "crepe",
            "bagel",
            "pincho_tortilla",
            "palmera",
        ],
    ),
    # Cócteles, combinados y chupitos.
    (
        "cocteles",
        [
            "mojito",
            "gin_tonic",
            "cuba_libre",
            "cubata",
            "ron_cola",
            "whisky_cola",
            "chupito",
        ],
    ),
    # Cervezas.
    ("cervezas", ["cerveza", "clara", "ipa", "pale_ale", "stout", "wheat_beer"]),
    # Vinos, cava, sidra, vermut, sangría, sake.
    (
        "vinos",
        [
            "vino_",
            "copa_albarino",
            "copa_cava",
            "copa_verdejo",
            "copa_rioja",
            "copa_ribera",
            "botella_",
            "vermut",
            "sangria",
            "tinto_verano",
            "sidra",
            "culin",
            "sake",
        ],
    ),
    # Refrescos, aguas, zumos, batidos, smoothies, granizados de fruta, hielo.
    (
        "refrescos",
        [
            "coca_cola",
            "fanta",
            "sprite",
            "aquarius",
            "tonica",
            "agua_",
            "limonada",
            "zumo_",
            "smoothie",
            "batido",
            "granizado",
            "hielo",
            "ayran",
        ],
    ),
    # Sushi / asiático (antes que pescados/postres: `tempura_roll` sushi, `tempura_helado` postre va abajo).
    (
        "japones",
        [
            "maki",
            "nigiri",
            "sashimi",
            "uramaki",
            "_roll",
            "california",
            "dragon",
            "poke",
            "ramen",
            "pad_thai",
            "sopa_miso",
            "edamame",
            "gyozas",
            "spring_rolls",
            "tempura_gambas",
            "tempura_verduras",
            "tempura_roll",
            "teriyaki",
            "shawarma",
            "bowl_pollo",
            "wakame",
        ],
    ),
    # Pizzas.
    ("pizzas", ["pizza_"]),
    # Kebabs / durum / falafel.
    (
        "kebabs",
        ["kebab", "durum", "lahmacun", "plato_kebab", "plato_falafel", "wrap_falafel"],
    ),
    # Arroces y pastas.
    ("arroces", ["arroz_", "paella", "fideua", "pasta_", "lasana"]),
    # Ensaladas.
    ("ensaladas", ["ensalada"]),
    # Carnes (incluye hamburguesas y perritos).
    (
        "carnes",
        [
            "entrecot",
            "solomillo",
            "secreto",
            "pollo_asado",
            "cachopo",
            "hamburguesa",
            "perrito",
            "nuggets",
            "alitas",
            "tacos",
        ],
    ),
    # Pescados / mariscos a la carta.
    (
        "pescados",
        ["lubina", "merluza", "pescaito", "espeto", "pulpo_gallega", "salmon"],
    ),
    # Tapas y raciones (genérico, después de las específicas).
    (
        "tapas",
        [
            "tapa_",
            "racion_",
            "patatas",
            "croquetas",
            "gambas",
            "calamares",
            "rabas",
            "nachos",
            "aros_cebolla",
            "gazpacho",
            "salmorejo",
            "hummus",
            "bruschetta",
            "pan_ajo",
            "tabla_",
            "jamon_iberico",
            "tortilla_espanola",
            "verduras_plancha",
        ],
    ),
    # Postres y helados (incluye tempura_helado, mochi_helado, polos, tarrinas).
    (
        "postres",
        [
            "tarta_",
            "cheesecake",
            "brownie",
            "tiramisu",
            "flan",
            "crema_catalana",
            "panna_cotta",
            "helado",
            "copa_helado",
            "cookie",
            "galleta",
            "polo_",
            "tarrina",
            "mochi",
            "tempura_helado",
        ],
    ),
    # Panadería (al final: pan genérico).
    ("panes", ["pan_", "barra_pan", "hogaza", "focaccia", "chapata"]),
    # Bocadillos / sandwiches / wraps (último genérico de comida).
    ("bocadillos", ["bocadillo", "sandwich", "wrap_"]),
    # Extras y complementos (salsas, etc.).
    ("extras", ["salsa", "salsa_extra", "salsa_yogur"]),
]

# Overrides de precio por nombre exacto (platos premium o bebidas botella).
HOSPITALITY_PRICE_OVERRIDES = {
    "solomillo": 19.50,
    "entrecot": 18.00,
    "secreto_iberico": 15.00,
    "racion_cachopo": 16.00,
    "tabla_iberica": 16.50,
    "tabla_embutidos": 14.00,
    "tabla_quesos": 13.00,
    "tabla_mixta": 15.00,
    "jamon_iberico": 18.00,
    "paella_marisco": 16.00,
    "paella_mixta": 13.50,
    "paella_valenciana": 13.00,
    "lubina_horno": 16.00,
    "pulpo_gallega": 16.00,
    "botella_champagne": 45.00,
    "botella_ribera_duero": 22.00,
    "botella_rioja_crianza": 19.00,
    "botella_albarino": 18.00,
    "pizza_familiar": 14.00,
    "hamburguesa_gourmet": 13.50,
    "hamburguesa_doble": 11.50,
    "desayuno_buffet": 14.00,
    "menu_dia": 13.50,
    "menu_infantil": 8.50,
    "espeto_sardinas": 9.00,
    "racion_gambas": 12.00,
    "gambas_ajillo": 11.00,
}

# Sectores que no son comida y se excluyen del catálogo de restaurante (servicios de hotel, etc.).
HOSPITALITY_EXCLUDE = {"lavanderia", "lena", "suite", "polo_artesano"}

SECTORS = {
    "hospitality": {
        "categories": HOSPITALITY_CATEGORIES,
        "rules": HOSPITALITY_RULES,
        "price_overrides": HOSPITALITY_PRICE_OVERRIDES,
        "exclude": HOSPITALITY_EXCLUDE,
        "tax_rate": 10,  # IVA reducido hostelería (España).
    },
}


def humanize(stem: str) -> str:
    """`durum_ternera` → `Durum ternera`. Snake_case a etiqueta legible."""
    return stem.replace("_", " ").strip().capitalize()


def classify(stem: str, rules: list[tuple[str, list[str]]]) -> str | None:
    for category, needles in rules:
        if any(n in stem for n in needles):
            return category
    return None


def build_sector(sector: str) -> dict:
    cfg = SECTORS[sector]
    folder = ASSETS / sector
    if not folder.is_dir():
        raise SystemExit(f"sector sin carpeta de assets: {folder}")

    cat_meta = {
        key: (name, icon, price) for key, name, icon, price in cfg["categories"]
    }
    products: list[dict] = []
    unclassified: list[str] = []

    for path in sorted(folder.glob("*.webp")):
        stem = path.stem
        if stem in cfg["exclude"]:
            continue
        category = classify(stem, cfg["rules"])
        if category is None:
            unclassified.append(stem)
            continue
        price = cfg["price_overrides"].get(stem, cat_meta[category][2])
        products.append(
            {
                "sku": stem,
                "name": humanize(stem),
                "category": category,
                "price": round(float(price), 2),
                "tax_rate": cfg["tax_rate"],
                "image": f"assets/{sector}/{stem}.webp",
            }
        )

    if unclassified:
        print(
            f"[warn] {sector}: {len(unclassified)} sin clasificar → {', '.join(unclassified)}",
            file=sys.stderr,
        )

    # Solo categorías con al menos un producto, en el orden declarado.
    used = {p["category"] for p in products}
    categories = [
        {"key": key, "name": name, "icon": icon, "order": i}
        for i, (key, name, icon, _price) in enumerate(cfg["categories"])
        if key in used
    ]

    return {
        "sector": sector,
        "currency": "EUR",
        "tax_rate": cfg["tax_rate"],
        "categories": categories,
        "products": products,
    }


# hub_id del despliegue DEMO (aws/terraform/ecs_demo.tf: env HUB_ID). El seed del demo se inyecta
# vía HUB_SEED_SQL con este hub_id literal. Para hubs por-tenant se pasa --hub-id.
DEMO_HUB_ID = "00000000-0000-0000-0000-000000000001"
SEED_TS = "2026-01-01T00:00:00+00:00"


def _sql(value: str) -> str:
    """Literal SQL string con comillas simples escapadas (doblar `'`)."""
    return "'" + value.replace("'", "''") + "'"


def emit_sql(data: dict, hub_id: str) -> str:
    """Emite SQL idempotente que siembra `inventory_category` + `inventory_product` (+ M2M).

    Mismo estilo que `hub/crates/server/seeds/demo.sql`: `INSERT ... SELECT ... WHERE NOT EXISTS`
    (re-arrancable sin duplicar). Portable SQLite/Postgres. Asume que el módulo `inventory` ya
    creó sus tablas (su migración 001_init) — este seed solo aporta DATOS, no DDL.

    El `image` es la s3_key relativa (igual que el JSON y que `/api/v1/catalog/assets/`).
    """
    sector = data["sector"]
    h = _sql(hub_id)
    ts = _sql(SEED_TS)
    lines: list[str] = [
        f"-- Catálogo starter '{sector}' generado por scripts/build_starter_catalog.py — NO editar a mano.",
        f"-- {len(data['products'])} productos en {len(data['categories'])} categorías. hub_id = {hub_id}.",
        "-- Idempotente (WHERE NOT EXISTS). Requiere que el módulo 'inventory' esté instalado",
        "-- (sus tablas inventory_category / inventory_product existan) ANTES de aplicar este seed.",
        "",
    ]

    # Categorías.
    for cat in data["categories"]:
        cat_id = f"cat-{sector}-{cat['key']}"
        lines.append(
            "INSERT INTO inventory_category "
            '(id, hub_id, name, slug, icon, "order", created_at, updated_at)\n'
            f"SELECT {_sql(cat_id)}, {h}, {_sql(cat['name'])}, {_sql(cat['key'])}, "
            f"{_sql(cat['icon'])}, {cat['order']}, {ts}, {ts}\n"
            "WHERE NOT EXISTS (SELECT 1 FROM inventory_category "
            f"WHERE hub_id = {h} AND name = {_sql(cat['name'])});"
        )
    lines.append("")

    # Productos + relación producto↔categoría (M2M).
    for p in data["products"]:
        prod_id = f"prod-{sector}-{p['sku']}"
        cat_id = f"cat-{sector}-{p['category']}"
        lines.append(
            "INSERT INTO inventory_product "
            "(id, hub_id, name, sku, description, product_type, price, cost, stock, "
            "low_stock_threshold, image, created_at, updated_at)\n"
            f"SELECT {_sql(prod_id)}, {h}, {_sql(p['name'])}, {_sql(p['sku'])}, '', 'physical', "
            f"{p['price']:.2f}, 0, 1000, 0, {_sql(p['image'])}, {ts}, {ts}\n"
            "WHERE NOT EXISTS (SELECT 1 FROM inventory_product "
            f"WHERE hub_id = {h} AND sku = {_sql(p['sku'])});"
        )
        lines.append(
            "INSERT INTO inventory_product_categories (product_id, category_id)\n"
            f"SELECT {_sql(prod_id)}, {_sql(cat_id)}\n"
            "WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories "
            f"WHERE product_id = {_sql(prod_id)} AND category_id = {_sql(cat_id)});"
        )

    return "\n".join(lines) + "\n"


def main(argv: list[str]) -> int:
    import argparse

    parser = argparse.ArgumentParser(
        description="Genera catálogos starter por sector (JSON + SQL)."
    )
    parser.add_argument(
        "sectors", nargs="*", help="sectores a generar (vacío = todos con reglas)"
    )
    parser.add_argument(
        "--hub-id",
        default=DEMO_HUB_ID,
        help=f"hub_id literal para el SQL de seed (def. demo {DEMO_HUB_ID})",
    )
    args = parser.parse_args(argv[1:])

    OUT_DIR.mkdir(exist_ok=True)
    targets = args.sectors or list(SECTORS)
    for sector in targets:
        if sector not in SECTORS:
            print(f"[skip] sin reglas para sector '{sector}'", file=sys.stderr)
            continue
        data = build_sector(sector)

        out_json = OUT_DIR / f"{sector}.json"
        out_json.write_text(
            json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
        )
        out_sql = OUT_DIR / f"{sector}.sql"
        out_sql.write_text(emit_sql(data, args.hub_id), encoding="utf-8")

        print(
            f"[ok] {sector}: {len(data['products'])} productos en "
            f"{len(data['categories'])} categorías → {out_json.relative_to(ROOT)}, "
            f"{out_sql.relative_to(ROOT)}"
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
