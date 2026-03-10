# Blueprints — Plan de contenido e imagenes

> Estado: EN PROGRESO
> Ultima actualizacion: 2026-03-10

---

## Objetivo

Generar contenido completo (catalogos de productos JSON + imagenes WebP) para los **79 business types** del Blueprint System.

### Reglas de imagenes

- **Formato:** WebP, 512x512, fondo blanco, quality 85
- **Estilo:** Flat vector icon, bold outlines, flat solid colors, no text, no labels
- **Reutilizacion:** Si un producto existe en otro sector/tipo con la misma imagen (ej: `agua_mineral`), se **copia** a la carpeta del sector destino. No se genera de nuevo.
- **Generacion:** Solo se generan imagenes nuevas cuando no existe una reutilizable.
- **Herramienta:** ChatGPT Images via Playwright MCP (1 imagen por prompt, ~8-10 por sesion antes de rate limit)
- **Post-proceso:** Descargar PNG → PIL resize 512x512 → WebP q85 → borrar JPG viejo → actualizar refs en JSON

---

## Estado actual de catalogos (38 catalogos existentes)

### COMPLETADOS (imagenes WebP al 100%)

| Catalogo | Productos | Sector |
|----------|-----------|--------|
| bakery | 40 | hospitality |
| bar | 26 | hospitality |
| barber_shop | 20 | personal_services |
| beauty_center | 35 | personal_services |
| fast_food | 36 | hospitality |
| food_truck | 29 | hospitality |
| gym | 21 | personal_services |
| hair_salon | 37 | personal_services |
| ice_cream_shop | 36 | hospitality |
| pizzeria | 37 | hospitality |
| spa | 20 | personal_services |

**Total: 11 catalogos, 337 productos con imagenes completas**

### CASI COMPLETADOS (faltan pocas imagenes o refs)

| Catalogo | Productos | WebP | JPG | Sin ref | Nota |
|----------|-----------|------|-----|---------|------|
| cafeteria | 30 | 26 | 0 | 4 | Faltan refs: cafe_bombon, colacao, palmera, tostada_jamon_queso |
| kebab_shop | 23 | 22 | 0 | 1 | Falta 1 ref |
| restaurant | 20 | 16 | 0 | 4 | Faltan refs: sopa_dia, croquetas_caseras, chuletas_cordero, arroz_con_leche |
| sushi_restaurant | 40 | 39 | 0 | 1 | Falta 1 ref |

### PENDIENTES (tienen catalogo, sin imagenes)

| Catalogo | Productos | Tiene JPG | Sector |
|----------|-----------|-----------|--------|
| bookshop | 23 | 23 (retail) | retail |
| clothing | 24 | 24 (retail) | retail |
| academy | 24 | 0 | education |
| auto_repair | 23 | 0 | construction |
| butcher_shop | 29 | 0 | retail |
| catering | 25 | 0 | hospitality |
| cleaning_company | 22 | 0 | professional_services |
| coworking | 24 | 0 | coworking |
| florist | 25 | 0 | retail |
| food_workshop | 22 | 0 | hospitality |
| freelancer | 21 | 0 | professional_services |
| fruit_shop | 32 | 0 | retail |
| garden_center | 31 | 0 | retail |
| installer | 28 | 0 | construction |
| pet_shop | 27 | 0 | retail |
| physiotherapy | 17 | 0 | personal_services |
| renovation | 25 | 0 | construction |
| sports_club | 29 | 0 | personal_services |
| tattoo_studio | 18 | 0 | personal_services |
| tax_advisory | 22 | 0 | professional_services |
| vet_clinic | 33 | 0 | retail |
| wholesale_distributor | 28 | 0 | retail |

### SIN CATALOGO (no tienen JSON de productos)

