# Setup Guide: Restaurant

> Configure your Restaurant hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a restaurant in London called "The Crown". We serve traditional British food, lunch and dinner service, with a bar and outdoor terrace. I also accept reservations. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "The Crown Restaurant Ltd", address "14 High Street, London EC1A 1BB", VAT number GB123456789, phone 020 7123 4567, email info@thecrown.co.uk
- VAT: 20% included in prices. Classes: Standard Rate (20%) for restaurant food and drink
- Payment methods: cash, card, contactless
- Employees:
  - James Smith (Chef, PIN 1234)
  - Sarah Jones (Waiter, PIN 5678)
  - Tom Brown (Cashier, PIN 9012)
- Products:
  - Soup of the day (€6), Prawn cocktail (€8), Beer-battered fish & chips (€16), Grilled lamb chops (€22), Beef burger (€14), Sticky toffee pudding (€7), Still water 1L (€3), House wine glass (€5)
- Zones and tables: Main dining room (12 tables), Bar area (no number), Outdoor terrace (8 tables)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with table billing and payment splitting |
| customers | Customer database for reservations and loyalty |
| inventory | Ingredient and beverage stock management |
| invoicing | Issue restaurant tickets and invoices |
| kitchen | Kitchen Display System (KDS) for chef screen |
| orders | Table order management with multi-course tracking |
| reservations | Table reservation management |
| sales | Table, bar, and takeaway sales |
| tables | Table map with zones and status management |
| tax | Tax configuration — standard rate |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Chef | kitchen display, view-only orders, view-only inventory |
| Waiter | sales, tables, orders, view-only reservations |
| Cashier | sales, cash register, view-only orders |

---

## Typical use cases

- Open table orders with dishes by course (starter, main, dessert)
- Automatically send orders to the kitchen display screen
- Manage table reservations with email confirmation
- Close the table bill with split payment if requested

---

## Notes

Hospitality sector — applicable VAT rate for restaurants. The set menu at a fixed price can be configured as a composite product. Online reservations sync with the table schedule to avoid overbooking. Digital order tickets eliminate reading errors by waiting staff. The `kitchen` module shows orders in real time to the chef with priority by arrival time.
