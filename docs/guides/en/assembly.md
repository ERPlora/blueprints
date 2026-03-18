# Setup Guide: Assembly Line

> Configure your Assembly Line hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have an assembly line facility in Birmingham. It's called "Midlands Industrial Assembly Ltd". We assemble electronic components for industrial equipment, with serial number tracking, work orders, and quality control at each production stage. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Midlands Industrial Assembly Ltd", address "Unit 12, Tyseley Industrial Estate, Birmingham B11 2AQ", VAT number GB234567890, phone 0121 234 5678, email production@midlandsassembly.co.uk
- VAT: 20% not included in prices. Classes: Standard Rate (20%), intra-EU operations
- Payment methods: bank transfer, confirming
- Employees:
  - James Holloway (Production Manager, PIN 1234)
  - Dan Patel (Warehouse Worker, PIN 5678)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| inventory | Stock control for components, raw materials, and finished goods |
| invoicing | Issue invoices for assembled products to B2B customers |
| manufacturing | Work orders, BOM management, and production scheduling |
| purchase_orders | Order raw materials and components from suppliers |
| quality | Quality inspections and control at each production stage |
| tax | Tax configuration — VAT rates and intra-EU |
| warehouse | Warehouse location management for inbound/outbound operations |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Production Manager | manufacturing, quality, full inventory management |
| Warehouse Worker | full inventory, warehouse operations |

---

## Typical use cases

- Manage work orders with multi-level bill of materials (BOM)
- Record serial numbers for components and finished products
- Control quality inspections at each stage of assembly
- Plan production based on orders and available stock

---

## Notes

Manufacturing sector — VAT not included (B2B). Serial number tracking is mandatory for warranty management and traceability. Work orders must reference the BOM of each product before starting assembly. The `quality` module allows recording inspections and non-conformities at each stage of the production line.
