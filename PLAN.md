# Blueprints — Plan de contenido e imagenes

> Estado: EN PROGRESO
> Ultima actualizacion: 2026-03-11

---

## Objetivo

Generar contenido completo (catalogos de productos JSON + imagenes WebP) para los **57 business types** del Blueprint System.

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
├── hospitality/      # WebP (food, drinks, desserts)
├── beauty_hair/      # WebP (cuts, color, styling, beard, hair products)
├── beauty_body/      # WebP (facial, body, depilation, nails, makeup)
├── wellness_spa/     # WebP (massages, spa circuits, packs)
├── fitness/          # WebP (memberships, classes, supplements)
└── retail/           # WebP (retail products)
```

---

## Catalogos completados (con imagenes WebP al 100%)

| Catalogo (old code) | Nuevo code equivalente | Productos | Asset folder |
|---------------------|----------------------|-----------|--------------|
| bakery | — (eliminado) | 40 | hospitality |
| bar | bar_cafe | 26 | hospitality |
| barber_shop | barbershop | 20 | beauty_hair |
| beauty_center | beauty_salon | 35 | beauty_body |
| cafeteria | bar_cafe | 30 | hospitality |
| fast_food | fast_food | 36 | hospitality |
| food_truck | — (eliminado) | 29 | hospitality |
| gym | fitness_gym | 21 | fitness |
| hair_salon | beauty_salon | 37 | beauty_hair |
| ice_cream_shop | — (eliminado) | 36 | hospitality |
| kebab_shop | — (eliminado) | 23 | hospitality |
| pizzeria | — (eliminado) | 37 | hospitality |
| restaurant | restaurant | 20 | hospitality |
| spa | spa_wellness | 20 | wellness_spa |
| sushi_restaurant | — (eliminado) | 40 | hospitality |

**Imagenes existentes aprovechables para los nuevos tipos**

---

## Catalogos pendientes — nuevos 57 tipos

### 🍽️ Hospitality & Food

| Business type | Estado |
|--------------|--------|
| `hospitality` | Necesita catalogo (reutilizar hospitality images) |
| `restaurant` | Catalogo parcial (20 productos) — ampliar |
| `bar_cafe` | Catalogo parcial (reutilizar bar/cafeteria) |
| `fast_food` | Catalogo existente (36 productos) ✅ |
| `food_delivery` | Necesita catalogo (reutilizar hospitality images) |
| `catering` | Necesita catalogo + imagenes |

### 🛍️ Retail & Commerce

| Business type | Estado |
|--------------|--------|
| `retail` | Necesita catalogo + imagenes |
| `supermarket` | Necesita catalogo + imagenes |
| `fashion_retail` | Necesita catalogo + imagenes |
| `electronics_retail` | Necesita catalogo + imagenes |
| `pharmacy_retail` | Necesita catalogo + imagenes |
| `wholesale` | Necesita catalogo + imagenes |

### 💇 Personal Services & Wellness

| Business type | Estado |
|--------------|--------|
| `beauty_salon` | Catalogo existente (hair_salon + beauty_center) ✅ |
| `barbershop` | Catalogo existente (barber_shop) ✅ |
| `spa_wellness` | Catalogo existente (spa) ✅ |
| `massage_therapy` | Necesita catalogo (reutilizar wellness_spa images) |
| `fitness_gym` | Catalogo existente (gym) ✅ |
| `personal_services` | Necesita catalogo genérico |

### 🏨 Hotels & Tourism

| Business type | Estado |
|--------------|--------|
| `hotel` | Necesita catalogo + imagenes |
| `hostel` | Necesita catalogo + imagenes |
| `vacation_rental` | Necesita catalogo + imagenes |
| `tour_operator` | Necesita catalogo + imagenes |
| `travel_agency` | Necesita catalogo + imagenes |

### 🏥 Healthcare

| Business type | Estado |
|--------------|--------|
| `clinic` | Necesita catalogo + imagenes |
| `dental_clinic` | Necesita catalogo + imagenes |
| `physiotherapy` | Necesita catalogo + imagenes |
| `psychology` | Necesita catalogo + imagenes |
| `medical_lab` | Necesita catalogo + imagenes |

### 🏗️ Construction & Field Services

| Business type | Estado |
|--------------|--------|
| `construction` | Necesita catalogo + imagenes |
| `home_services` | Necesita catalogo + imagenes |
| `maintenance_services` | Necesita catalogo + imagenes |
| `contractors` | Necesita catalogo + imagenes |
| `field_service` | Necesita catalogo + imagenes |

### 🏭 Manufacturing & Industry

| Business type | Estado |
|--------------|--------|
| `manufacturing` | Necesita catalogo + imagenes |
| `factory` | Necesita catalogo + imagenes |
| `industrial_production` | Necesita catalogo + imagenes |
| `assembly` | Necesita catalogo + imagenes |

### 🚚 Logistics & Transportation

| Business type | Estado |
|--------------|--------|
| `logistics` | Necesita catalogo + imagenes |
| `transportation` | Necesita catalogo + imagenes |
| `delivery_services` | Necesita catalogo + imagenes |
| `warehousing` | Necesita catalogo + imagenes |

### 🏢 Professional Services

| Business type | Estado |
|--------------|--------|
| `consulting` | Necesita catalogo + imagenes |
| `accounting_firm` | Necesita catalogo + imagenes |
| `legal_services` | Necesita catalogo + imagenes |
| `marketing_agency` | Necesita catalogo + imagenes |
| `it_services` | Necesita catalogo + imagenes |

### 🎓 Education

| Business type | Estado |
|--------------|--------|
| `education` | Necesita catalogo + imagenes |
| `school` | Necesita catalogo + imagenes |
| `training_center` | Necesita catalogo + imagenes |
| `online_courses` | Necesita catalogo + imagenes |

### 🏡 Real Estate

| Business type | Estado |
|--------------|--------|
| `real_estate` | Necesita catalogo + imagenes |
| `property_management` | Necesita catalogo + imagenes |
| `real_estate_agency` | Necesita catalogo + imagenes |

### 🚗 Automotive

| Business type | Estado |
|--------------|--------|
| `car_repair` | Necesita catalogo + imagenes |
| `car_dealership` | Necesita catalogo + imagenes |
| `car_rental` | Necesita catalogo + imagenes |
| `auto_services` | Necesita catalogo + imagenes |

---

## Resumen

| Metrica | Valor |
|---------|-------|
| Total business types | 57 |
| Con catalogo reutilizable | ~5 |
| Pendientes de crear | ~52 |
| Total imagenes WebP existentes | ~489 |
