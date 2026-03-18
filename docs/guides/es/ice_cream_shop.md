# Setup Guide: Ice Cream Shop

> Configure your Ice Cream Shop hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una heladería artesanal en Valencia. Se llama "Heladería El Rincón Helado". Hacemos helados artesanales de bola, tartas heladas y granizados. Vendemos por bolas, por peso y en tarrina. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

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
