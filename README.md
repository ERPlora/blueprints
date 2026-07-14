# ERPlora Blueprints — Product Image Library

Open WebP product image library for [ERPlora](https://erplora.com). Used by the Hub to generate starter catalogs.

All images are flat vector icons, 512×512, white background — ideal as product thumbnails in a POS / invoicing system.

## Structure

```
img/
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
python scripts/convert_to_webp.py                     # whole img/ tree
```

Options: `--quality N` (default 85), `--delete-originals`, `--dry-run`.

Then submit a PR with the file placed under the correct sector folder.

PRs touching `img/` are gated by CI (`validate-assets.yml`): only real `.webp` files,
exactly 512×512, `snake_case.webp` names. You can run the same check locally:

```bash
pip install pillow
python scripts/validate_assets.py
```

## Served via CDN

On push to `main`, a GitHub Action syncs `img/` to `s3://erplora-saas/img/` (Hetzner Object Storage, bucket privado — ADR-0099) and the Hub consumes the listing via `https://erplora.com/api/v1/catalog/assets/?sector=<sector>`.

## Starter seeds (catálogo inicial por país/sector — ADR-0072)

Cada hub nuevo arranca con un catálogo real (restaurante o peluquería) **importado** desde S3. El
seed vive estático en `s3://erplora-saas/starter-seeds/<país>/<sector>/`, mirror del directorio
local `starter_catalogs/<país>/<sector>/`:

```text
starter_catalogs/es/restaurant/seed.sql      # IVA ES + 280 productos + cajeros (inventory/taxes/staff)
starter_catalogs/es/restaurant/seed.json     # los mismos datos, estructurados (UI/preview)
starter_catalogs/es/restaurant/seed.sha256   # SHA256 de seed.sql (verificación, patrón module.zip)
starter_catalogs/es/beauty/seed.sql          # IVA ES + servicios + staff + horarios + cajeros
starter_catalogs/es/beauty/seed.sha256
```

- **País** = ISO 3166-1 alpha-2. **Fase 1: solo `es/`** (datos en español, IVA de España).
- **Imágenes COMPARTIDAS** (no se duplican en el bundle): cada producto/servicio referencia su
  imagen por la **ref lógica** `media:public/img/<sector>/<name>.webp` (ADR-0134), no por la s3_key
  desnuda. El origen `public` la resuelve el **proxy del SaaS** (`GET /api/v1/catalog/media/<key>`);
  la librería es solo-lectura: se entra por PR a este repo. El listado sigue en
  `GET /api/v1/catalog/assets/?sector=&q=`. Restaurante reusa las imágenes de `img/hospitality/`.
- **`seed.sql`** es **SQL idempotente** (`WHERE NOT EXISTS`), portable SQLite/Postgres (céntimos
  enteros ADR-0007), mismo estilo que `hub/crates/server/seeds/demo.sql`. El Hub lo descarga,
  **verifica el SHA256**, **sustituye el `hub_id`** demo (`00000000-…-001`) por el real y lo aplica
  vía `runtime/src/seed.rs::apply`. Requiere los módulos del seed (`inventory`/`taxes`/`staff` para
  restaurante; `services`/`staff`/`schedules`/`pricing` para beauty) instalados antes de aplicar.

`restaurant` se **genera** de forma determinista desde `img/hospitality/` con reglas por
palabra clave; `beauty` está **escrito a mano** (`es/beauty/seed.sql`):

```bash
python scripts/build_starter_catalog.py                 # todos los generables (país es)
python scripts/build_starter_catalog.py restaurant      # solo restaurant
python scripts/build_starter_catalog.py --country es restaurant
```

Al añadir imágenes o cambiar reglas, re-ejecuta el generador (regenera `seed.{sql,json,sha256}`,
idempotente). Si editas un `seed.sql` a mano, regenera su `seed.sha256` (un test y la GitHub
Action lo verifican). Publicación: `publish-to-s3.yml` sincroniza `starter_catalogs/` →
`starter-seeds/` en cada push a `main` (tras validar que los SHA256 cuadran).

> Diseño completo del import (endpoint/stepper del Hub = core, columna humano):
> `starter_catalogs/IMPORT-SPEC.md` (pendiente de redactar) — ver ADR-0072 en el decision-log.

## License

MIT
