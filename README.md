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

**Imágenes COMPARTIDAS** (no se duplican en cada plantilla): cada producto/servicio referencia su
imagen por la **ref lógica** `media:public/img/<sector>/<name>.webp` (ADR-0134), no por la s3_key
desnuda. El origen `public` la resuelve el **proxy del SaaS** (`GET /api/v1/catalog/media/<key>`);
la librería es solo-lectura: se entra por PR a este repo. El listado:
`GET /api/v1/catalog/assets/?sector=&q=`. Restaurante reusa las imágenes de `img/hospitality/`.

## 🪦 Starter seeds — RETIRADOS (ADR-0121)

Los starter seeds SQL se retiraron (**ADR-0121**, 2026-07-12; supersede la parte SQL de ADR-0072):
el SQL de siembra ya no se escribe a mano — las plantillas salen del **EXPORT de un hub
configurado** (`.blueprint.zip`). El diseño vivo: `architecture/saas/blueprints.md`. Este repo
queda **solo como librería de imágenes WebP**. Los directorios `starter_catalogs/` y el workflow
`publish-to-s3.yml` siguen en el repo como legado pendiente de limpiar — **no construir sobre
ellos**.

## License

MIT
