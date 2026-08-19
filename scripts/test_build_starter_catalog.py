#!/usr/bin/env python3
"""Regresión del generador de catálogos starter (build_starter_catalog.py).

Self-contained (no depende de otros repos): valida la SALIDA del generador.
Garantías que cubre — y que antes fallaban (bug de céntimos / IVA fantasma):

  - El dinero (`price`) sale en CÉNTIMOS ENTEROS, nunca como float (ADR-0007).
  - Se siembran los 4 tipos de IVA (taxes_rate) ANTES de los productos, y CADA producto
    referencia un `tax_rate_id` que existe en ese bloque (no un id fantasma) (ADR-0066).
  - El alcohol tributa al 21 % y el resto de hostelería al 10 %.
  - Se siembran 2 cajeros (`hub_user` rol 'employee', el rol de operador ya existente) enlazados
    a `staff_member.user_id`, con pin_hash legacy `salt:sha256("{salt}:{pin}")` que verifica 1111/2222.
  - El SQL es idempotente (cada sentencia lleva `WHERE NOT EXISTS`).

Uso:  python scripts/test_build_starter_catalog.py   (sale 1 si algo falla)
"""

from __future__ import annotations

import hashlib
import re
import sys

import build_starter_catalog as g


def _restaurant():
    data = g.build_sector("restaurant")
    sql = g.emit_sql(data, g.DEMO_HUB_ID)
    return data, sql


def test_prices_are_integer_cents():
    data, sql = _restaurant()
    # En el dict: todos los precios son int (céntimos), nunca float.
    assert data["products"], "el sector debe producir productos"
    assert all(isinstance(p["price"], int) for p in data["products"]), (
        "precios no-int en el JSON"
    )
    assert data.get("price_unit") == "cents"
    # En el SQL: ningún literal de precio de producto con punto decimal.
    assert not re.search(r"'physical', \d+\.\d", sql), (
        "float-in-cents en el SQL de producto"
    )


def test_blueprint_does_not_seed_taxes_and_uses_canonical_categories():
    """ADR-0085: el IVA lo siembra el MÓDULO `taxes` (categorías canónicas + reglas ES). El
    blueprint ya NO inserta `taxes_rate` (tabla eliminada) ni liga por `tax_rate_id`: cada
    producto declara un `tax_category_key` canónico que la categoría/regla del módulo resuelve
    al tipo (food/drink 10 %, alcohol 21 %)."""
    data, sql = _restaurant()
    assert "taxes_rate" not in sql, (
        "el blueprint ya no siembra taxes_rate (lo hace el módulo taxes)"
    )
    assert "tax_rate_id" not in sql, (
        "inventory_product usa tax_category_key, no tax_rate_id (ADR-0085)"
    )
    canonical = {"restaurant.food", "restaurant.drink", "restaurant.alcohol"}
    for p in data["products"]:
        assert p["tax_category_key"] in canonical, (
            f"{p['sku']} usa una categoría fiscal no canónica: {p['tax_category_key']}"
        )
        assert f"'{p['tax_category_key']}'" in sql, (
            f"{p['sku']}: la key {p['tax_category_key']} debe aparecer en el SQL"
        )


def test_alcohol_vs_food_drink_tax_category():
    data, _ = _restaurant()
    by_sku = {p["sku"]: p["tax_category_key"] for p in data["products"]}
    assert (
        by_sku.get("cerveza_jarra") == "restaurant.alcohol"
    )  # alcohol → 21 % (regla ES del módulo taxes)
    assert by_sku.get("americano") == "restaurant.drink"  # café → bebida → 10 %


def _check_pin_legacy(stored: str, pin: str) -> bool:
    salt, expected = stored.split(":", 1)
    return hashlib.sha256(f"{salt}:{pin}".encode()).hexdigest() == expected


def test_two_cashiers_with_verifying_pins():
    _data, sql = _restaurant()
    assert sql.count("INSERT INTO hub_user ") == 2, "2 cajeros hub_user"
    assert sql.count("INSERT INTO staff_member ") == 2, "2 staff_member enlazados"
    # Los PINs declarados verifican contra su hash legacy.
    for _name, pin, _role, pin_hash, _f, _l in g.CASHIERS:
        assert _check_pin_legacy(pin_hash, pin), f"PIN {pin} no verifica contra su hash"
    # El enlace hub_user ↔ staff_member usa user_id.
    assert "user-restaurant-cashier1" in sql and "staff-restaurant-cashier1" in sql
    # El cajero REUTILIZA el rol de operador 'employee' (que ya existe en los module.json);
    # NO se crea un rol 'cashier'.
    assert all(role == "employee" for _n, _p, role, _h, _f, _l in g.CASHIERS)
    assert "'employee'" in sql


