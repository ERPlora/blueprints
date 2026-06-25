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

# ── IVA por defecto (módulo `taxes`, ADR-0066) ───────────────────────────────────────────────
# Tipos de IVA de España sembrados en CADA catálogo starter ANTES de los productos, para que
# `inventory_product.tax_rate_id` apunte a una fila EXISTENTE (antes faltaba → apuntaba a un id
# fantasma). `rate_pct` es un porcentaje REAL (no es dinero, no va en céntimos). country=ES,
# `code` único por (hub, country_code).
SPAIN_IVA_RATES = [
    # code     nombre                    rate_pct (%)
    ("IVA21", "IVA general 21%", 21.0),
    ("IVA10", "IVA reducido 10%", 10.0),
    ("IVA4", "IVA superreducido 4%", 4.0),
    ("IVA0", "IVA exento 0%", 0.0),
]

# ── Cajeros demo (login local) ───────────────────────────────────────────────────────────────
# 2 cajeros por seed: una fila `hub_user` (login por PIN) enlazada a su ficha `staff_member`
# (vía `staff_member.user_id`). pin_hash en formato LEGACY `salt:sha256("{salt}:{pin}")` que
# `identity.rs::check_pin` acepta y rehashea perezosamente a argon2id en el primer login (igual
# que el seed del demo). FLAG(humano, seguridad): PINs 1111/2222 son de DEMO → cambiar antes de
# prod. FLAG(humano): el modelo final del cajero (rol 'cashier' ↔ staff_member y, sobre todo,
# qué permisos da el rol vía `role_permissions.cashier` en cada module.json) es columna humano.
CASHIERS = [
    # name        pin     role        pin_hash (salt:sha256_hex("{salt}:{pin}"))                                                first      last
    (
        "Cajero 1",
        "1111",
        "cashier",
        "cashier1-seed-salt:9d81582af594e1cc780151726e43aceb5da668e780bf455ca41b6bfc0a7074ca",
        "Cajero",
        "Uno",
    ),
    (
        "Cajero 2",
        "2222",
        "cashier",
        "cashier2-seed-salt:fe8ab1c960ef7d0abbbd1c7598ed2036f7aabc2408571edfdaff16d6bc1bdb0f",
        "Cajero",
        "Dos",
    ),
]

