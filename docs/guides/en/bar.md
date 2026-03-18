# Setup Guide: Bar

> Configure your Bar hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a bar in Amsterdam. It's called "The Corner Bar". We serve drinks, bar snacks, and light bites, with a counter and tables. We're open from midday until late. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "The Corner Bar", address "8 Leidseplein, 1017 PA Amsterdam", VAT number NL123456789B01, phone 020 123 4567, email thecornerbar@gmail.com
- VAT: 9% included in prices. Classes: Reduced Rate (9%) for food and drinks served in venue
- Payment methods: cash, card, contactless
- Employees:
  - Mike van der Berg (Bartender, PIN 1234)
  - Anna Smit (Waiter, PIN 5678)
- Products:
  - Draft beer (€3.50), Soft drink (€2.50), Water (€1.50), Espresso (€2.00), Cocktail (€8.00), Nachos with dip (€5.50), Toasted sandwich (€5.00), Club sandwich (€7.50)
- Zones and tables: Terrace (8 tables), Indoor (6 tables), Bar counter (no number)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS cash drawer management and daily Z closing |
| customers | Customer database for loyalty and regular clients |
| inventory | Stock control for drinks, ingredients, and bar supplies |
| invoicing | Issue invoices and simplified receipts (tickets) |
| orders | Order management per table and bar counter |
| sales | Record transactions and manage open tabs |
| tables | Table map with zones, status tracking (free/occupied) |
| tax | Tax configuration — reduced rate for food and drinks |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Bartender | sales, cash register, tables, view-only inventory |
| Waiter | sales, tables, orders |

---

## Typical use cases

- Open order tabs per table and add drinks during service
- Close table bills with payment by cash or card
- Manage the bar counter with immediate charge per item
- Track drink stock and place orders with the supplier

---

## Notes

Hospitality sector — reduced VAT rate for drinks and prepared food served in a bar. Counter and table orders are independent. It is recommended to configure the kitchen printer if hot snacks are served, so orders go directly to the kitchen.
