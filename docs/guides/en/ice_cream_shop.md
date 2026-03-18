# Setup Guide: Ice Cream Shop

> Configure your Ice Cream Shop hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have an artisan ice cream shop in Nice. It's called "Le Coin Glacé". We make artisan scoop ice cream, ice cream cakes, and granitas. We sell by scoop, by weight, and in tubs. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Le Coin Glacé", address "34 Promenade des Anglais, 06000 Nice", VAT number FR45678901234, phone 04 93 78 90 12, email lecoingglace@gmail.com
- VAT: 10% included in prices. Classes: Reduced Rate (10%) for ice cream and granitas
- Payment methods: cash, card, contactless
- Products:
  - Single scoop (€1.50), 2-scoop cup (€3.00), 3-scoop cup (€4.00), Lemon granita (€2.50), Horchata granita (€2.50), 500ml tub (€5.50), Ice cream cake 6 portions (€18.00), Ice cream bar (€2.00)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS for quick counter sales |
| customers | Customer database for loyalty and bulk orders |
| inventory | Flavour, ingredient, and packaging stock management |
| invoicing | Issue receipts and invoices for bulk/corporate orders |
| sales | Counter sales with combo and size options |
| tax | Tax configuration — reduced rate for ice cream |

---

## Roles

No defined roles — the ice cream shop typically operates without dedicated role separation.

---

## Typical use cases

- Sell ice cream by scoop with tiered pricing based on number of scoops
- Manage available flavours by season and enable/disable based on stock
- Track ingredient stock for artisan production
- Manage custom ice cream cake orders for events and birthdays

---

## Notes

Hospitality sector — reduced VAT rate for ice cream and granitas served in-venue or to take away. Managing seasonal flavours requires easy product activation/deactivation from the POS. Per-scoop prices must be clearly visible to customers. Custom ice cream cakes are taken with a deposit.
