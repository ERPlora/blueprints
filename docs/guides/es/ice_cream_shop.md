# Guía de configuración: Ice Cream Shop

> Configura tu Ice Cream Shop desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una heladería artesanal en Valencia. Se llama "Heladería El Rincón Helado". Hacemos helados artesanales de bola, tartas heladas y granizados. Vendemos por bolas, por peso y en tarrina. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Heladería El Rincón Helado", dirección "Calle del Mar 34, 46001 Valencia", CIF B46789012, teléfono 963 789 012, email elrinconhelado@gmail.com
- IVA: 10% incluido en precios. Clases: IVA reducido (10%) para helados y granizados
- Métodos de pago: efectivo, tarjeta, bizum
- Productos:
  - Bola de helado (1,50€)
  - Copa 2 bolas (3,00€)
  - Copa 3 bolas (4,00€)
  - Granizado limón (2,50€)
  - Granizado horchata (2,50€)
  - Tarrina 500ml (5,50€)
  - Tarta helada 6 pax (18,00€)
  - Helado de palo (2,00€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS for quick counter sales |
| customers | Customer database for loyalty and bulk orders |
| inventory | Flavor, ingredient, and packaging stock management |
| invoicing | Issue receipts and invoices for bulk/corporate orders |
| sales | Counter sales with combo and size options |
| tax | Tax configuration — 10% reducido for ice cream |

---

## Roles

No defined roles — the ice cream shop typically operates without dedicated role separation.

---

## Typical use cases

- Vender helados por bolas con precios escalonados según número de bolas
- Gestionar los sabores disponibles por temporada y activar/desactivar según stock
- Controlar el stock de ingredientes para producción artesanal
- Gestionar encargos de tartas heladas para eventos y cumpleaños

---

## Notes

Sector hostelería — IVA al 10% (IVA reducido) para helados y granizados servidos en establecimiento o para llevar. La gestión de sabores estacionales requiere activar/desactivar productos fácilmente desde el TPV. Los precios por bola/peso deben ser claros y visibles para el cliente (obligación regulatoria en hostelería). Las tartas heladas por encargo se cobran con anticipo.
