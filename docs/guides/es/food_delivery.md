# Setup Guide: Food Delivery

> Configure your Food Delivery hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una cocina fantasma de comida a domicilio en Sevilla. Se llama "Ghost Kitchen Sabor". Cocinamos y repartimos hamburguesas, bowls y wraps. Solo vendemos por delivery, no hay comedor. Gestionamos pedidos de varias plataformas. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Ghost Kitchen Sabor", dirección "Polígono Nuevo Carambolo, Nave 7, 41927 Mairena del Aljarafe, Sevilla", CIF B41567890, teléfono 955 456 789, email cocina@ghostkitchensabor.es
- IVA: 10% incluido en precios. Clases: IVA reducido (10%) para comida preparada
- Métodos de pago: pago online, tarjeta
- Empleados:
  - Mohammed El Amin (Kitchen Manager, PIN 1234)
  - Silvia Ortiz (Delivery Driver, PIN 5678)
- Productos:
  - Burger Classic (8,50€)
  - Burger Doble Queso (11,50€)
  - Bowl de pollo (9,50€)
  - Wrap vegetal (8,00€)
  - Patatas fritas (3,00€)
  - Combo burger + patatas + refresco (13,50€)
  - Ensalada César (7,50€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Internal payments and accounting |
| customers | Customer database for order history and loyalty |
| inventory | Ingredient and packaging stock management |
| invoicing | Issue invoices per order or consolidated billing |
| kitchen | Kitchen Display System for order queue management |
| orders | Multi-platform order management and dispatch |
| sales | Record all sales across channels |
| tax | Tax configuration — 10% reducido |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Kitchen Manager | kitchen, orders, view-only inventory |
| Delivery Driver | view-only orders, shipping |

---

## Typical use cases

- Centralizar pedidos de múltiples plataformas (Glovo, Uber Eats) en una sola pantalla
- Gestionar la cola de cocina con tiempos de preparación por pedido
- Asignar pedidos a repartidores propios con seguimiento de ruta
- Controlar el stock de ingredientes con alertas de stock mínimo

---

## Notes

Sector hostelería — IVA al 10% para comida preparada a domicilio. Las cocinas fantasma operan sin sala de clientes, lo que reduce costes fijos. La gestión multicanal (varias apps de delivery) requiere una pantalla de cocina unificada para no perder pedidos. El packaging es un coste relevante a controlar en el inventario.
