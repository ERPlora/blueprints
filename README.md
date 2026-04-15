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
├── tobacco/
└── wellness_spa/
```

Each folder contains images named descriptively (e.g. `coffee_espresso.webp`, `hair_cut_female.webp`) so they can be matched to product names by the Assistant.

## Conventions

- **Format**: WebP, 512×512, quality 85
- **Style**: flat vector, bold outlines, solid colors, white background, no text
- **Naming**: `snake_case.webp` in English or native language (no prefixes)

## Contribute

New images are welcome. To convert PNGs to the expected format:

```bash
pip install pillow
python scripts/convert_to_webp.py path/to/image.png
```

Then submit a PR with the file placed under the correct sector folder.

## Served via CDN

On push to `main`, a GitHub Action syncs `assets/` to `s3://erplora-storage/assets/` and the Hub consumes the listing via `https://erplora.com/api/v1/catalog/assets/?sector=<sector>`.

## License

MIT
