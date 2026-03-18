# Setup Guide: Supermarket

> Configure your Supermarket hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a neighbourhood supermarket in Brussels. It's called "Super La Place". We sell fresh food, frozen goods, household products, and drinks. We have a scale, barcode scanner, and a loyalty programme. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Super La Place SPRL", address "56 Rue de la Loi, 1000 Brussels", VAT number BE0567890123, phone 02 345 6789, email superlaplace@gmail.com
- VAT: multiple rates. Fresh fruit/veg 6%, basic food 6%, processed food 12%, household/hygiene 21%
- Payment methods: cash, card, contactless
- Employees:
  - Marie-José Martin (Cashier, PIN 1234)
  - Thomas Garcia (Stock Clerk, PIN 5678)
  - Rose Navarro (Manager, PIN 9012)
- Products:
  - Whole milk 1L (€0.99), Sliced bread (€1.45), Rice 1kg (€1.20), Olive oil 1L (€4.90), Fresh tomatoes (€/kg — €2.20/kg), Washing powder (€5.50), Beer pack of 6 (€4.80), Yoghurt pack of 4 (€1.60)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Multi-register POS with barcode scanner and scale |
| customers | Loyalty programme management |
| inventory | Large catalogue with expiry date tracking and reorder points |
| invoicing | Issue tickets and invoices for businesses |
| sales | High-volume retail sales management |
| tax | Multi-rate tax by product category |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Cashier | sales, cash register |
| Stock Clerk | inventory, view-only purchase orders |
| Manager | sales, inventory, cash register, view reports |

---

## Typical use cases

- Scan products with barcode and charge quickly at the till
- Track expiry dates and carry out FIFO product rotation
- Manage the loyalty points programme with a customer card
- Carry out periodic stock counts with a handheld scanner

---

## Notes

Food retail sector — multiple VAT rates must be correctly assigned per product: reduced rate for fresh produce (fruit, vegetables, bread, milk, eggs), standard rate for processed foods, beverages, and household products. The scale must be officially certified for trade use. Products with an approaching expiry date must be removed before they expire.
