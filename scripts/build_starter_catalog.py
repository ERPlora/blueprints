#!/usr/bin/env python3
"""Genera el bundle starter (seed) por país/sector a partir de la librería de imágenes (ADR-0072).

Mapea cada `img/<assets_dir>/<nombre>.webp` a una categoría de menú y le asigna un precio por
defecto (con overrides para platos premium), y escribe el bundle en el layout país/sector:

    starter_catalogs/<país>/<sector>/seed.sql      # el seed (IVA + productos + cajeros)
    starter_catalogs/<país>/<sector>/seed.json     # los mismos datos, estructurados (UI/preview)
    starter_catalogs/<país>/<sector>/seed.sha256   # SHA256 de seed.sql (verificación, patrón module.zip)

Es el mirror local del prefijo S3 `starter-seeds/<país>/<sector>/` (lo sincroniza
`.github/workflows/publish-to-s3.yml`). El Hub lo descarga, verifica el SHA256, sustituye el
`hub_id` demo por el real y aplica `seed.sql` vía `runtime/src/seed.rs::apply` (ADR-0072 §3).

Imágenes COMPARTIDAS (§7.3 opción "shared"): el `image` de cada producto es una **ref lógica**
`media:public/img/<assets_dir>/<file>.webp` — el origen `public` la resuelve el proxy del SaaS
(solo-lectura); no se duplican imágenes dentro del bundle.

Uso:
    python scripts/build_starter_catalog.py                       # todos los sectores (país es)
    python scripts/build_starter_catalog.py restaurant            # solo un sector
    python scripts/build_starter_catalog.py --country es restaurant

Determinista e idempotente: misma entrada → mismos ficheros (orden estable, sin timestamps).
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ASSETS = ROOT / "img"
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

# ── Nombres visibles: español correcto (ERPlora/blueprints#17) ────────────────────────────────
# El nombre sale del nombre de FICHERO de la imagen, que es `snake_case` ASCII por contrato del
# gate de assets (`validate_assets.py`) — así que sin este mapa el catálogo entero nace sin
# tildes y el cliente final lee «Cafe con leche» en el TPV. El mapa es palabra→palabra y CERRADO
# (formas concretas, no heurística de acentuación): un falso positivo aquí renombraría un
# producto sin querer. Valores en minúscula salvo acrónimos/nombres propios; la mayúscula inicial
# la pone `humanize` al final.
DISPLAY_WORDS = {
    "albarino": "albariño",
    "arandanos": "arándanos",
    "atun": "atún",
    "bombom": "bombón",
    "cafe": "café",
    "cana": "caña",
    "cesar": "césar",
    "clasica": "clásica",
    "clasico": "clásico",
    "culin": "culín",
    "espanola": "española",
    "fideua": "fideuá",
    "iberica": "ibérica",
    "iberico": "ibérico",
    "ipa": "IPA",
    "jamon": "jamón",
    "japones": "japonés",
    "lahmacun": "lahmacún",
    "lasana": "lasaña",
    "limon": "limón",
    "menu": "menú",
    "nutella": "Nutella",
    "pina": "piña",
    "racion": "ración",
    "salmon": "salmón",
    "sandwich": "sándwich",
    "sangria": "sangría",
    "te": "té",
    "tiramisu": "tiramisú",
    "tonica": "tónica",
}

# ── Cantidades: punto fijo entero a escala 10⁶ (ADR-0147) ─────────────────────────────────────
# `stock` y `low_stock_threshold` son CANTIDADES, no dinero: viven en `BIGINT` a escala 10⁶
# (`inventory/migrations/postgres/006_quantity_fixed_point.sql`). El seed se aplica como SQL CRUDO
# (`runtime/src/import_sql.rs::apply` → `execute_batch`, sin aritmética), así que el número que se
# escribe aquí es EXACTAMENTE el que acaba en la columna: sembrar `1000` no son 1000 unidades,
# son 0,001 — y la UI lo pinta así (ERPlora/blueprints#18). Escalar es obligación del emisor.
#
# El DINERO no entra aquí: `price`/`cost` siguen en céntimos enteros (ADR-0007/0123).
QUANTITY_SCALE = 1_000_000
# Existencias iniciales de un catálogo de muestra: «hay de sobra», no un inventario real.
DEFAULT_STOCK_UNITS = 1000
# 0 = sin aviso de stock bajo (el catálogo de muestra no vigila existencias). Se escala igual: el
# 0 es invariante de escala HOY, y dejar el `* QUANTITY_SCALE` evita que un futuro valor ≠ 0
# reintroduzca el bug de #18 en silencio.
DEFAULT_LOW_STOCK_THRESHOLD_UNITS = 0

# ── IVA (módulo `taxes`, ADR-0085) ───────────────────────────────────────────────────────────
# El blueprint YA NO siembra tipos de IVA. El módulo `taxes` siembra al instalarse las categorías
# canónicas (`restaurant.food`/`.drink`/`.alcohol`, `service.generic`, `product.generic`) + las
# reglas ES (food/drink 10 %, alcohol/servicio/producto 21 %). Cada producto solo declara su
# `tax_category_key` y el módulo resuelve el tipo. (Antes: `taxes_rate` + `tax_rate_id`, eliminados.)

# ── Cajeros demo (login local) ───────────────────────────────────────────────────────────────
# 2 cajeros por seed: una fila `hub_user` (login por PIN) enlazada a su ficha `staff_member`
# (vía `staff_member.user_id`). pin_hash en formato LEGACY `salt:sha256("{salt}:{pin}")` que
# `identity.rs::check_pin` acepta y rehashea perezosamente a argon2id en el primer login (igual
# que el seed del demo).
#
# ROL = 'employee' (NO 'cashier'). El cajero ES el rol de operador que YA existe en los 27
# module.json (role_permissions: admin/manager/employee). 'employee' concede justo lo que un
# cajero necesita —vender (sales.add_sale), abrir/cerrar caja (cash_register.*_session),
# facturar (invoice.add_invoice)— sin ajustes/borrados (manage_settings/delete = manager+).
# Reutilizar el rol existente evita crear/duplicar 'cashier' en 27 módulos (componer, no duplicar).
#
# PIN: los PINs 1111/2222 NO rotan — la seguridad la da el **device-trust** (solo dispositivos de
# confianza pueden hacer login por PIN, §2.9). Son credenciales de demo estables a propósito.
CASHIERS = [
    # name        pin     role         pin_hash (salt:sha256_hex("{salt}:{pin}"))                                                first      last
    (
        "Cajero 1",
        "1111",
        "employee",
        "cashier1-seed-salt:9d81582af594e1cc780151726e43aceb5da668e780bf455ca41b6bfc0a7074ca",
        "Cajero",
        "Uno",
    ),
    (
        "Cajero 2",
        "2222",
        "employee",
        "cashier2-seed-salt:fe8ab1c960ef7d0abbbd1c7598ed2036f7aabc2408571edfdaff16d6bc1bdb0f",
        "Cajero",
        "Dos",
    ),
]

# La CLAVE del dict es el **seed-key canónico del sector** (ADR-0072 §7.2): el nombre con el que
# el seed se publica en S3 (`starter-seeds/{país}/{sector}/`) y que prefija sus ids
# (`cat-{sector}-`, `prod-{sector}-`, `tax-{sector}-`). `assets_dir` es la carpeta de imágenes
# COMPARTIDA (`img/<assets_dir>/`, ADR-0072 §7.3 opción "shared"): no se duplican imágenes, el
# seed referencia la librería común. Aquí seed-key=`restaurant` reusa las imágenes de `hospitality`.
SECTORS = {
    "restaurant": {
        "assets_dir": "hospitality",
        "categories": HOSPITALITY_CATEGORIES,
        "rules": HOSPITALITY_RULES,
        "price_overrides": HOSPITALITY_PRICE_OVERRIDES,
        "exclude": HOSPITALITY_EXCLUDE,
        # IVA del sector (ADR-0085): el TIPO lo resuelve el MÓDULO `taxes` por `tax_category_key`
        # (categoría canónica + regla ES: food/drink 10 %, alcohol 21 %). El blueprint solo asigna
        # la categoría fiscal canónica por menú-categoría; ya NO siembra `taxes_rate` ni liga por id.
        "default_tax_category": "restaurant.food",
        "tax_category_by_category": {
            "cafes": "restaurant.drink",
            "refrescos": "restaurant.drink",
            "cervezas": "restaurant.alcohol",
            "vinos": "restaurant.alcohol",
            "cocteles": "restaurant.alcohol",
        },
    },
}


def humanize(stem: str) -> str:
    """`durum_ternera` → `Durum ternera`; `cafe_con_leche` → `Café con leche`.

    Snake_case a etiqueta legible, corrigiendo la ortografía española palabra a palabra con
    `DISPLAY_WORDS` (el nombre de fichero es ASCII sin tildes por contrato del gate de assets).
    No usa `str.capitalize()`: eso arrasaría los acrónimos y nombres propios del mapa (`IPA`,
    `Nutella`); solo se pone en mayúscula la primera letra de la etiqueta.
    """
    words = [DISPLAY_WORDS.get(w, w) for w in stem.replace("_", " ").split()]
    label = " ".join(words)
    return label[:1].upper() + label[1:]


def classify(stem: str, rules: list[tuple[str, list[str]]]) -> str | None:
    for category, needles in rules:
        if any(n in stem for n in needles):
            return category
    return None


def build_sector(sector: str) -> dict:
    cfg = SECTORS[sector]
    # Imágenes COMPARTIDAS (ADR-0072 §7.3): se leen de `img/<assets_dir>/`, no de una carpeta
    # con el nombre del seed-key. Así `restaurant` reusa las webp de `hospitality` sin duplicar.
    assets_dir = cfg.get("assets_dir", sector)
    folder = ASSETS / assets_dir
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
        tax_category_key = cfg.get("tax_category_by_category", {}).get(
            category, cfg["default_tax_category"]
        )
        products.append(
            {
                "sku": stem,
                "name": humanize(stem),
                "category": category,
                "price": price_cents,  # céntimos (ADR-0007)
                # CANTIDAD a escala 10⁶ (ADR-0147) — otro contrato distinto del dinero.
                "stock": DEFAULT_STOCK_UNITS * QUANTITY_SCALE,
                "low_stock_threshold": DEFAULT_LOW_STOCK_THRESHOLD_UNITS
                * QUANTITY_SCALE,
                "tax_category_key": tax_category_key,  # ADR-0085: categoría canónica (regla ES en módulo taxes)
                "image": f"media:public/img/{assets_dir}/{stem}.webp",
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
        # ADR-0147: `stock`/`low_stock_threshold` son punto fijo entero a escala 10⁶. Se DECLARA
        # (como `price_unit`) para que quien lea el bundle no tenga que adivinar la unidad — es el
        # dato cuya ausencia dejó pasar el stock sin escalar de #18.
        "quantity_scale": QUANTITY_SCALE,
        # ADR-0085: el IVA lo siembra el módulo `taxes` (categorías canónicas + reglas ES); el
        # blueprint no declara tipos — cada producto lleva su `tax_category_key` canónico.
        "default_tax_category": cfg["default_tax_category"],
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
    """Emite SQL idempotente que siembra catálogo + cajeros para un sector.

    Bloques (en orden): (1) `inventory_category`; (2) `inventory_product` (+ M2M
    `inventory_product_categories`), cada producto con su `tax_category_key` canónico
    (ADR-0085); (3) cajeros demo (`hub_user` + `staff_member`).

    El IVA NO se siembra aquí: lo aporta el módulo `taxes` al instalarse (categorías canónicas +
    reglas ES). El seed solo referencia `tax_category_key`; el módulo resuelve el tipo.

    Mismo estilo que `hub/crates/server/seeds/demo.sql`: `INSERT ... SELECT ... WHERE NOT EXISTS`
    (re-arrancable sin duplicar). Portable SQLite/Postgres. Asume que los módulos `taxes`,
    `inventory` y `staff` ya crearon sus tablas (sus migraciones) ANTES de aplicar este seed; el
    seed solo aporta DATOS, no DDL. Dinero en CÉNTIMOS ENTEROS (ADR-0007); cantidades (`stock`,
    `low_stock_threshold`) en punto fijo entero a escala 10⁶ (ADR-0147) — el import aplica este SQL
    tal cual, sin convertir nada.

    El `image` es la ref lógica `media:public/img/…` (igual que el JSON).
    """
    sector = data["sector"]
    h = _sql(hub_id)
    ts = _sql(SEED_TS)
    lines: list[str] = [
        f"-- Catálogo starter '{sector}' generado por scripts/build_starter_catalog.py — NO editar a mano.",
        f"-- {len(data['products'])} productos en {len(data['categories'])} categorías + {len(CASHIERS)} cajeros. IVA vía módulo taxes (ADR-0085).",
        f"-- hub_id = {hub_id}. Importes en CÉNTIMOS enteros (ADR-0007); cantidades a escala 10⁶ (ADR-0147).",
        "-- Idempotente (WHERE NOT EXISTS).",
        "-- Requiere los módulos 'taxes', 'inventory' y 'staff' instalados (sus tablas existen) ANTES de aplicar.",
        "",
    ]

    # 1) Categorías.
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

    # 2) Productos + relación producto↔categoría (M2M). Dos escalas distintas en la MISMA fila:
    #    price/cost = CÉNTIMOS enteros (ADR-0007) · stock/low_stock_threshold = CANTIDAD a escala
    #    10⁶ (ADR-0147, ya escalada en `build_sector`). tax_category_key → categoría canónica del
    #    módulo taxes (ADR-0085: food/drink 10 %, alcohol 21 %; la regla ES resuelve el tipo).
    for p in data["products"]:
        prod_id = f"prod-{sector}-{p['sku']}"
        cat_id = f"cat-{sector}-{p['category']}"
        lines.append(
            "INSERT INTO inventory_product "
            "(id, hub_id, name, sku, description, product_type, price, cost, stock, "
            "low_stock_threshold, tax_category_key, image, created_at, updated_at)\n"
            f"SELECT {_sql(prod_id)}, {h}, {_sql(p['name'])}, {_sql(p['sku'])}, '', 'physical', "
            f"{p['price']}, 0, {p['stock']}, {p['low_stock_threshold']}, "
            f"{_sql(p['tax_category_key'])}, {_sql(p['image'])}, {ts}, {ts}\n"
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
        "-- Cajeros demo (login por PIN). rol='employee' (rol de operador YA existente en los 27 módulos:"
    )
    lines.append(
        "-- vender, abrir/cerrar caja, facturar). PINs 1111/2222 NO rotan — los protege el device-trust."
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
    import hashlib

    parser = argparse.ArgumentParser(
        description="Genera catálogos starter por sector con layout país/sector (ADR-0072)."
    )
    parser.add_argument(
        "sectors", nargs="*", help="sectores a generar (vacío = todos con reglas)"
    )
    parser.add_argument(
        "--country",
        default="es",
        help="país ISO 3166-1 alpha-2 del seed (def. 'es'; fase 1 solo ES, ADR-0072).",
    )
    parser.add_argument(
        "--hub-id",
        default=DEMO_HUB_ID,
        help=f"hub_id literal para el SQL de seed (def. demo {DEMO_HUB_ID})",
    )
    args = parser.parse_args(argv[1:])

    targets = args.sectors or list(SECTORS)
    for sector in targets:
        if sector not in SECTORS:
            print(f"[skip] sin reglas para sector '{sector}'", file=sys.stderr)
            continue
        data = build_sector(sector)

        # Layout ADR-0072: starter_catalogs/<país>/<sector>/{seed.sql, seed.json, seed.sha256}.
        # (Local mirror del prefijo S3 `starter-seeds/<país>/<sector>/`; lo mapea publish-to-s3.yml.)
        bundle_dir = OUT_DIR / args.country / sector
        bundle_dir.mkdir(parents=True, exist_ok=True)

        (bundle_dir / "seed.json").write_text(
            json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
        )
        sql = emit_sql(data, args.hub_id)
        (bundle_dir / "seed.sql").write_text(sql, encoding="utf-8")
        # seed.sha256: hash del seed.sql (verificación de integridad, patrón module.zip). Se
        # commitea junto al seed para que coincida byte a byte; un test lo re-verifica.
        digest = hashlib.sha256(sql.encode("utf-8")).hexdigest()
        (bundle_dir / "seed.sha256").write_text(digest + "\n", encoding="utf-8")

        print(
            f"[ok] {args.country}/{sector}: {len(data['products'])} productos en "
            f"{len(data['categories'])} categorías → {bundle_dir.relative_to(ROOT)}/ "
            f"(seed.sql sha256={digest[:12]}…)"
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
