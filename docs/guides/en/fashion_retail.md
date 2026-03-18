# Setup Guide: Fashion Retail

> Configure your Fashion Retail hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a fashion and clothing shop in Antwerp. It's called "Boutique Own Style". We sell women's and men's clothing and accessories. We manage sizes, colours, seasons, and have a loyalty programme. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Boutique Own Style BV", address "24 Meir, 2000 Antwerp", VAT number BE0345678901, phone 03 234 5678, email ownstyle@boutique.be
- VAT: 21% included in prices. Classes: Standard Rate (21%) for clothing and accessories
- Payment methods: cash, card, contactless
- Employees:
  - Beatrice Claes (Sales Assistant, PIN 1234)
  - Elena Wouters (Stock Clerk, PIN 5678)
- Products:
  - Women's basic t-shirt (€19.99), Women's skinny jeans (€49.99), Casual dress (€59.99), Men's t-shirt (€22.99), Men's chino trousers (€44.99), Handbag (€39.99), Leather belt (€25.99), Scarf (€18.99)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with barcode scanning for tagged items |
| customers | Customer database with purchase history and loyalty programme |
| inventory | Size/colour variant management, season collections, stock per SKU |
| invoicing | Issue invoices and simplified receipts |
| sales | Record sales with variant selection and discount management |
| tax | Tax configuration — standard rate for clothing and accessories |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Sales Assistant | sales, cash register, view-only customers |
| Stock Clerk | full inventory management |

---

## Typical use cases

- Manage stock per size and colour with low-stock alerts per SKU
- Apply seasonal bulk discounts (sales) to entire collections
- Manage the loyalty programme with accumulated points or discounts
- Handle returns and exchanges with a clear seasonal policy

---

## Notes

Fashion retail sector — standard VAT for clothing and accessories. Seasonal sales can apply a percentage discount across entire collections. Managing variants (size/colour) is key to avoiding stockouts in the most popular sizes. Returns and exchanges are frequent and must be correctly recorded to adjust inventory.
