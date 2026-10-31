# ERPlora Blueprints — librería de imágenes de producto

Librería abierta de imágenes de producto de [ERPlora](https://erplora.com) que comparten **todos los hubs**,
y su manifiesto bilingüe `img/catalog.json`, con el que el Hub y su asistente encuentran la imagen de un
producto por cómo lo llama la gente, en español o en inglés.

Son miniaturas de 512×512 sobre fondo blanco para la ficha del producto en el TPV o en una factura: ilustraciones
planas en belleza, fitness y spa, y fotos recortadas en hostelería y comercio.

## Carpetas

| Carpeta | Imágenes | Para qué |
|---|---:|---|
| `beauty_body/` | 22 | estética corporal y facial |
| `beauty_hair/` | 39 | peluquería |
| `fitness/` | 1 | gimnasio |
| `hospitality/` | 128 | hostelería: restaurante, bar, cafetería |
| `retail/` | 79 | comercio |
| `wellness_spa/` | 9 | spa y bienestar |

278 imágenes, 278 dibujos distintos: cada fichero es un dibujo y cada dibujo tiene un solo nombre. Los productos
que se quedaron sin imagen al quitar las copias (2026-10-31) están en
[`docs/DEDUP-2026-10-31.md`](docs/DEDUP-2026-10-31.md).

La carpeta es la de `img/`, no el sector del negocio: el restaurante usa `hospitality/` y la peluquería,
`beauty_hair/` y `beauty_body/`.

## Convenciones

- **Formato**: WebP real (no un PNG renombrado), exactamente 512×512, calidad 85, fondo blanco y sin texto.
- **Nombres**: `snake_case.webp`, y las carpetas también en snake_case. Los nombres mezclan español e inglés
  (`aceite_argan.webp`, `coffee_espresso.webp`) y **describen lo que se ve** (ver «Un dibujo, un nombre»). El
  nombre «bueno», el que usa la gente, va en el manifiesto.
- Bajo `img/` solo hay WebP y el manifiesto `img/catalog.json`.
- Una imagen publicada **no cambia de dibujo**: se sirve con caché inmutable de un año, así que el navegador
  que ya la tiene no vería el cambio. Si una imagen hay que rehacerla, entra con un nombre nuevo.

Lo comprueba `scripts/validate_assets.py` (lo corre la CI en cada PR).

**Sin marcas de terceros.** La librería se publica con licencia MIT, así que solo entran iconos planos propios
o fotos propias o generadas de **productos genéricos**: ni marcas, ni logotipos, ni envases o etiquetas
reconocibles, ni carteles o rótulos de un comercio, ni personas reconocibles. El manifiesto tampoco nombra
marcas: `scripts/catalog.py validate` rechaza un título o un tag con una palabra de su lista de marcas
bloqueadas (`BLOCKED_BRANDS`: «Coca-Cola», «Fanta», «Jäger», «Nutella», «Frappuccino»…), así que lo genérico
manda («Refresco de cola», «Chupito de hierbas», «Café frappé»). Lo que se retiró por este motivo, y por qué,
está en [`docs/REMOVED-2026-10-31.md`](docs/REMOVED-2026-10-31.md).

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
- Dos ficheros de `img/` nunca son idénticos byte a byte: un dibujo, un nombre (ver «Un dibujo, un nombre»).
- `title.en` y `title.es`: lo que diría el dueño del negocio, en lenguaje natural, con mayúscula inicial y
  sin guiones bajos («Café solo», «Corte de señora»).
- `tags.en` y `tags.es`: al menos un sinónimo por idioma, en minúsculas, de los que escribiría una persona o
  el asistente («café con leche», «latte»), sin repetir el título.
- Ni el título ni los tags nombran una marca de terceros (`BLOCKED_BRANDS`, palabra entera, sin distinguir
  mayúsculas).

El manifiesto describe lo que **se ve** en la imagen, no lo que dice su nombre de fichero: si el nombre
engaña, manda el dibujo.

### Un dibujo, un nombre

La IA del Hub busca una imagen por su nombre, su título y sus tags: un nombre que engaña le hace proponer el
dibujo equivocado (una tarjeta de socio para «Clase de yoga»). Por eso (decisión de Ioan, 2026-10-31):

- **un dibujo, un fichero**: el mismo dibujo no se guarda con dos nombres, ni en la misma carpeta ni en otra.
  `scripts/catalog.py validate` falla si dos WebP de `img/` son idénticos byte a byte y lista cada grupo; lo
  corre la CI en cada PR;
- **el nombre describe el dibujo**, igual que el título: `batido_fresa` es un batido rosa, no un zumo de naranja.
  Si el dibujo vale para varios productos parecidos (un helado de una bola, una copa de vino tinto), el nombre es
  el del producto más genérico y los demás se buscan por los tags;
- un producto **sin dibujo propio** se queda sin imagen hasta que entre la suya, nunca con la de otro producto;
- un nombre que engaña se **renombra**: el nombre nuevo es otra imagen para el bucket y la caché, y el viejo
  sigue servido en el bucket hasta la poda. Un nombre retirado **no vuelve** con otro dibujo: la imagen nueva
  de ese producto entra con un nombre que no se haya usado nunca en `img/` (`git log --all -- img/`).

Lo que se quitó y renombró el 2026-10-31, y la lista de productos que esperan su imagen, está en
[`docs/DEDUP-2026-10-31.md`](docs/DEDUP-2026-10-31.md).

### Marcadores

En `retail/` hay imágenes que son un **marcador** (un cuadrado de color con el nombre del producto escrito en
español, como `agenda.webp` o `zapatos.webp`): su título es el texto que se lee.

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
