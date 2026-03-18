# Setup Guide: Pizzeria

> Configure your Pizzeria hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a pizzeria in Naples. It's called "Pizzeria Capri". We make wood-fired pizzas, fresh pasta, and antipasti. We have a dining room with tables, a counter, and we also do delivery. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Pizzeria Capri", address "14 Via Toledo, 80134 Naples", VAT number IT23456789012, phone 081 012 3456, email capri@pizzeria.it
- VAT: 10% included in prices. Classes: Reduced Rate (10%) for restaurant food
- Payment methods: cash, card, contactless
- Employees:
  - Marco Ricci (Pizzaiolo, PIN 1234)
  - Julia Santos (Cashier, PIN 5678)
- Products:
  - Margherita pizza M (€9), Margherita pizza L (€13), 4 Stagioni pizza M (€11), Diavola pizza M (€12), Half-and-half pizza M (€13), Carbonara pasta (€10), Tiramisu (€5), Water 1L (€2.50)
- Zones and tables: Indoor dining (10 tables), Terrace (6 tables)

Execute everything without asking further questions.
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
| tax | Tax configuration — reduced rate |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Pizzaiolo | kitchen display, view-only orders, view-only inventory |
| Cashier | sales, cash register, orders |

---

## Typical use cases

- Manage the pizzeria screen with the pizza queue in order of arrival
- Create half-and-half pizzas with a combination of toppings on each half
- Manage delivery with driver assignment and tracking
- Track pizza dough batches and fermentation time

---

## Notes

Hospitality sector — reduced VAT rate for restaurant consumption and delivery. Half-and-half pizzas allow combining two flavours in one pizza — the price is automatically calculated as the average or the higher price. Dough batch tracking allows managing fermentation and dough quality. The kitchen screen shows the pizza type, size, and table/order for the pizzaiolo.
