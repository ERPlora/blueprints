# Guía de configuración: Fruit & Vegetable Shop

> Configura tu Fruit & Vegetable Shop desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una frutería en Alicante. Se llama "La Frutería del Mercado". Vendemos frutas y verduras frescas por peso y por unidad. Tenemos báscula y trabajamos con precios variables por temporada. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "La Frutería del Mercado", dirección "Mercado Central, Puesto 34, 03002 Alicante", CIF B03567890, teléfono 965 567 890, email fruteriadelmercado@gmail.com
- IVA: 4% incluido en precios para frutas y verduras frescas (IVA superreducido)
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Vicente Soler (Manager, PIN 1234)

- Productos:
  - Naranjas (€/kg — 1,80€/kg)
  - Manzanas Golden (€/kg — 2,20€/kg)
  - Plátanos (€/kg — 1,60€/kg)
  - Tomates (€/kg — 2,50€/kg)
  - Lechuga (€/unidad — 1,20€)
  - Pimientos rojos (€/kg — 2,80€/kg)
  - Patatas (€/kg — 0,90€/kg)
  - Limones (€/kg — 1,50€/kg)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with scale integration for weight-based pricing |
| inventory | Fresh produce stock with daily rotation and shrinkage tracking |
| invoicing | Issue invoices for wholesale clients and restaurants |
| sales | Weight and unit sales at the counter |
| tax | Tax configuration — 4% superreducido for fresh produce |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Vender productos por peso con integración de báscula directa al TPV
- Actualizar precios de productos estacionalmente según mercado
- Gestionar el stock diario con control de mermas y deterioro
- Emitir albaranes a hostelería y restaurantes que compran al por mayor

---

## Notes

Sector retail alimentario — frutas y verduras frescas aplican el **IVA superreducido del 4%**. Los precios varían frecuentemente según temporada y mercado, por lo que la actualización rápida de precios es esencial. La báscula debe estar homologada (verificada por el organismo de metrología). El control de mermas es importante en fruta fresca para calcular el margen real.
