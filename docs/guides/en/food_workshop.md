# Setup Guide: Food Workshop / Artisan

> Configure your Food Workshop / Artisan hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have an artisan food production workshop in Bordeaux. It's called "Artisan Preserves Bordeaux". We produce preserves, sauces, and artisan jams for B2B distribution to delicatessen shops and restaurants. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Artisan Preserves Bordeaux SARL", address "Zone Industrielle La Bastide, Hangar 5, 33000 Bordeaux", VAT number FR23456789012, phone 05 56 34 56 78, email production@artisanpreserves.fr
- VAT: 5.5% not included in prices for processed food products. Basic raw materials at reduced rate
- Payment methods: bank transfer, direct debit for regular clients
- Employees:
  - Carmen Rousseau (Production Manager, PIN 1234)
  - Raoul Martin (Delivery Driver, PIN 5678)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| inventory | Raw material and finished product stock with lot traceability |
| invoicing | B2B invoicing with customer-specific pricing |
| manufacturing | Production orders with recipes (BOM) and batch management |
| purchase_orders | Order raw materials from suppliers |
| quality | Quality control and batch inspections |
| tax | Tax configuration — reduced rate for processed foods, basic rate for ingredients |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Production Manager | manufacturing, quality, full inventory |
| Delivery Driver | view-only orders, shipping |

---

## Typical use cases

- Manage production orders with BOM recipes and batch sizes
- Record lot traceability from raw material through to finished product
- Distribute to B2B clients with delivery routes and delivery notes
- Issue consolidated monthly invoices to regular clients

---

## Notes

Artisan food sector — lot traceability is **mandatory** (EC Regulation 178/2002) to enable product recall in the event of a food safety alert. The food business registration number must appear on labelling. Allergens must be declared on the product specification sheet.
