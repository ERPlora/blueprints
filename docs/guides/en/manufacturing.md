# Setup Guide: Manufacturing / Factory

> Configure your Manufacturing / Factory hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a plastics components factory in Lyon. It's called "PlastiTec Industries SA". We manufacture injection-moulded plastic parts for the automotive sector. We have BOM, work orders, quality control, and a warehouse. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "PlastiTec Industries SA", address "Zone Industrielle La Canonja, Bâtiment A, 69100 Lyon", VAT number FR67890123456, phone 04 77 45 67 89, email production@plastictec.fr
- VAT: 20% not included in prices. Classes: Standard Rate (20%), intra-EU operations
- Payment methods: bank transfer, confirming
- Employees:
  - Rafael Torres (Production Manager, PIN 1234)
  - Miriam Costa (Warehouse Worker, PIN 5678)
  - Diego Roca (Sales Representative, PIN 9012)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | B2B client database with pricing contracts |
| inventory | Raw material and finished product stock management |
| invoicing | B2B invoicing and delivery note management |
| manufacturing | Work orders, BOM, MRP planning, and cost tracking |
| purchase_orders | Raw material procurement orders |
| quality | Quality inspections, non-conformities, and certifications |
| tax | Tax configuration — standard rate and intra-EU |
| warehouse | Warehouse management with location tracking |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Production Manager | manufacturing, quality, inventory, view-only purchase orders |
| Warehouse Worker | full inventory, warehouse |
| Sales Representative | quotes, customers, invoicing |

---

## Typical use cases

- Plan production with MRP based on customer orders and minimum stock
- Manage work orders with BOM and tracking of each production phase
- Control quality with inspections at material receipt and finished product
- Manage the finished goods warehouse with locations and lot tracking

---

## Notes

Manufacturing sector — standard VAT for B2B sales. MRP planning calculates material requirements based on sales orders and available stock. Quality control may include ISO 9001 certifications requiring documentation of all non-conformities. Intra-EU sales (to EU companies) are VAT-zero rated with intrastat declaration when thresholds are exceeded.