def test_idempotent_guards():
    _data, sql = _restaurant()
    # Cuenta sobre las líneas NO comentario (igual que el runtime: seed.rs descarta `--`),
    # para no contar el `WHERE NOT EXISTS` que aparece dentro de un comentario de cabecera.
    code = "\n".join(l for l in sql.splitlines() if not l.lstrip().startswith("--"))
    inserts = code.count("INSERT INTO ")
    guards = code.count("WHERE NOT EXISTS")
    assert inserts == guards, (
        f"cada INSERT debe llevar WHERE NOT EXISTS ({inserts} vs {guards})"
    )


def test_disk_bundles_have_matching_sha256():
    """Layout ADR-0072: cada `starter_catalogs/<país>/<sector>/seed.sql` tiene un `seed.sha256`
    que coincide byte a byte (la verificación de integridad que aplica el runtime al importar).
    Cubre el seed generado (restaurant) Y el escrito a mano (beauty), atrapando drift del hash.
    """
    import hashlib
    from pathlib import Path

    seeds_root = Path(g.OUT_DIR)
    seed_files = sorted(seeds_root.glob("*/*/seed.sql"))
    assert seed_files, "no hay bundles starter_catalogs/<país>/<sector>/seed.sql"
    for seed in seed_files:
        sha_file = seed.with_name("seed.sha256")
        assert sha_file.exists(), f"falta seed.sha256 junto a {seed}"
        expected = sha_file.read_text(encoding="utf-8").strip()
        actual = hashlib.sha256(seed.read_bytes()).hexdigest()
        assert actual == expected, (
            f"sha256 no cuadra para {seed} (drift): {actual} != {expected}"
        )


def test_image_is_a_media_path_inside_the_bundle():
    """El `image` es una RUTA DE MEDIA (`catalog/<carpeta>/<fichero>.webp`), no un esquema lógico.

    `media:public/...` se retiró (ERPlora/hub#1006, supersede la opción «shared» de ADR-0072 §7.3 y
    la parte de ADR-0134 que definía `media:<origen>/<tipo>/<path>`): **nadie lo resolvía**, ni en el
    hub, ni en el SaaS, ni en los 25 módulos. Un esquema que solo emite el generador es una promesa
    a un resolvedor que no existe, y el resultado en el mostrador es la baldosa vacía.

    Lo que gana es lo que ya hacen Odoo, Shopify, WooCommerce, Business Central, Lightspeed, Toast,
    Square y Fresha: **una copia por tenant**. Las imágenes viajan en el bundle (`media/`) y el
    producto guarda la ruta con la que el gestor de media del hub las sirve — el mismo contrato que
    el export/import de blueprints (`media/catalogo/cafe.webp`, hub#1008).
    """
    data, _ = _restaurant()
    for p in data["products"]:
        img = p["image"]
        assert img.startswith(f"{g.MEDIA_FOLDER}/"), (
            f"{p['sku']}: image debe ser una ruta de media `{g.MEDIA_FOLDER}/…`, no {img!r}"
        )
        assert ":" not in img, (
            f"{p['sku']}: un esquema lógico volvió a colarse ({img!r}); nadie lo resuelve"
        )
        assert not img.startswith("assets/"), (
            f"{p['sku']}: s3_key cruda legacy: {img!r}"
        )


def test_no_raw_assets_prefix_left_in_disk_seeds():
    """Ni un `assets/…` crudo en los seeds del disco: si queda uno, ese producto se pinta
    contra un prefijo que ya no existe en el bucket (el sync usa --delete) y no se ve.
    Cubre el seed generado (restaurant) y el escrito a mano (beauty).
    """
    from pathlib import Path

    for seed in sorted(Path(g.OUT_DIR).glob("*/*/seed.*")):
        if seed.suffix not in (".sql", ".json"):
            continue
        body = seed.read_text(encoding="utf-8")
        assert "assets/" not in body, f"{seed} aún hornea el prefijo legacy 'assets/'"


