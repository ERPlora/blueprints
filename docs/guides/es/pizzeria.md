# Setup Guide: Pizzeria

> Configure your Pizzeria hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una pizzería en Málaga. Se llama "Pizzería Capri". Hacemos pizzas al horno de leña, pasta fresca y antipasti. Tenemos sala con mesas, barra y también hacemos delivery. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Pizzería Capri", dirección "Calle Larios 14, 29005 Málaga", CIF B29012345, teléfono 952 012 345, email capri@pizzeria.es
- IVA: 10% incluido en precios. Clases: IVA reducido (10%) para restauración
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Marco Ricci (Pizzaiolo, PIN 1234)
  - Julia Santos (Cashier, PIN 5678)
- Productos:
  - Pizza Margherita M (9€)
  - Pizza Margherita L (13€)
  - Pizza 4 Stagioni M (11€)
  - Pizza Diavola M (12€)
  - Pizza mitad-mitad M (13€)
  - Pasta Carbonara (10€)
  - Tiramisu (5€)
  - Agua 1L (2,50€)
- Zonas y mesas: Sala interior (10 mesas), Terraza (6 mesas)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with table billing |
| customers | Customer database for delivery and loyalty |
| inventory | Flour, toppings, and ingredient stock management |
| invoicing | Issue restaurant tickets and invoices |
| kitchen | Pizza oven queue management via KDS |
| orders | Table and delivery order management |
| sales | Table, counter, and delivery sales |
| tables | Table map with indoor and terrace zones |
| tax | Tax configuration — 10% reducido |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Pizzaiolo | kitchen display, view-only orders, view-only inventory |
| Cashier | sales, cash register, orders |

---

## Typical use cases

- Gestionar la pantalla de la pizzería con la cola de pizzas por orden de entrada
- Crear pizzas mitad-mitad con combinación de ingredientes en cada mitad
- Gestionar el delivery con asignación de repartidor y seguimiento
- Controlar el stock de masa de pizza por lote y tiempo de fermentación

---

## Notes

Sector hostelería — IVA al 10% para consumo en restaurante, 10% también para delivery (pizza para llevar). Las pizzas mitad-mitad permiten combinar dos sabores en una pizza — el precio se calcula automáticamente según la media o el precio más alto. El control del lote de masa permite gestionar la fermentación y calidad de la masa. La pantalla de cocina muestra el tipo de pizza, tamaño y mesa/pedido para el pizzero.
