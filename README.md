# ERPlora Blueprints — librería de imágenes de producto

Librería abierta de imágenes de producto de [ERPlora](https://erplora.com) que comparten **todos los hubs**,
y su manifiesto bilingüe `img/catalog.json`, con el que el Hub y su asistente encuentran la imagen de un
producto por cómo lo llama la gente, en español o en inglés.

Son iconos planos de 512×512 sobre fondo blanco, pensados como miniatura de producto en un TPV o una factura.

## Carpetas

| Carpeta | Imágenes | Para qué |
|---|---:|---|
| `beauty_body/` | 35 | estética corporal y facial |
| `beauty_hair/` | 43 | peluquería |
| `fitness/` | 20 | gimnasio |
| `hospitality/` | 284 | hostelería: restaurante, bar, cafetería |
| `retail/` | 91 | comercio |
| `wellness_spa/` | 18 | spa y bienestar |

La carpeta es la de `img/`, no el sector del negocio: el restaurante usa `hospitality/` y la peluquería,
`beauty_hair/` y `beauty_body/`.

## Convenciones

- **Formato**: WebP real (no un PNG renombrado), exactamente 512×512, calidad 85. Estilo plano, contornos
  marcados, colores sólidos, fondo blanco y sin texto.
- **Nombres**: `snake_case.webp`, y las carpetas también en snake_case. Los nombres mezclan español e inglés
  (`aceite_argan.webp`, `coffee_espresso.webp`) y **no se renombran nunca**: son el contrato de las semillas
  del Hub y de los blueprints ya exportados. El nombre «bueno», el que usa la gente, va en el manifiesto.
- Bajo `img/` solo hay WebP y el manifiesto `img/catalog.json`.
- Una imagen publicada **no cambia de dibujo**: se sirve con caché inmutable de un año, así que el navegador
  que ya la tiene no vería el cambio. Si una imagen hay que rehacerla, entra con un nombre nuevo.

Lo comprueba `scripts/validate_assets.py` (lo corre la CI en cada PR).

## El manifiesto `img/catalog.json`

Es un **contrato**: el Hub lo lee para buscar imágenes y para proponerlas al asistente. Una entrada por imagen:

```json
{
  "version": 1,
  "images": [
    {"name": "coffee_espresso", "folder": "hospitality", "title": {"en": "Espresso", "es": "Café solo"}, "tags": {"en": ["coffee", "short coffee"], "es": ["café", "expreso", "café corto"]}}
  ]
}
```

Reglas (las comprueba `scripts/catalog.py validate`, que lista todos los problemas y sale con código 1 si hay
alguno):

- `version` es `1`; `images` va ordenado por `folder` y después por `name`, una línea por imagen.
- `name` es el nombre del fichero sin `.webp` y `folder`, su carpeta; la pareja existe en `img/` y no se repite.
- Toda imagen de `img/` tiene su entrada.
- `title.en` y `title.es`: lo que diría el dueño del negocio, en lenguaje natural, con mayúscula inicial y
  sin guiones bajos («Café solo», «Corte de señora»).
- `tags.en` y `tags.es`: al menos un sinónimo por idioma, en minúsculas, de los que escribiría una persona o
  el asistente («café con leche», «latte»), sin repetir el título.

El manifiesto describe lo que **se ve** en la imagen, no lo que dice su nombre de fichero: si el nombre
engaña, manda el dibujo.

## Añadir una imagen

```bash
uv sync
uv run python scripts/convert_to_webp.py ruta/a/imagen.png   # PNG o JPG → WebP 512×512 (o una carpeta)
mv ruta/a/imagen.webp img/<carpeta>/<nombre>.webp
uv run python scripts/catalog.py build                       # añade su entrada vacía al manifiesto
# completar a mano title.en, title.es, tags.en y tags.es de la entrada nueva
uv run pytest -q                                             # tests de los scripts y manifiesto completo
uv run python scripts/validate_assets.py img
uv run python scripts/catalog.py validate
```

Después, un PR con el fichero y su entrada. El check `validate` es obligatorio para mergear en `main`.
`catalog.py build` nunca borra una entrada ni se inventa un título: el esqueleto que escribe deja la
validación en rojo hasta que alguien lo completa.

## Cómo la usa el Hub

Decisión del 2026-10-30 (ronda de `PLAN-HUB.md` en `erplora-next`; la implementación vive en `ERPlora/hub`):

- Un producto guarda una **referencia lógica**, `catalog:<carpeta>/<nombre>` (por ejemplo,
  `catalog:hospitality/coffee_espresso`), **nunca una URL**: un blueprint exportado es inmutable y una URL
  horneada se pudre el día que cambian el dominio, el bucket o el CDN.
- El Hub sirve la imagen leyendo de `shared/catalog/` de su bucket; en local, sin bucket, desde `blueprints/img/`.
- El buscador de la ficha del producto y el asistente buscan por el manifiesto (título y tags en el idioma del
  negocio), no por el nombre de fichero.
- Las fotos propias de cada hub no viven aquí: van a la carpeta del hub y se referencian como `file:<nombre>`.

## Publicación

`.github/workflows/publish.yml`, en cada push a `main` que toca `img/**` (y a mano con `workflow_dispatch`):

1. valida las imágenes y el manifiesto;
2. entra en AWS con OIDC (región `eu-west-1`) con el rol de la variable del repositorio `AWS_PUBLISH_ROLE_ARN`,
   uno para los dos buckets; mientras la variable esté vacía el job se salta, no falla;
3. sube primero `pre` y después `prod` a `s3://erplora-<entorno>-hubs/shared/catalog/`: los WebP con
   `Cache-Control: public, max-age=31536000, immutable` y, al final, `catalog.json` con `public, max-age=600`.

**Sin `--delete`** (blueprints#21, ADR-0134 del producto viejo): las semillas y los blueprints referencian las
imágenes por nombre, así que una imagen que falte en el checkout no puede desaparecer del bucket por un push.
Podar es una ejecución manual y explícita (`workflow_dispatch` con `prune=true`): primero enseña qué borraría
y aborta si pasa de `max_prune` objetos por entorno.

El bucket es privado: no hay lectura pública, el Hub sirve.

## Desarrollo

```bash
uv sync                  # Python ≥ 3.12, Pillow y pytest
uv run pytest -q         # tests de scripts/ y el manifiesto real completo
```

La CI (`validate.yml`) corre en cada PR y en cada push a `main`: actionlint de los workflows, los tests,
`validate_assets.py img` y `catalog.py validate`.

## Una sola copia compartida

Este repo sustituye a `erplora-old/blueprints`, del que conserva la historia de `img/`, de los dos scripts
y de la licencia. Allí las fotos **viajaban dentro de cada bundle**, una copia por plantilla y por hub
(ADR-0121, ADR-0371, `hub#1006`). Desde el 2026-10-30 hay **una sola copia por entorno** en el prefijo
compartido del bucket de hubs, y cada hub la referencia. Los `starter_catalogs/` SQL estaban retirados
(ADR-0121) y no se han traído: las semillas del Hub nuevo viven en `hub/base/seeds/`.

## Licencia

MIT, ver `LICENSE`.
