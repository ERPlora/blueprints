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

## Publicación en Object Storage

En cada push a `main`, una GitHub Action (`publish-to-s3.yml`) sincroniza `img/` con
`s3://erplora-saas/img/` (Hetzner Object Storage, bucket **privado** — ADR-0099), sin `--delete`
(`#21`). El SaaS lista esa copia en `GET /api/v1/catalog/assets/?sector=<carpeta>` (público,
**solo metadatos**: `s3_key`, `filename`, `name`, `sector`, `size` — ni bytes ni URL firmada). El
generador de bundles no pasa por ahí: lee `img/` del propio repo. La librería es **solo-lectura**:
se entra por PR a este repo.

**Las fotos VIAJAN con el bundle.** Cada producto/servicio referencia su imagen por una **ruta
relativa dentro del propio artefacto** — `catalog/<carpeta de img/>/<name>.webp`, p. ej.
`catalog/hospitality/agua_mineral.webp` o `catalog/beauty_hair/corte_senora.webp`; la carpeta es la
de `img/`, no el sector (restaurante reusa `img/hospitality/`) —, y el fichero va en la carpeta
`media/catalog/…` del bundle. Esa copia es **derivada** y no se commitea (`.gitignore`): la
materializa `build_starter_catalog.py --materialize-media`, que `publish-seeds.yml` corre justo
antes de sincronizar, igual que los tests.

> 🪦 **El esquema `media:public/…` está RETIRADO** (ADR-0371, que supersede ADR-0134;
> `ERPlora/hub#1006`, cerrada el 2026-08-19). En este repo lo ejecutó `#23` («las fotos VIAJAN con
> el bundle»); la incidencia del marco vacío era `#17`.
>
> Este párrafo describía hasta el 2026-09-08 el modelo anterior —ref lógica `media:public/…`
> resuelta por un `GET /api/v1/catalog/media/<key>` del SaaS— **y advertía en rojo de que ese proxy
> no existía**, con la conclusión de que la ficha del TPV salía con el marco vacío. Las dos mitades
> eran ciertas cuando se escribieron y ninguna lo es hoy: no hay proxy porque **ya no hace falta**.
> Se deja la lápida porque la advertencia vieja seguía induciendo a error semanas después de que el
> esquema muriera — el 2026-09-08 hizo que se declarase un bloqueo inexistente en ERPlora/pm#293.
>
> Lo que motivó el cambio sigue vigente y explica por qué NO se horneó una URL absoluta: el valor
> viaja a la columna `image` de la BD de **cada hub cliente** dentro de un `.blueprint.zip`
> **inmutable** (ADR-0121 — una corrección es una versión nueva, nunca un overwrite), y una URL
> horneada ahí no se puede repuntar el día que cambie el dominio, el bucket o el CDN: se pudriría en
> todos los bundles publicados a la vez. Ese fallo ya se pagó por el otro lado, cuando la poda del
> marketplace borró los zips de módulo que las plantillas clavaban (ADR-0303). Una ruta relativa al
> propio artefacto no tiene ese problema: se resuelve dentro del zip que la contiene.
>
> Lo guardan cuatro tests de `scripts/test_build_starter_catalog.py`, y entre los cuatro cubren las
> dos mitades: que la ref tenga la forma nueva (`test_image_is_a_media_path_inside_the_bundle`), que
> el fichero **viaje de verdad** dentro del bundle (`test_every_image_of_a_bundle_travels_inside_it`),
> que exista en esta librería (`test_every_image_ref_in_the_disk_seeds_exists_in_the_library`) y que
> ningún producto se quede sin foto (`test_no_product_is_left_without_an_image_ref`).

## 🪦 Starter seeds — RETIRADOS (ADR-0121)

Los starter seeds SQL se retiraron (**ADR-0121**, 2026-07-12; supersede la parte SQL de ADR-0072):
el SQL de siembra ya no se escribe a mano — las plantillas salen del **EXPORT de un hub
configurado** (`.blueprint.zip`). El diseño vivo: `architecture/saas/blueprints.md`. Este repo
queda **solo como librería de imágenes WebP**. Los directorios `starter_catalogs/` y el workflow
`publish-seeds.yml` siguen en el repo como legado pendiente de limpiar (`#8`) — **no construir
sobre ellos**.

**Retirado ≠ inerte** — mientras `#8` no se ejecute, lo que hay en `starter_catalogs/` sigue
teniendo efectos, y por eso se sigue arreglando:

- `publish-seeds.yml` lo **sincroniza a Object Storage en cada push a `main`** (workflow propio
  desde `#21`: un merge de seeds ya no ejecuta ningún sync sobre la librería `img/`, y el sync de
  `img/` en `publish-to-s3.yml` ya no lleva `--delete`);
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
python scripts/test_build_starter_catalog.py  # la regresión, sin dependencias
```

## License

MIT