#: Tablas sembradas por cada vertical. Un seed de sector X sólo puede tocar las tablas de X
#: (más las compartidas `hub_user` / `staff_member`, comunes a cualquier negocio con cajeros).
#: Refleja el defecto de blueprints#14: el `.blueprint.zip` Peluquería publicado arrastraba
#: 280 `inventory_product` de Restaurante porque se exportó desde un hub contaminado. Aquí no
#: hay `.blueprint.zip` (lo publica el SaaS), pero el isomorfo en seeds sería que un seed de
#: belleza sembrara `inventory_*`; este test lo atrapa en el disco antes de llegar a S3.
SECTOR_TABLES = {
    "restaurant": {
        "inventory_category",
        "inventory_product",
        "inventory_product_categories",
    },
    "beauty": {
        "services_category",
        "services_service",
        "services_settings",
        "staff_role",
        "staff_service",
        "staff_settings",
        "staff_schedule",
        "staff_working_hours",
        "schedules_business_hours",
        "schedules_settings",
        "pricing_price_list",
        "pricing_price_list_item",
    },
}
#: Comunes a cualquier sector (cajeros + personal que cobra).
SHARED_TABLES = {"hub_user", "staff_member"}


def _seed_tables(sql: str) -> set[str]:
    """Tablas que un `seed.sql` siembra (sólo líneas `INSERT INTO`, como hace el runtime)."""
    return {
        m.group(1).lower()
        for line in sql.splitlines()
        if not line.lstrip().startswith("--")
        for m in [re.match(r"\s*INSERT\s+INTO\s+([a-z_]+)", line, re.IGNORECASE)]
        if m
    }


def test_disk_seeds_do_not_leak_other_sector_tables():
    """Coherencia sectorial de los seeds (regresión de blueprints#14).

    Un seed de sector X no puede sembrar tablas de un sector Y: el seed de belleza no debe
    tocar `inventory_*` (que es lo que arrastraba el bundle Peluquería publicado). El modelo
    publicable (`.blueprint.zip`) vive en el SaaS; aquí se vigila el isomorfo en los seeds del
    disco, que son la única fuente de verdad de este repo.
    """
    from pathlib import Path

    seeds = sorted(Path(g.OUT_DIR).glob("*/*/seed.sql"))
    assert seeds, "no hay bundles starter_catalogs/<país>/<sector>/seed.sql"
    known_sectors = set(SECTOR_TABLES)
    for seed in seeds:
        sector = seed.parent.name
        # Sectores nuevos (p. ej. tobacco/retail) no se inventan la lista aquí: el test pasa a
        # ser ruido verde hasta que alguien los añada a SECTOR_TABLES. Mejor que fallar a ciegas.
        if sector not in known_sectors:
            continue
        own = SECTOR_TABLES[sector] | SHARED_TABLES
        foreign = _seed_tables(seed.read_text(encoding="utf-8")) - own
        assert not foreign, (
            f"{seed} siembra tablas de otro vertical: {sorted(foreign)}. "
            f"Un seed de «{sector}» sólo puede tocar {sorted(own)}. "
            f"(blueprints#14: el bundle Peluquería contaminado mezclaba restaurant.* en belleza.)"
        )


# ── Cantidades: punto fijo entero a escala 10⁶ (ADR-0147) ────────────────────────────────────
# El dinero (céntimos, ADR-0007) y la cantidad (escala 10⁶, ADR-0147) son DOS contratos distintos
# y conviven en la misma fila: `price`/`cost` en céntimos, `stock`/`low_stock_threshold` a 10⁶.
QUANTITY_SCALE = 1_000_000

# Fila emitida para `inventory_product`, por posición:
#   id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold,
#   tax_category_key, image, created_at, updated_at
# Se ancla en `'physical', ` (el `product_type`) porque es el único literal fijo antes de los
# números: así el test no depende de cómo se escapen el nombre o la descripción.
PRODUCT_ROW_RE = re.compile(
    r"'physical', (?P<price>\d+), (?P<cost>\d+), (?P<stock>\d+), (?P<threshold>\d+), "
    r"'(?P<tax_category_key>[^']*)', '(?P<image>[^']*)'"
)

