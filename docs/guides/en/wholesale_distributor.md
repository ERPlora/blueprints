# Setup Guide: Wholesale Distributor

> Configure your Wholesale Distributor hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a wholesale distribution company in Antwerp. It's called "Benelux Distributor BV". We distribute food and household products to bars, restaurants, and supermarkets. We have our own warehouse and delivery fleet. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Benelux Distributor BV", address "8 Antwerpsesteenweg, 2630 Aartselaar, Antwerp", VAT number BE0890123456, phone 03 456 7890, email orders@beneluxdistributor.be
- VAT: 6% for processed food, 6% for basic food. Not included in prices (B2B)
- Payment methods: direct debit, bank transfer
- Employees:
  - Paco Carbonell (Sales Representative, PIN 1234)
  - Salud Martens (Warehouse Worker, PIN 5678)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | B2B client database with individual price lists |
| inventory | Warehouse stock with minimum reorder levels |
| invoicing | Grouped invoicing and delivery notes management |
| purchase_orders | Supplier purchasing and stock replenishment |
| sales | Order taking and sales management with client tariffs |
| tax | Tax configuration — multiple rates for food distribution |
| warehouse | Warehouse management with location tracking |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Sales Representative | customers, quotes, view-only invoicing, view-only inventory |
| Warehouse Worker | full inventory, warehouse, shipping |

---

## Typical use cases

- Manage individual price lists per client based on purchase volume
- Receive client orders by phone or online portal and prepare delivery notes
- Optimise delivery routes to reduce distribution costs
- Issue weekly or monthly consolidated invoices per client

---

## Notes

Wholesale B2B distribution sector — VAT not included in prices. Wholesale food distributors apply the VAT rates applicable to each product category. B2B clients have differentiated tariffs based on volume, exclusivity, or business type. Consolidated invoices (grouping multiple delivery notes) simplify client management. Early payment discount is common in the sector (e.g. 2% if paid within 10 days).
