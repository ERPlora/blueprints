# ERPlora Blueprints — Product Image Library

Open WebP product image library for [ERPlora](https://erplora.com). Used by the Hub to generate starter catalogs.

All images are flat vector icons, 512×512, white background — ideal as product thumbnails in a POS / invoicing system.

## Structure

```
assets/
├── beauty_body/
├── beauty_hair/
├── fitness/
├── hospitality/
├── retail/
└── wellness_spa/
```

Each folder contains images named descriptively (e.g. `coffee_espresso.webp`, `hair_cut_female.webp`) so they can be matched to product names by the Assistant.

## Conventions

- **Format**: WebP, 512×512, quality 85
- **Style**: flat vector, bold outlines, solid colors, white background, no text
- **Naming**: `snake_case.webp` in English or native language (no prefixes)

## Contribute

New images are welcome. To convert PNGs/JPGs to the expected format:

```bash
pip install pillow
python scripts/convert_to_webp.py path/to/image.png   # single file or directory
python scripts/convert_to_webp.py                     # whole assets/ tree
```

Options: `--quality N` (default 85), `--delete-originals`, `--dry-run`.

Then submit a PR with the file placed under the correct sector folder.

PRs touching `assets/` are gated by CI (`validate-assets.yml`): only real `.webp` files,
exactly 512×512, `snake_case.webp` names. You can run the same check locally:

```bash
pip install pillow
python scripts/validate_assets.py
```

## Served via CDN

On push to `main`, a GitHub Action syncs `assets/` to `s3://erplora-storage/assets/` and the Hub consumes the listing via `https://erplora.com/api/v1/catalog/assets/?sector=<sector>`.

## Starter catalogs (menús por sector)

`starter_catalogs/<sector>.json` es un **menú pre-construido** por sector: categorías + productos
(con precio, IVA e imagen) listos para sembrar el catálogo inicial de un hub nuevo de ese sector.
Cada producto referencia su imagen por la **misma `s3_key`** que devuelve
`GET /api/v1/catalog/assets/?sector=<sector>` (`assets/<sector>/<name>.webp`), así el consumidor
(Hub/Cloud) construye la URL del CDN (`erplora-storage`) sin lógica extra.

Se generan de forma determinista desde `assets/` con reglas por palabra clave:

```bash
python scripts/build_starter_catalog.py              # todos los sectores con reglas
python scripts/build_starter_catalog.py hospitality  # solo uno
```

Genera dos artefactos por sector:
- `starter_catalogs/<sector>.json` — el menú en JSON (para consumir por API/onboarding).
- `starter_catalogs/<sector>.sql` — **SQL idempotente** que siembra `inventory_category` +
  `inventory_product` (+ M2M) del Hub, mismo estilo que `hub/crates/server/seeds/demo.sql`.
  Se inyecta vía `HUB_SEED_SQL`/`HUB_SEED_SQL_PATH`; por defecto usa el `hub_id` del demo
  (`aws/terraform/ecs_demo.tf`), o pásalo con `--hub-id <uuid>`. Requiere que el módulo
  `inventory` ya esté instalado (sus tablas existan) antes de aplicarse.

Al añadir imágenes nuevas, re-ejecuta el generador para regenerar JSON+SQL (idempotente).
Hoy hay reglas para `hospitality` (restaurante/bar/cafetería, 280 productos en 19 categorías).

## License

MIT
