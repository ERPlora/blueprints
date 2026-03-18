# Setup Guide: Fast Food

> Configure your Fast Food hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a fast food restaurant in Brussels. It's called "BurgerStop Brussels". We make burgers, fries, hot dogs, and combos. We have a counter, kitchen display screen, and takeaway orders. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "BurgerStop Brussels SRL", address "10 Boulevard Anspach, 1000 Brussels", VAT number BE0456789012, phone 02 123 4567, email burgerstopbrussels@gmail.com
- VAT: 12% included in prices. Classes: Standard hospitality rate (12%) for prepared food in a restaurant
- Payment methods: cash, card, contactless
- Employees:
  - Marc Dubois (Cashier, PIN 1234)
  - Nadia Benmira (Prep Cook, PIN 5678)
- Products:
  - Classic burger (€6.50), Double burger (€9.50), Hot dog (€4.50), Medium fries (€2.50), Medium soft drink (€2.00), Classic combo (€10.50), Double combo (€13.50), Nuggets x6 (€4.00)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Counter POS with order number display |
| customers | Customer database for loyalty programme |
| inventory | Ingredient and packaging stock management |
| invoicing | Issue simplified receipts and invoices |
| kitchen | Kitchen Display System (KDS) for prep screen |
| orders | Order management with number assignment and status |
| sales | Counter and delivery sales recording |
| tax | Tax configuration — hospitality rate |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Cashier | sales, cash register, orders |
| Prep Cook | kitchen display, view-only orders |

---

## Typical use cases

- Accept counter orders with number assignment for customers
- Display orders on the kitchen screen for preparation
- Manage takeaway and delivery orders with external integration
- Configure combos with automatic discount versus individual products

---

## Notes

Hospitality sector — applicable VAT rate for prepared food in a restaurant setting. Combos are configured as composite products with a special price. The kitchen display (KDS) allows the cook to see orders in the queue and mark them as complete. Delivery orders can integrate with platforms such as Deliveroo or Uber Eats depending on module availability.
