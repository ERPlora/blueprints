# Setup Guide: Sushi Restaurant

> Configure your Sushi Restaurant hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a Japanese sushi restaurant in Amsterdam. It's called "Sakura Sushi Bar". We offer a sushi bar, rolls, sashimi, tempura, and Japanese cuisine. We have a sushi bar, tables, and also do delivery. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Sakura Sushi Bar BV", address "45 Leidseplein, 1017 Amsterdam", VAT number NL890123456B01, phone 020 278 9012, email sakurasushibar@gmail.com
- VAT: 9% included in prices. Classes: Reduced Rate (9%) for restaurant food
- Payment methods: cash, card, contactless
- Employees:
  - Yuki Tanaka (Sushi Chef, PIN 1234)
  - Anna Peters (Waiter, PIN 5678)
- Products:
  - Salmon nigiri x2 (€4.50), California roll x8 (€9.50), Spicy tuna roll x8 (€10.50), Salmon sashimi x5 (€11.00), Prawn tempura x4 (€9.00), Edamame (€4.00), Sake glass (€5.50), Omakase menu (€35)
- Zones and tables: Sushi bar (6 stools), Dining room (8 tables), Terrace (4 tables)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with table billing |
| customers | Customer database for reservations and delivery |
| inventory | Fresh fish, ingredients, and rice stock with expiry tracking |
| invoicing | Issue restaurant tickets and invoices |
| kitchen | Sushi chef display and kitchen order management |
| orders | Table and counter order management |
| reservations | Reservation management for bar seating and tables |
| sales | Table, bar, and delivery sales |
| tables | Table map with bar, room, and terrace |
| tax | Tax configuration — reduced rate |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Sushi Chef | kitchen display, view-only orders, view-only inventory |
| Waiter | sales, tables, orders, view-only reservations |

---

## Typical use cases

- Manage sushi bar orders with the chef's display screen
- Track fresh fish stock with strict expiry dates
- Manage reservations for the sushi bar and dining tables
- Offer delivery with specialist sushi packaging

---

## Notes

Hospitality sector — reduced VAT rate for Japanese restaurant. Temperature and fish freshness control is critical for food safety compliance. Raw fish such as salmon must be previously frozen at -20°C for at least 24 hours (anisakis regulation). The omakase menu (chef's choice) is charged at a fixed price and must be communicated to the customer in advance. The sushi bar provides a unique experience with the chef working in view of the customer.
