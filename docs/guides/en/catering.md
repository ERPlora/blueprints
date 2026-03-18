# Setup Guide: Catering

> Configure your Catering hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a catering company in Paris. It's called "Gourmet Events Catering". We organise banquets, weddings, corporate events, and cocktail receptions. We have our own kitchen and service staff. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Gourmet Events Catering SAS", address "234 Avenue des Champs-Élysées, 75008 Paris", VAT number FR12345678901, phone 01 45 67 89 01, email info@gourmetevents.fr
- VAT: 10% included in prices for catering. Classes: Reduced Rate (10%) for food and beverage service
- Payment methods: bank transfer, 30% deposit + 70% before the event
- Employees:
  - David Moreau (Event Coordinator, PIN 1234)
  - Sophie Lefebvre (Chef, PIN 5678)
  - Albert Martin (Sales Representative, PIN 9012)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Payments and deposits at the office |
| customers | Client database for corporate and private event clients |
| inventory | Ingredient, equipment, and supplies management per event |
| invoicing | Issue proforma invoices, advance billing, and final event invoices |
| orders | Order management for each event with menus and quantities |
| sales | Record event sales and extras |
| tax | Tax configuration — reduced rate for catering services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Event Coordinator | projects, tasks, customers, orders |
| Chef | kitchen, orders, view-only inventory |
| Sales Representative | quotes, customers, view-only invoicing |

---

## Typical use cases

- Create event quotes with menu, number of guests, and service extras
- Plan kitchen production for each event with recipe BOMs
- Manage temporary staff per event (servers, cooks)
- Invoice advance payments and final balance for each event

---

## Notes

Hospitality sector — reduced VAT rate for catering and food service. The event is the main unit of work. Each event has its own quote, kitchen production, and billing. The 30% deposit on signing and the remainder before the event is standard practice. Quotes typically break down: menu, drinks, staff, equipment rental, and transport.