# Ruta de media `catalog/<carpeta>/<fichero>.webp` — el formato tras retirar `media:` (hub#1006).
IMAGE_REF_RE = re.compile(
    r"catalog/(?P<folder>[^/'\"]+)/(?P<filename>[^'\"\s]+\.webp)"
)


def _product_rows(sql: str) -> list[dict[str, int | str]]:
    rows = [m.groupdict() for m in PRODUCT_ROW_RE.finditer(sql)]
    for r in rows:
        for k in ("price", "cost", "stock", "threshold"):
            r[k] = int(r[k])
    return rows


def test_stock_quantities_are_micro_scaled():
    """ADR-0147: `stock` y `low_stock_threshold` son CANTIDADES en punto fijo a escala 10⁶.

    El import del blueprint escribe el SQL del bundle **tal cual** (`import_sql.rs::apply` →
    `execute_batch`, sin aritmética), y la columna es `BIGINT` a escala 10⁶ desde
    `inventory/migrations/postgres/006_quantity_fixed_point.sql`. Un `stock` de `1000` plano NO
    son 1000 unidades: la UI hace `fromMicro` y pinta **0.001**. Es el modo de fallo de
    ERPlora/blueprints#18 (allí `20` → `0.00002`).
    """
    _data, sql = _restaurant()
    rows = _product_rows(sql)
    assert rows, "el SQL debe emitir filas de inventory_product"
    for r in rows:
        assert r["stock"] % QUANTITY_SCALE == 0, (
            f"stock={r['stock']} no es múltiplo de 10⁶: llegaría como "
            f"{r['stock'] / QUANTITY_SCALE} unidades (ADR-0147)"
        )
        assert r["stock"] >= QUANTITY_SCALE, (
            f"stock={r['stock']} es menos de UNA unidad lógica (ADR-0147)"
        )
        assert r["threshold"] % QUANTITY_SCALE == 0, (
            f"low_stock_threshold={r['threshold']} no es múltiplo de 10⁶ (ADR-0147)"
        )


def test_money_and_quantity_scales_do_not_get_mixed_up():
    """El precio NO se escala a 10⁶ (sigue en céntimos, ADR-0007/0123).

    Guarda el arreglo de #18 por el otro lado: multiplicar «todos los números» por 10⁶ rompería
    la frontera fiscal. `price` es céntimos y se queda en céntimos.
    """
    data, sql = _restaurant()
    by_sku = {p["sku"]: p["price"] for p in data["products"]}
    rows = _product_rows(sql)
    prices_in_sql = sorted(r["price"] for r in rows)
    assert prices_in_sql == sorted(by_sku.values()), (
        "el precio del SQL debe ser el mismo entero de céntimos que el del JSON"
    )
    assert max(prices_in_sql) < 1_000_000, (
        "un precio ≥ 10⁶ céntimos (10 000 €) en hostelería = alguien escaló el dinero como cantidad"
    )


def test_seed_json_declares_the_quantity_scale():
    """El JSON declara sus unidades igual que ya declara `price_unit: cents`.

    Sin esto, quien lea el bundle no puede saber si un `stock` es unidades o micro-unidades — y
    ese es exactamente el dato que se perdió en #18.
    """
    data, _sql = _restaurant()
    assert data.get("quantity_scale") == QUANTITY_SCALE, (
        "el seed.json debe declarar quantity_scale = 1_000_000 (ADR-0147)"
    )
    assert data["products"], "el sector debe producir productos"
    for p in data["products"]:
        assert isinstance(p.get("stock"), int), (
            f"{p['sku']}: falta stock (int) en el JSON"
        )
        assert p["stock"] % QUANTITY_SCALE == 0, (
            f"{p['sku']}: stock={p['stock']} no es múltiplo de quantity_scale"
        )


