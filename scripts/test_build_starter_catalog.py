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


def test_every_product_references_a_seeded_tax_rate():
    data, sql = _restaurant()
    seeded_ids = {
        f"tax-restaurant-{code.lower()}" for code, _n, _r in g.SPAIN_IVA_RATES
    }
    assert len(seeded_ids) == 4
    # Cada bloque de IVA aparece como INSERT en el SQL, antes que cualquier producto.
    first_product = sql.index("INSERT INTO inventory_product ")
    for tid in seeded_ids:
        idx = sql.index(f"'{tid}'")
        assert idx < first_product, f"{tid} debe sembrarse antes de los productos"
    # Todo producto referencia un tax id sembrado.
    for p in data["products"]:
        tid = f"tax-restaurant-{p['tax_code'].lower()}"
        assert tid in seeded_ids, f"{p['sku']} referencia un IVA no sembrado: {tid}"


def test_alcohol_21_rest_10():
    data, _ = _restaurant()
    by_sku = {p["sku"]: p["tax_code"] for p in data["products"]}
    assert by_sku.get("cerveza_jarra") == "IVA21"
    assert by_sku.get("americano") == "IVA10"


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


def test_image_is_a_media_ref_with_origin_and_type():
    """El `image` es una ref LÓGICA `media:<origen>/<tipo>/<path>`, no una s3_key cruda.

    El origen (`public`) dice quién sirve los bytes (proxy del SaaS, solo-lectura: a la librería
    pública solo se escribe por PR a este repo) y lo distingue de `media:hub/...` (bucket del
    cliente, donde el usuario sí sube). El tipo (`img`) deja hueco a `docs/` sin cambiar el
    formato luego — cambiarlo más tarde sería migrar filas de clientes.
    """
    data, _ = _restaurant()
    for p in data["products"]:
        img = p["image"]
        assert img.startswith("media:public/img/"), (
            f"{p['sku']}: image debe ser una ref media:public/img/…, no {img!r}"
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
