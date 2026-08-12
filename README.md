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

> 🔴 **Ese proxy NO EXISTE todavía** (`ERPlora/blueprints#17`, verificado 2026-08-12). `media:` se
> **escribe** aquí y **no lo lee nadie**: `GET /api/v1/catalog/media/<key>` no tiene código en el
> SaaS (solo prosa en ADR-0134), y el consumidor final hace
> `background-image:url(media:public/img/…)` — un esquema de URL que el navegador descarta, así
> que la ficha del TPV sale con el **marco vacío**. `GET /api/v1/catalog/assets/` sí existe y es
> `AllowAny`, pero devuelve **solo metadatos** (`s3_key`, `filename`, `size`): ni bytes ni URL
> firmada. Y el bucket es privado de verdad —
> `https://erplora-saas.fsn1.your-objectstorage.com/img/...` → **403**.
>
> **La ref lógica se mantiene a propósito** (no se sustituye por una URL absoluta): el valor viaja
> a la columna `image` de la BD de **cada hub cliente** dentro de un `.blueprint.zip` que es
> **inmutable** (ADR-0121 — una corrección es una versión nueva, nunca un overwrite). Una URL
> horneada en un artefacto inmutable no se puede repuntar el día que cambie el dominio, el bucket
> o el CDN: se podriría en todos los bundles publicados a la vez, que es la forma exacta del fallo
> que ya se pagó cuando la poda del marketplace borró los zips que los blueprints clavaban. Lo que
> falta es **el resolvedor**, no otro formato de dato. Mientras no exista, este repo garantiza al
> menos que **toda ref apunta a un fichero que existe**
> (`test_every_image_ref_in_the_disk_seeds_exists_in_the_library`).

## 🪦 Starter seeds — RETIRADOS (ADR-0121)

Los starter seeds SQL se retiraron (**ADR-0121**, 2026-07-12; supersede la parte SQL de ADR-0072):
el SQL de siembra ya no se escribe a mano — las plantillas salen del **EXPORT de un hub
configurado** (`.blueprint.zip`). El diseño vivo: `architecture/saas/blueprints.md`. Este repo
queda **solo como librería de imágenes WebP**. Los directorios `starter_catalogs/` y el workflow
`publish-to-s3.yml` siguen en el repo como legado pendiente de limpiar (`#8`) — **no construir
sobre ellos**.

**Retirado ≠ inerte** — mientras `#8` no se ejecute, lo que hay en `starter_catalogs/` sigue
teniendo efectos, y por eso se sigue arreglando:

- `publish-to-s3.yml` lo **sincroniza a Object Storage en cada push a `main`**;
- el e2e del Hub lo **aplica a un Postgres real**
  (`hub/crates/runtime/tests/sector_packs_pg_e2e.rs` → `starter_catalogs/es/<sector>/seed.sql`);
- el gate de coherencia del SaaS depende de los **ids namespaced por vertical** que genera
  `build_starter_catalog.py` (`prod-<sector>-…`, lista cerrada `STARTER_CATALOG_VERTICALS`,
  ADR-0324): un starter catalog nuevo hay que añadirlo a esa lista o sus filas son invisibles para
  el gate.

⚠️ **Lo que se publica al catálogo NO sale de aquí.** El `.blueprint.zip` que instala un hub es el
**EXPORT de un hub configurado**, subido al vendor portal y guardado inmutable en
`s3://erplora-saas/media/blueprints/{locale}/{slug}/v{version}.blueprint.zip`; los metadatos viven
en la BD del SaaS (`Blueprint`/`BlueprintVersion`). Ningún código lee `starter_catalogs/` para
construir un bundle. Estos seeds son **ancestro de contenido** (se aplican al hub del que luego se
exporta), no el artefacto: arreglar un seed **no arregla un bundle ya publicado** — eso solo se
corrige publicando una versión nueva desde un hub de origen limpio.

### Dos escalas en la misma fila (no confundirlas)

| Campo | Contrato | Unidad |
|---|---|---|
| `price`, `cost` | ADR-0007 / ADR-0123 | **céntimos** enteros |
| `stock`, `low_stock_threshold` | **ADR-0147** | punto fijo entero a **escala 10⁶** |

El seed se aplica como **SQL crudo** (`runtime/src/import_sql.rs::apply` → `execute_batch`, sin
aritmética): el número que se escribe en el `.sql` es exactamente el que acaba en la columna.
Sembrar `stock = 1000` no son 1000 unidades, son **0,001** — el fallo de `#18`. Escalar es
obligación del emisor; lo fija `test_stock_quantities_are_micro_scaled`.

Si tocas el generador, **regenera** y corre la regresión (la corre también CI,
`test-starter-catalogs.yml`):

```bash
python scripts/build_starter_catalog.py       # regenera seed.{sql,json,sha256}
python scripts/test_build_starter_catalog.py  # 16 tests, sin dependencias
```

## License

MIT