def test_disk_seeds_store_quantities_in_micro_units():
    """Lo mismo, sobre los bundles YA ESCRITOS en disco (no solo sobre la salida en memoria).

    Es el test que atrapa un `seed.sql` que se quedó sin regenerar tras arreglar el generador:
    lo que se publica a S3 y lo que aplica el e2e del Hub
    (`hub/crates/runtime/tests/sector_packs_pg_e2e.rs`) es el FICHERO, no la función.
    """
    from pathlib import Path

    seeds = sorted(Path(g.OUT_DIR).glob("*/*/seed.sql"))
    assert seeds, "no hay bundles starter_catalogs/<país>/<sector>/seed.sql"
    checked = 0
    for seed in seeds:
        for r in _product_rows(seed.read_text(encoding="utf-8")):
            checked += 1
            assert r["stock"] % QUANTITY_SCALE == 0, (
                f"{seed}: stock={r['stock']} sin escalar a 10⁶ (ADR-0147)"
            )
            assert r["threshold"] % QUANTITY_SCALE == 0, (
                f"{seed}: low_stock_threshold={r['threshold']} sin escalar a 10⁶ (ADR-0147)"
            )
    assert checked, (
        "ningún seed del disco trae filas de inventory_product que comprobar"
    )


# ── Imágenes: la ref lógica tiene que apuntar a un fichero que EXISTA ────────────────────────


def test_every_image_ref_in_the_disk_seeds_exists_in_the_library():
    """Cada `catalog/<carpeta>/<fichero>.webp` de los seeds resuelve a un fichero REAL de `img/`.

    Una ruta que apunta a un fichero inexistente es un producto sin foto **en el mostrador del
    cliente**, y el bundle ya estará publicado e INMUTABLE (ADR-0121): no se corrige, se sustituye.
    Por eso se comprueba aquí, en el único punto donde las rutas y los bytes están juntos.
    """
    from pathlib import Path

    library = Path(g.ASSETS)
    seeds = [
        s
        for s in sorted(Path(g.OUT_DIR).glob("*/*/seed.*"))
        if s.suffix in (".sql", ".json")
    ]
    assert seeds, "no hay seeds que comprobar"
    missing: list[str] = []
    total = 0
    for seed in seeds:
        for m in IMAGE_REF_RE.finditer(seed.read_text(encoding="utf-8")):
            folder, filename = m.group("folder"), m.group("filename")
            if (
                "<" in folder or "*" in filename
            ):  # el comentario de cabecera, no una fila
                continue
            total += 1
            if not (library / folder / filename).is_file():
                missing.append(f"{seed.name} → img/{folder}/{filename}")
    assert total, "ningún seed referencia imágenes (¿se perdieron las refs?)"
    assert not missing, (
        f"{len(missing)} ref(s) de imagen apuntan a ficheros que NO existen en img/:\n  "
        + "\n  ".join(sorted(set(missing))[:20])
    )


def test_no_product_is_left_without_an_image_ref():
    """Un producto sin imagen sale con el marco vacío en el TPV (#17). Si el generador tiene el
    fichero, el producto tiene que llevarlo: el hueco vacío se ve como «se ha roto algo»."""
    data, _sql = _restaurant()
    sin_imagen = [p["sku"] for p in data["products"] if not p.get("image")]
    assert not sin_imagen, f"productos sin ref de imagen: {sin_imagen[:10]}"


# ── Texto visible: español correcto (el cliente final lo lee) ────────────────────────────────
# Los nombres se derivan del nombre de FICHERO de la imagen (`cafe_con_leche.webp`), que es
# `snake_case` ASCII por el gate de assets — así que sin un mapa de visualización el catálogo
# entero sale sin tildes. La lista es CERRADA (formas concretas), no una heurística: aquí un
# falso positivo bloquearía la generación.
KNOWN_MISSPELLINGS = {
    "cafe": "café",
    "te": "té",
    "jamon": "jamón",
    "salmon": "salmón",
    "atun": "atún",
    "limon": "limón",
    "pina": "piña",
    "cana": "caña",
    "menu": "menú",
    "racion": "ración",
    "espanola": "española",
    "sandwich": "sándwich",
    "sangria": "sangría",
    "tonica": "tónica",
    "tiramisu": "tiramisú",
    "fideua": "fideuá",
    "lasana": "lasaña",
    "albarino": "albariño",
    "iberico": "ibérico",
    "iberica": "ibérica",
    "clasico": "clásico",
    "clasica": "clásica",
    "arandanos": "arándanos",
    "japones": "japonés",
    "bombom": "bombón",
    "culin": "culín",
    "lahmacun": "lahmacún",
    "cesar": "césar",
}