| Business type | Sector |
|--------------|--------|
| bazaar | retail |
| bicycle_shop | retail |
| cosmetics | retail |
| fish_shop | retail |
| gourmet | retail |
| second_hand | retail |
| street_market | retail |
| electronics | retail |
| furniture | retail |
| hardware_store | retail |
| health_store | retail |
| jewelry | retail |
| nutrition_shop | retail |
| sports_shop | retail |
| tobacco_shop | retail |
| toy_shop | retail |
| wine_shop | retail |
| dog_grooming | personal_services |
| laser_hair_removal | personal_services |
| laundry | personal_services |
| nutrition | personal_services |
| pilates_yoga | personal_services |
| podiatry | personal_services |
| psychology | personal_services |
| admin_agency | professional_services |
| consulting | professional_services |
| design_studio | professional_services |
| landscaping | professional_services |
| law_firm | professional_services |
| maintenance_company | professional_services |
| marketing | professional_services |
| dance_school | education |
| driving_school | education |
| language_school | education |
| music_school | education |
| carpentry | construction |
| construction_company | construction |
| locksmith | construction |
| electronics_repair | manufacturing |
| printing | manufacturing |
| escape_room | entertainment |
| event_venue | entertainment |
| photography | media |
| bike_rental | rental |

---

## Fase 1 — Hospitality: completar JPG → WebP

**Estado: COMPLETADO** (2026-03-10)

- 284/284 WebP, 0 JPGs restantes en hospitality/

---

## Fase 2 — Personal services: completar beauty_center + spa + gym

**Estado: COMPLETADO** (2026-03-10)

- beauty_center: 35/35 WebP, JSON refs actualizados, JPGs borrados
- spa: 20/20 WebP, JSON refs actualizados, JPGs borrados
- gym: 21/21 WebP, JSON refs actualizados, JPGs borrados
- 0 JPGs restantes en personal_services/

---

## Fase 3 — Retail: bookshop + clothing

**Estado: DESCARTADO** — Los productos de retail son demasiado variados/especificos de cada negocio. No tiene sentido generar imagenes genericas (a diferencia de hospitality/personal_services donde los productos son estandar).

---

## Fase 4 — Completar refs faltantes en catalogos casi completos

**Estado: COMPLETADO** (2026-03-10)

- cafeteria: 4 refs fijadas (cafe_bombon→cafe_bombom, colacao→cafe_con_leche, palmera→palmera_chocolate, tostada_jamon_queso→tostada_tomate)
- restaurant: 4 refs fijadas (sopa_dia→sopa_miso, croquetas_caseras→croquetas_jamon, chuletas_cordero→entrecot, arroz_con_leche→flan_casero)
- kebab_shop: menu_durum→durum_mixto
- sushi_restaurant: sake_botella→sake_copa

---

## Fase 5 — Crear catalogos + imagenes para tipos sin catalogo (44 tipos)

Ver seccion "SIN CATALOGO" arriba. Requiere:
1. Crear JSON de productos para cada tipo
2. Generar imagenes nuevas (reutilizando de otros sectores cuando sea posible)

---

## Fase 6 — Crear imagenes para catalogos sin imagenes (22 tipos)

Ver seccion "PENDIENTES" arriba. Ya tienen catalogo JSON pero necesitan:
1. Asignar refs de imagen a cada producto
2. Generar imagenes (reutilizando cuando sea posible)
3. Crear carpetas de assets por sector si no existen

---

## Limpieza pendiente

- [x] Borrar JPGs duplicados en `personal_services/` — HECHO (0 JPGs restantes)
- [x] Actualizar refs `.jpg` → `.webp` en JSONs de beauty_center, spa, gym — HECHO
- [ ] ~~Actualizar refs `.jpg` → `.webp` en JSONs de bookshop, clothing~~ — NO NECESARIO (retail descartado)
- [x] Verificar que hospitality JPGs eliminados — 0 JPGs restantes

---

## Resumen numerico

| Fase | Que | Imagenes pendientes | Estado |
|------|-----|---------------------|--------|
| 1 | Hospitality JPG → WebP | 0 | COMPLETADO |
| 2 | Personal services (beauty+spa+gym) | 0 | COMPLETADO |
| 3 | Retail (bookshop+clothing) | — | DESCARTADO (productos muy variados) |
| 4 | Refs faltantes (cafe+rest+kebab+sushi) | 0 | COMPLETADO |
| 5 | Crear catalogos nuevos | 44 tipos | PENDIENTE |
| 6 | Imagenes para catalogos sin img | 22 tipos | PENDIENTE |
