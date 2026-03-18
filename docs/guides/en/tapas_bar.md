# Setup Guide: Tapas Bar

> Configure your Tapas Bar hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a tapas bar in Lisbon. It's called "The Alfarama Tapas Bar". We serve traditional small plates, sharing boards, and wines. We have a counter and tables with waiter service. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "The Alfarama Tapas Bar", address "23 Rua do Alecrim, 1200 Lisbon", VAT number PT567890123, phone 21 123 4567, email alfaramatapas@gmail.com
- VAT: 13% included in prices. Classes: Intermediate Rate (13%) for food and drinks in a hospitality venue
- Payment methods: cash, card, contactless
- Employees:
  - Fernando Hidalgo (Bartender, PIN 1234)
  - Rocio Bernal (Waiter, PIN 5678)
- Products:
  - Spinach and chickpea tapas (€2.50), Ham croquettes x2 (€2.80), Calamari rings (€12), Garlic prawns (€14), Pork stew montadito (€2.00), Glass of Rioja (€3.50), Draught beer (€2.00), Dry sherry (€2.50)
- Zones and tables: Bar counter (no table), Indoor dining (8 tables), Terrace (6 tables)

Execute everything without asking further questions.
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
| sales | Tapas, sharing boards, and drinks sales |
| tables | Table map with bar, room, and terrace zones |
| tax | Tax configuration — applicable rate for hospitality |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Bartender | sales, cash register, tables, view-only inventory |
| Waiter | sales, tables, orders |

---

## Typical use cases

- Manage tapas orders per table with kitchen dispatch
- Charge at the counter quickly and at the table at the end of service
- Track stock of sharing dishes and ingredients to avoid running out of popular items
- Manage the terrace with separate table numbering

---

## Notes

Hospitality sector — applicable VAT rate for small plates and drinks in a hospitality venue. Tapas are a high-turnover product — controlling stock of the most used ingredients avoids running out at peak times. In many bars, a small snack is included with drinks, which can be managed as a gift or combined price. The classic pairing of wines and sherries with tapas is characteristic and worth featuring on the menu.