def test_visible_names_are_written_in_correct_spanish():
    """Ni un nombre de producto con una palabra española sin tilde (ERPlora/blueprints#17).

    Es texto que lee el cliente final en el TPV. La UI se traduce (inglés fuente + `es`), pero el
    NOMBRE de un artículo es dato del catálogo: si nace mal escrito, nace mal escrito en la BD de
    cada hub que importe la plantilla.
    """
    data, sql = _restaurant()
    offenders: dict[str, list[str]] = {}
    for p in data["products"]:
        for word in p["name"].lower().split():
            if word in KNOWN_MISSPELLINGS:
                offenders.setdefault(word, []).append(p["name"])
    assert not offenders, "nombres sin tilde: " + "; ".join(
        f"{w}→{KNOWN_MISSPELLINGS[w]} ({len(n)}×, p.ej. {n[0]!r})"
        for w, n in sorted(offenders.items())
    )
    # Y la forma correcta sí aparece: si no, el mapa se aplicó «borrando» en vez de corrigiendo.
    assert "café" in sql.lower(), "ningún nombre lleva la tilde de «café»"


# ── Las imágenes VIAJAN en el bundle (hub#1006) ──────────────────────────────────────────────


def test_every_image_of_a_bundle_travels_inside_it():
    """Lo que el producto referencia tiene que estar DENTRO del bundle, no en un CDN compartido.

    Es la mitad que hacía inútil el esquema retirado: la ruta sola no entrega bytes a nadie. Con la
    copia por tenant, el vertical se lleva sus webp y el hub las sirve por su propio gestor de media
    — sin depender del S3 del SaaS ni de una URL firmada que caduca (el aviso explícito de Shopify).
    """
    from pathlib import Path

    # La copia es DERIVADA y no se commitea (8 MB duplicados de `img/`): se materializa aquí, que
    # es lo mismo que hace el workflow antes de publicar. Sin esto el test pasaría o fallaría según
    # lo que hubiera quedado en el disco de quien lo corre, que es lo contrario de una regresión.
    g.materialize_all_media()
    bundles = sorted(p.parent for p in Path(g.OUT_DIR).glob("*/*/seed.sql"))
    assert bundles, "no hay bundles que comprobar"
    faltan: list[str] = []
    total = 0
    for bundle in bundles:
        body = (bundle / "seed.sql").read_text(encoding="utf-8")
        for m in IMAGE_REF_RE.finditer(body):
            folder, filename = m.group("folder"), m.group("filename")
            if "<" in folder or "*" in filename:
                continue
            total += 1
            if not (bundle / "media" / g.MEDIA_FOLDER / folder / filename).is_file():
                faltan.append(f"{bundle.name} → media/{g.MEDIA_FOLDER}/{folder}/{filename}")
    assert total, "ningún seed referencia imágenes (¿se perdieron las rutas?)"
    assert not faltan, (
        f"{len(faltan)} imagen(es) referenciadas que NO viajan en el bundle:\n  "
        + "\n  ".join(sorted(set(faltan))[:20])
    )


def test_no_media_scheme_survives_anywhere_in_the_bundles():
    """El control de la retirada: ni un `media:` en ningún fichero publicado.

    Sin esto, arreglar el generador y dejar un seed escrito a mano con el esquema viejo pasaría
    desapercibido — y es exactamente lo que había: `beauty/seed.sql` está escrito a mano.
    """
    from pathlib import Path

    supervivientes = [
        f"{p.parent.parent.name}/{p.parent.name}/{p.name}"
        for p in sorted(Path(g.OUT_DIR).glob("*/*/*"))
        if p.suffix in (".sql", ".json") and "media:" in p.read_text(encoding="utf-8")
    ]
    assert not supervivientes, f"el esquema retirado sigue en: {supervivientes}"


def main() -> int:
    tests = [
        v for k, v in sorted(globals().items()) if k.startswith("test_") and callable(v)
    ]
    failed = []
    for t in tests:
        try:
            t()
            print(f"  ok {t.__name__}")
        except AssertionError as e:
            print(f"  FAIL {t.__name__}: {e}")
            failed.append(t.__name__)
    print()
    if failed:
        print(f"FAILED ({len(failed)}): {', '.join(failed)}")
        return 1
    print(f"ALL PASSED ({len(tests)} tests)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
