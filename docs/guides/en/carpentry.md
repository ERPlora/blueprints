# Setup Guide: Carpentry / Workshop

> Configure your Carpentry / Workshop hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a carpentry workshop in Ghent, Belgium. It's called "Artisan Timber Craft". We make bespoke furniture, kitchens, doors, and staircases. We work with custom quotes, material lists, and handle installation. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Artisan Timber Craft BV", address "8 Industriezone Noord, 9000 Ghent", VAT number BE0234567890, phone 09 345 6789, email info@artisantimber.be
- VAT: 21% not included in prices. Classes: Standard Rate (21%) for manufacturing and installation
- Payment methods: bank transfer, 50% deposit + 50% on delivery
- Employees:
  - Thomas Declercq (Master Craftsman, PIN 1234)
  - Emma Verstraete (Sales Representative, PIN 5678)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database for residential and commercial clients |
| inventory | Wood, hardware, and materials stock management |
| invoicing | Issue invoices with advance payment and final billing |
| manufacturing | Production orders with cutting lists and work phases |
| purchase_orders | Order wood, hardware, and supplies from suppliers |
| quotes | Custom quotes with BOM and installation breakdown |
| tax | Tax configuration — standard rate for custom manufacturing |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Master Craftsman | manufacturing, projects, full inventory |
| Sales Representative | quotes, customers, view-only invoicing |

---

## Typical use cases

- Create detailed quotes with material lists (cutting lists) per project
- Manage production orders with work phases (cutting, sanding, finishing, assembly)
- Track timber and hardware stock with automatic replenishment
- Coordinate delivery and installation with the client

---

## Notes

Manufacturing sector — VAT not included in client quotes (B2B and residential). Quotes typically itemise materials and labour separately. The 50% deposit on signing is invoiced as an advance payment. The `manufacturing` module allows generating the exact material cutting list before starting production.
