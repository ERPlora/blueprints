# Setup Guide: Bakery / Pastry Shop

> Configure your Bakery / Pastry Shop hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have an artisan bakery and pastry shop in Lyon. It's called "La Mie Dorée". We make artisan bread, pastries, and custom cakes. We have our own bakehouse and sell in-store. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "La Mie Dorée", address "34 Rue de la République, 69001 Lyon", VAT number FR12345678901, phone 04 72 34 56 78, email contact@lamiedoree.fr
- VAT: included in prices. Classes: Standard Rate (20%) for pastries and cakes, Reduced Rate (5.5%) for basic bread
- Payment methods: cash, card, contactless
- Employees:
  - Antoine Rousseau (Baker, PIN 1234)
- Products:
  - Baguette (€1.20), Country loaf 1kg (€3.50), Butter croissant (€1.80), Pain au chocolat (€2.00), Apple tart whole (€18.00), Homemade sponge cake (€12.00), Anise ring cake (€6.00), Chocolate palmier (€1.50)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS and cash management for counter sales |
| customers | Customer database for orders, loyalty and wholesale clients |
| inventory | Ingredient stock control with expiry date tracking |
| invoicing | Issue invoices for wholesale clients and special orders |
| sales | Record daily retail sales at the counter |
| tax | Multiple tax rates — reduced for basic bread, standard for pastries |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Baker | manufacturing orders, full inventory management |

---

## Typical use cases

- Plan daily bread and pastry production based on sales estimates
- Manage custom cake and pastry orders with delivery dates
- Track ingredient stock and expiry dates
- Manage the daily till with different VAT rates per product

---

## Notes

Food retail sector — multiple VAT rates apply and must be correctly assigned per product. Custom orders (personalised cakes) should be registered in advance to plan production. The inventory module allows tracking ingredient batches and their expiry dates.
