# Blueprints — Plan de contenido e imagenes

> Estado: EN PROGRESO
> Ultima actualizacion: 2026-03-11

---

## Objetivo

Generar contenido completo (catalogos de productos JSON + imagenes WebP) para los **25 business types** del Blueprint System.

### Reglas de imagenes

- **Formato:** WebP, 512x512, fondo blanco, quality 85
- **Estilo:** Flat vector icon, bold outlines, flat solid colors, no text, no labels
- **Reutilizacion:** Si un producto existe en otro catalogo con la misma imagen, se reutiliza la misma ref.
- **Generacion:** Solo se generan imagenes nuevas cuando no existe una reutilizable.
- **Herramienta:** ChatGPT Images via Playwright MCP (1 imagen por prompt, ~8-10 por sesion antes de rate limit)
- **Post-proceso:** Descargar PNG → PIL resize 512x512 → WebP q85 → actualizar refs en JSON

### Estructura de assets

```
data/assets/
├── hospitality/      # 284 WebP (food, drinks, desserts)
├── beauty_hair/      # 42 WebP (cuts, color, styling, beard, hair products)
├── beauty_body/      # 35 WebP (facial, body, depilation, nails, makeup)
├── wellness_spa/     # 18 WebP (massages, spa circuits, packs)
├── fitness/          # 20 WebP (memberships, classes, supplements)
└── retail/           # 90 WebP (retail products)
```

---

## Catalogos completados (con imagenes WebP al 100%)

| Catalogo | Productos | Asset folder |
|----------|-----------|--------------|
| bakery | 40 | hospitality |
| bar | 26 | hospitality |
| barber_shop | 20 | beauty_hair |
| beauty_center | 35 | beauty_body |
| cafeteria | 30 | hospitality |
| fast_food | 36 | hospitality |
| food_truck | 29 | hospitality |
| gym | 21 | fitness |
| hair_salon | 37 | beauty_hair |
| ice_cream_shop | 36 | hospitality |
| kebab_shop | 23 | hospitality |
| pizzeria | 37 | hospitality |
| restaurant | 20 | hospitality |
| spa | 20 | wellness_spa |
| sushi_restaurant | 40 | hospitality |

**Total: 15 catalogos, 470 productos con imagenes completas**

---

## Catalogos pendientes (tipos con blueprint pero sin catalogo completo)

| Business type | Sector | Estado |
|--------------|--------|--------|
| butcher_shop | retail | Necesita catalogo + imagenes |
| fruit_shop | retail | Necesita catalogo + imagenes |
| pet_shop | retail | Necesita catalogo + imagenes |
| physiotherapy | personal_services | Necesita catalogo + imagenes |
| pub | hospitality | Necesita catalogo (reutilizar hospitality images) |
| tapas_bar | hospitality | Necesita catalogo (reutilizar hospitality images) |
| tattoo_studio | personal_services | Necesita catalogo + imagenes |
| tobacco_shop | retail | Sin catalogo (productos regulados) |
| vet_clinic | personal_services | Necesita catalogo + imagenes |
| wholesale_distributor | retail | Necesita catalogo + imagenes |

---

## Resumen

| Metrica | Valor |
|---------|-------|
| Business types con catalogo completo | 15/25 |
| Business types pendientes | 10/25 |
| Total imagenes WebP | ~489 |
| Total productos en catalogos | ~470 |
