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
| fast_food | 36 | hospitality |
| food_truck | 29 | hospitality |
| hair_salon | 37 | personal_services |
| ice_cream_shop | 36 | hospitality |
| pizzeria | 37 | hospitality |

**Total: 8 catalogos, 261 productos con imagenes completas**

### CASI COMPLETADOS (faltan pocas imagenes o refs)

| Catalogo | Productos | WebP | JPG | Sin ref | Nota |
|----------|-----------|------|-----|---------|------|
| beauty_center | 35 | 9 | 26 | 0 | 9/35 WebP, 26 JPG pendientes |
| cafeteria | 30 | 26 | 0 | 4 | Faltan refs: cafe_bombon, colacao, palmera, tostada_jamon_queso |
| kebab_shop | 23 | 22 | 0 | 1 | Falta 1 ref |
| restaurant | 20 | 16 | 0 | 4 | Faltan refs: sopa_dia, croquetas_caseras, chuletas_cordero, arroz_con_leche |
| sushi_restaurant | 40 | 39 | 0 | 1 | Falta 1 ref |
| spa | 20 | 1 | 19 | 0 | Solo masaje_relajante en WebP, 19 JPG |
| gym | 21 | 0 | 21 | 0 | Todos JPG, 0 WebP |

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

**Estado:** 274/284 WebP (96%), quedan 10 JPG

### Pendientes (10 JPG sin WebP)

| # | Archivo | Descripcion |
|---|---------|-------------|
| 1 | hielo | Cubitos de hielo |
| 2 | ipa_artesana | Cerveza IPA artesanal |
| 3 | lavanderia | Servicio lavanderia (hotel) |
| 4 | lena | Lena para horno/parrilla |
| 5 | paella_marisco | Paella de marisco |
| 6 | paella_valenciana | Paella valenciana |
| 7 | pale_ale | Cerveza Pale Ale |
| 8 | stout | Cerveza Stout |
| 9 | suite | Suite de hotel |
| 10 | wheat_beer | Cerveza de trigo |

---

## Fase 2 — Personal services: completar beauty_center + spa + gym

### beauty_center (26 JPG → WebP pendientes)

Primeros 9 ya en WebP: limpieza_facial, hidratacion_facial, peeling, microdermoabrasion, radiofrecuencia_facial, vitamina_c, masaje_relajante, masaje_descontracturante, presoterapia

| # | Archivo | Estado |
|---|---------|--------|
| 1 | envolvimiento | JPG |
| 2 | exfoliacion_corporal | JPG |
| 3 | drenaje_linfatico | JPG |
| 4 | depilacion_piernas | JPG |
| 5 | depilacion_ingles | JPG |
| 6 | depilacion_axilas | JPG |
| 7 | depilacion_brazos | JPG |
| 8 | depilacion_labio | JPG |
| 9 | depilacion_laser_sesion | JPG |
| 10 | manicura_basica | JPG |
| 11 | manicura_semipermanente | JPG |
| 12 | pedicura_basica | JPG |
| 13 | pedicura_semipermanente | JPG |
| 14 | unas_gel | JPG |
| 15 | unas_acrilicas | JPG |
| 16 | maquillaje_dia | JPG |
| 17 | maquillaje_noche | JPG |
| 18 | maquillaje_novia | JPG |
| 19 | extension_pestanas | JPG |
| 20 | tinte_cejas | JPG |
| 21 | lifting_pestanas | JPG |
| 22 | crema_hidratante | JPG |
| 23 | serum_facial | JPG |
| 24 | protector_solar | JPG |
| 25 | contorno_ojos | JPG |
| 26 | agua_micelar | JPG |

### spa (19 JPG → WebP pendientes)

Solo masaje_relajante tiene WebP (reutilizado de hair_salon).

| # | Archivo |
|---|---------|
| 1 | circuito_spa |
| 2 | circuito_premium |
| 3 | acceso_piscina |
| 4 | sauna_privada |
| 5 | masaje_piedras |
| 6 | masaje_aromaterapia |
| 7 | masaje_deportivo |
| 8 | masaje_parejas |
| 9 | reflexologia |
| 10 | facial_spa |
| 11 | envolvimiento_chocolate |
| 12 | ritual_oriental |
| 13 | exfoliacion_sal |
| 14 | flotacion |
| 15 | pack_relax |
| 16 | pack_parejas |
| 17 | pack_dia_completo |
| 18 | bono_5_masajes |
| 19 | tarjeta_regalo |

### gym (21 JPG → WebP)

| # | Archivo |
|---|---------|
| 1 | cuota_mensual |
| 2 | cuota_trimestral |
| 3 | cuota_anual |
| 4 | matricula |
| 5 | pase_dia |
| 6 | clase_spinning |
| 7 | clase_yoga |
| 8 | clase_pilates |
| 9 | clase_crossfit |
| 10 | clase_boxeo |
| 11 | clase_zumba |
| 12 | bono_10_clases |
| 13 | sesion_personal |
| 14 | bono_10_personal |
| 15 | plan_nutricional |
| 16 | valoracion_corporal |
| 17 | toalla_alquiler |
| 18 | taquilla_mensual |
| 19 | batido_proteinas |
| 20 | barrita_energetica |
| 21 | agua_gym |

---

## Fase 3 — Retail: bookshop + clothing (JPG → WebP)

- **bookshop**: 23 JPG en `retail/`
- **clothing**: 24 JPG en `retail/`
- **Resto de retail**: 34 JPG mas en `retail/` (compartidos entre tipos)

---

## Fase 4 — Completar refs faltantes en catalogos casi completos

| Catalogo | Productos sin ref | Accion |
|----------|-------------------|--------|
| cafeteria | cafe_bombon, colacao, palmera, tostada_jamon_queso | Reutilizar de hospitality (cafe_bombom, palmera_chocolate, etc.) + generar faltantes |
| restaurant | sopa_dia, croquetas_caseras, chuletas_cordero, arroz_con_leche | Reutilizar croquetas de hospitality + generar resto |
| kebab_shop | 1 producto | Verificar cual y reutilizar/generar |
| sushi_restaurant | 1 producto | Verificar cual y reutilizar/generar |

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

- [ ] Borrar 9 JPGs duplicados en `personal_services/` (ya tienen WebP): hidratacion_facial, limpieza_facial, masaje_descontracturante, masaje_relajante, microdermoabrasion, peeling, presoterapia, radiofrecuencia_facial, vitamina_c
- [ ] Actualizar refs `.jpg` → `.webp` en JSONs de beauty_center, spa, gym, bookshop, clothing
- [ ] Verificar que hospitality JSONs apuntan a `.webp` (no `.jpg`)

---

## Resumen numerico

| Fase | Que | Imagenes pendientes | Estado |
|------|-----|---------------------|--------|
| 1 | Hospitality JPG → WebP | 10 | CASI LISTO |
| 2 | Personal services (beauty+spa+gym) | 66 | EN PROGRESO (beauty 9/35) |
| 3 | Retail (bookshop+clothing) | 47 + 34 retail | PENDIENTE |
| 4 | Refs faltantes (cafe+rest+kebab+sushi) | ~7 | PENDIENTE |
| 5 | Crear catalogos nuevos | 44 tipos | PENDIENTE |
| 6 | Imagenes para catalogos sin img | 22 tipos | PENDIENTE |
