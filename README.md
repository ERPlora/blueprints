# ERPlora Blueprints

Image library for ERPlora product catalogs. Repo: `git@github:ERPlora/blueprints.git` (branch: main).

> **Nota (2026-04-14):** los datos estructurales (sectores, tipos de negocio, unidades funcionales, compliance, productos seed, traducciones) se migraron a Cloud DB (app `catalog/`), editables desde Django admin con i18n. Este repo ahora solo contiene `data/assets/` — imágenes WebP subidas a S3.

---

## Estructura actual

```
blueprints/
├── data/
│   └── assets/                     # WebP 512x512, organizadas por sector
│       ├── hospitality/
│       ├── beauty_hair/
│       ├── beauty_body/
│       ├── wellness_spa/
│       ├── fitness/
│       ├── retail/
│       └── tobacco/
└── scripts/
    └── convert_to_webp.py          # Utilidad de conversión de imágenes
```

> Los subdirectorios `data/business_types/`, `data/products/`, `data/i18n/`, `data/*.json` y `schema/` son **legacy** — se borrarán tras confirmar la migración a Cloud DB en producción.

---

## Convenciones de imágenes

- Formato: WebP, 512x512, quality 85
- Estilo: flat vector, bold outlines, colores sólidos, fondo blanco, sin texto
- Nombres descriptivos (ej. `coffee_espresso.webp`, `hair_cut_female.webp`) — el asistente los usa para matching por nombre

---

## Subida a S3

Las imágenes se suben a `s3://erplora-storage/assets/{sector}/{filename}.webp` mediante:

```bash
cd cloud
python manage.py migrate_blueprints --blueprints-path=/ruta/a/blueprints --upload-assets
```

Cloud expone el listado en `/api/v1/catalog/assets/?sector=X` (consumido por el Hub).

**Bucket:** `erplora-storage` (no `erplora-main`).

---

## Datos de catálogo

Los datos estructurales (13 sectores, 71 tipos de negocio, 14 UFOs, compliance) están en **Cloud DB** (`catalog/`) y se administran desde el Django admin.