SECTORS = {
    "hospitality": {
        "categories": HOSPITALITY_CATEGORIES,
        "rules": HOSPITALITY_RULES,
        "price_overrides": HOSPITALITY_PRICE_OVERRIDES,
        "exclude": HOSPITALITY_EXCLUDE,
        # IVA del sector (ASUNCIÓN, flag humano): la hostelería tributa al 10 % (comida y bebida
        # sin alcohol); el alcohol al 21 %. Cada producto referenciará el `tax_rate_id` resuelto
        # de su categoría.
        "default_tax_code": "IVA10",
        "tax_code_by_category": {
            "cervezas": "IVA21",
            "vinos": "IVA21",
            "cocteles": "IVA21",
        },
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
        price_eur = cfg["price_overrides"].get(stem, cat_meta[category][2])
        # ADR-0007: el dinero va en CÉNTIMOS ENTEROS, nunca en float. Las reglas declaran el
        # precio en euros por comodidad de autoría; se convierte aquí una sola vez (× 100).
        price_cents = int(round(float(price_eur) * 100))
        tax_code = cfg.get("tax_code_by_category", {}).get(
            category, cfg["default_tax_code"]
        )
        products.append(
            {
                "sku": stem,
                "name": humanize(stem),
                "category": category,
                "price": price_cents,  # céntimos (ADR-0007)
                "tax_code": tax_code,  # → tax_rate_id resuelto en emit_sql
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
        "price_unit": "cents",  # ADR-0007: `price` en céntimos enteros (no euros, no float).
        "default_tax_code": cfg["default_tax_code"],
        "taxes": [
            {"code": code, "name": name, "rate_pct": rate}
            for code, name, rate in SPAIN_IVA_RATES
        ],
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
    """Emite SQL idempotente que siembra IVA + catálogo + cajeros para un sector.

    Bloques (en orden): (1) `taxes_rate` (IVA ES, ADR-0066) — primero, para que los productos
    referencien un `tax_rate_id` existente; (2) `inventory_category`; (3) `inventory_product`
    (+ M2M `inventory_product_categories`); (4) cajeros demo (`hub_user` + `staff_member`).

    Mismo estilo que `hub/crates/server/seeds/demo.sql`: `INSERT ... SELECT ... WHERE NOT EXISTS`
    (re-arrancable sin duplicar). Portable SQLite/Postgres. Asume que los módulos `taxes`,
    `inventory` y `staff` ya crearon sus tablas (sus migraciones) ANTES de aplicar este seed; el
    seed solo aporta DATOS, no DDL. Dinero en CÉNTIMOS ENTEROS (ADR-0007).

    El `image` es la s3_key relativa (igual que el JSON y que `/api/v1/catalog/assets/`).
    """
    sector = data["sector"]
    h = _sql(hub_id)
    ts = _sql(SEED_TS)
    lines: list[str] = [
        f"-- Catálogo starter '{sector}' generado por scripts/build_starter_catalog.py — NO editar a mano.",
        f"-- {len(data['products'])} productos en {len(data['categories'])} categorías + {len(data['taxes'])} tipos de IVA + {len(CASHIERS)} cajeros.",
        f"-- hub_id = {hub_id}. Importes en CÉNTIMOS enteros (ADR-0007). Idempotente (WHERE NOT EXISTS).",
        "-- Requiere los módulos 'taxes', 'inventory' y 'staff' instalados (sus tablas existen) ANTES de aplicar.",
        "",
    ]

    # 1) IVA por defecto (taxes_rate). PRIMERO: los productos referencian estos tax_rate_id.
    lines.append(
        "-- IVA por defecto (módulo taxes, ADR-0066). rate_pct es % REAL (no es dinero). country=ES."
    )
    for code, name, rate in SPAIN_IVA_RATES:
        tax_id = f"tax-{sector}-{code.lower()}"
        lines.append(
            "INSERT INTO taxes_rate "
            "(id, hub_id, code, name, category_id, parent_id, country_code, region_code, rate_pct, "
            "tax_type, applies_from, applies_until, is_active, is_deleted, created_by, updated_by, created_at, updated_at)\n"
            f"SELECT {_sql(tax_id)}, {h}, {_sql(code)}, {_sql(name)}, NULL, NULL, 'ES', '', {rate}, "
            f"'vat', '2026-01-01', NULL, 1, 0, NULL, NULL, {ts}, {ts}\n"
            "WHERE NOT EXISTS (SELECT 1 FROM taxes_rate "
            f"WHERE hub_id = {h} AND country_code = 'ES' AND code = {_sql(code)});"
        )
    lines.append("")

    # 2) Categorías.
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

    lines.append("")

    # 3) Productos + relación producto↔categoría (M2M). price = CÉNTIMOS (ADR-0007); tax_rate_id
    #    → la fila taxes_rate sembrada arriba (resuelta por categoría: alcohol 21 %, resto 10 %).
    for p in data["products"]:
        prod_id = f"prod-{sector}-{p['sku']}"
        cat_id = f"cat-{sector}-{p['category']}"
        tax_id = f"tax-{sector}-{p['tax_code'].lower()}"
        lines.append(
            "INSERT INTO inventory_product "
            "(id, hub_id, name, sku, description, product_type, price, cost, stock, "
            "low_stock_threshold, tax_rate_id, image, created_at, updated_at)\n"
            f"SELECT {_sql(prod_id)}, {h}, {_sql(p['name'])}, {_sql(p['sku'])}, '', 'physical', "
            f"{p['price']}, 0, 1000, 0, {_sql(tax_id)}, {_sql(p['image'])}, {ts}, {ts}\n"
            "WHERE NOT EXISTS (SELECT 1 FROM inventory_product "
            f"WHERE hub_id = {h} AND sku = {_sql(p['sku'])});"
        )
        lines.append(
            "INSERT INTO inventory_product_categories (product_id, category_id)\n"
            f"SELECT {_sql(prod_id)}, {_sql(cat_id)}\n"
            "WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories "
            f"WHERE product_id = {_sql(prod_id)} AND category_id = {_sql(cat_id)});"
        )
    lines.append("")

    # 4) Cajeros demo: login local por PIN (`hub_user`) enlazado a su ficha de staff
    #    (`staff_member.user_id`). Ver constante CASHIERS para los flags de seguridad/modelo.
    lines.append(
        "-- Cajeros demo (login por PIN). FLAG(humano): PINs de DEMO (cambiar antes de prod) y el"
    )
    lines.append(
        "-- modelo final del cajero (rol 'cashier' ↔ staff_member + permisos por module.json) es columna humano."
    )
    for i, (name, _pin, role, pin_hash, first, last) in enumerate(CASHIERS, start=1):
        uid = f"user-{sector}-cashier{i}"
        sid = f"staff-{sector}-cashier{i}"
        lines.append(
            "INSERT INTO hub_user (id, name, pin_hash, role, cloud_user_id, is_active, created_at)\n"
            f"SELECT {_sql(uid)}, {_sql(name)}, {_sql(pin_hash)}, {_sql(role)}, NULL, 1, {ts}\n"
            f"WHERE NOT EXISTS (SELECT 1 FROM hub_user WHERE name = {_sql(name)});"
        )
        lines.append(
            "INSERT INTO staff_member "
            "(id, hub_id, first_name, last_name, user_id, status, is_bookable, created_at, updated_at)\n"
            f"SELECT {_sql(sid)}, {h}, {_sql(first)}, {_sql(last)}, {_sql(uid)}, 'active', 0, {ts}, {ts}\n"
            f"WHERE NOT EXISTS (SELECT 1 FROM staff_member WHERE id = {_sql(sid)});"
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
