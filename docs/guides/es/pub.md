# Setup Guide: Pub

> Configure your Pub hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo un pub en Madrid. Se llama "The Old Anchor Pub". Servimos cervezas artesanales de grifo, cócteles y snacks. Ponemos música en directo los fines de semana. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "The Old Anchor Pub S.L.", dirección "Calle Huertas 45, 28014 Madrid", CIF B28678901, teléfono 914 678 901, email anchor@pubmadrid.es
- IVA: 10% incluido en precios. Clases: IVA reducido (10%) para bebidas y snacks en hostelería
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - James Walker (Bartender, PIN 1234)
- Productos:
  - Cerveza artesanal pinta (4,50€)
  - Cerveza artesanal media pinta (2,80€)
  - Copa de vino (4,00€)
  - Gin Tonic (7,50€)
  - Mojito (7,00€)
  - Whisky with Coke (6,50€)
  - Nachos con salsa (6,00€)
  - Tabla de quesos (12,00€)
- Zonas y mesas: Barra (sin mesa), Sala (8 mesas), Terraza (4 mesas)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Bar POS with quick-access drink buttons |
| customers | Customer database for loyalty and events |
| inventory | Beer kegs, spirits, and snack stock management |
| invoicing | Issue tickets and invoice for events |
| orders | Table and bar order management |
| sales | Drink and food sales at bar and tables |
| tables | Table map with bar, room, and terrace zones |
| tax | Tax configuration — 10% reducido for bar |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Bartender | sales, cash register, tables, view-only inventory |

---

## Typical use cases

- Gestionar la barra con cobro rápido por consumición
- Controlar el stock de barriles de cerveza y botellería
- Gestionar eventos de música en directo con entrada o consumición mínima
- Hacer el cierre de caja al final de cada noche

---

## Notes

Sector hostelería — IVA al 10% para bebidas y snacks en establecimientos de hostelería. Los pubs con música en vivo necesitan licencia de actividad con aforo permitido y derechos de SGAE para la música. El control de stock de barriles (kegs) permite saber cuándo quedan litros disponibles por grifo. Los cócteles se pueden crear como productos compuestos con lista de ingredientes.
