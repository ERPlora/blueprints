# Setup Guide: Food Delivery

> Configure your Food Delivery hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a ghost kitchen for food delivery in London. It's called "Ghost Kitchen Flavour". We cook and deliver burgers, bowls, and wraps. We only sell by delivery — no dine-in. We manage orders from multiple platforms. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Ghost Kitchen Flavour Ltd", address "Unit 7, Wembley Industrial Estate, London HA9 8DB", VAT number GB567890123, phone 020 5678 9012, email kitchen@ghostkitchenflavour.co.uk
- VAT: 20% included in prices. Classes: Standard Rate (20%) for prepared food delivery
- Payment methods: online payment, card
- Employees:
  - Mohammed Ali (Kitchen Manager, PIN 1234)
  - Sylvia Green (Delivery Driver, PIN 5678)
- Products:
  - Classic burger (€8.50), Double cheese burger (€11.50), Chicken bowl (€9.50), Veggie wrap (€8.00), Fries (€3.00), Burger + fries + drink combo (€13.50), Caesar salad (€7.50)

Execute everything without asking further questions.
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
| tax | Tax configuration — standard rate for delivery food |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Kitchen Manager | kitchen, orders, view-only inventory |
| Delivery Driver | view-only orders, shipping |

---

## Typical use cases

- Centralise orders from multiple platforms (Deliveroo, Uber Eats) on a single screen
- Manage the kitchen queue with preparation times per order
- Assign orders to own delivery drivers with route tracking
- Control ingredient stock with minimum stock alerts

---

## Notes

Hospitality sector — applicable VAT rate for prepared food delivered to customers. Ghost kitchens operate without a dining area, which reduces fixed costs. Multi-channel management (several delivery apps) requires a unified kitchen screen to avoid missing orders. Packaging is a relevant cost to track in inventory.
