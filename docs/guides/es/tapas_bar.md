# Setup Guide: Tapas Bar

> Configure your Tapas Bar hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo un bar de tapas en Sevilla. Se llama "El Rincón del Aljarafe". Servimos tapas tradicionales sevillanas, raciones y vinos. Tenemos barra y mesas con servicio de camarero. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "El Rincón del Aljarafe", dirección "Calle San Jacinto 23, 41010 Sevilla", CIF B41123456, teléfono 954 123 456, email rinconaljarafe@gmail.com
- IVA: 10% incluido en precios. Clases: IVA reducido (10%) para tapas y bebidas en hostelería
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Fernando Hidalgo (Bartender, PIN 1234)
  - Rocío Bernal (Waiter, PIN 5678)
- Productos:
  - Tapa de espinacas con garbanzos (2,50€)
  - Tapa de croquetas jamón x2 (2,80€)
  - Ración de puntillitas (12€)
  - Ración de gambas al ajillo (14€)
  - Montadito de pringá (2,00€)
  - Copa de vino Rioja (2,50€)
  - Caña (1,50€)
  - Fino en rama (2,00€)
- Zonas y mesas: Barra (sin mesa), Sala interior (8 mesas), Terraza (6 mesas)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS for bar and table billing |
| customers | Customer database for loyalty |
| inventory | Ingredient and beverage stock control |
| invoicing | Issue tickets and invoices |
| kitchen | Kitchen display for tapas preparation |
| orders | Table and bar order management |
| sales | Tapas, raciones, and drinks sales |
| tables | Table map with bar, room, and terrace zones |
| tax | Tax configuration — 10% reducido |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Bartender | sales, cash register, tables, view-only inventory |
| Waiter | sales, tables, orders |

---

## Typical use cases

- Gestionar las comandas de tapas por mesa con envío a la cocina
- Cobrar en barra con rapidez y en mesa al finalizar la consumición
- Controlar el stock de raciones y materias primas para no quedarse sin tapas populares
- Gestionar la terraza con numeración de mesas diferenciada

---

## Notes

Sector hostelería — IVA al 10% para tapas y bebidas en establecimientos de hostelería. Las tapas son un producto de alta rotación — el control de stock de los ingredientes más usados evita quedarse sin platos en hora punta. En Andalucía la cultura de la tapa es muy arraigada: en muchos bares la tapa va incluida con la bebida, lo que puede gestionarse como regalo o precio conjunto. El fino y el manzanilla son bebidas características del Sur que conviene tener en carta.
