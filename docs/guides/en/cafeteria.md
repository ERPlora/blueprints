# Setup Guide: Cafeteria

> Configure your Cafeteria hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a cafeteria in Brussels. It's called "Café de la Place". We serve specialty coffees, fresh juices, pastries, and light food. We have indoor tables and a counter. We also serve takeaway. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Café de la Place", address "45 Grand Place, 1000 Brussels", VAT number BE0123456789, phone 02 234 5678, email cafedelaplace@gmail.com
- VAT: 6% included in prices. Classes: Reduced Rate (6%) for food and drinks consumed on premises and takeaway
- Payment methods: cash, card, contactless
- Employees:
  - Nathalie Dubois (Barista, PIN 1234)
  - Pierre Laurent (Waiter, PIN 5678)
- Products:
  - Espresso (€1.80), Café au lait (€2.20), Cappuccino (€2.80), Fresh orange juice (€3.50), Toast with butter and jam (€2.80), Croissant (€2.00), Sandwich (€5.50), Lunch menu (€12.00)
- Zones and tables: Indoor (8 tables), Terrace (6 tables)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS and cash management, daily closing |
| customers | Customer database for regular clients and loyalty |
| inventory | Stock for coffee beans, milk, ingredients, and packaging |
| invoicing | Issue invoices and tickets |
| kitchen | Kitchen display for food preparation orders |
| orders | Order management per table and takeaway |
| sales | Counter sales and table billing |
| tables | Table map with indoor and terrace zones |
| tax | Tax configuration — reduced rate |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Barista | sales, cash register, view-only inventory |
| Waiter | sales, tables, orders |

---

## Typical use cases

- Prepare counter orders with a display screen for the barista
- Manage terrace and indoor tables with digital order tickets
- Offer a set lunch menu with drink and dessert included
- Record takeaway sales with appropriate packaging

---

## Notes

Hospitality sector — reduced VAT rate applies to both in-venue consumption and takeaway. The set lunch menu can be configured as a composite product. A cafeteria with a kitchen can send food orders to the kitchen display while the barista prepares drinks directly.
