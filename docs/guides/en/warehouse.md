# Setup Guide: Warehousing & Storage

> Configure your Warehousing & Storage hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a warehouse and distribution centre in Rotterdam. It's called "Delta Storage & Logistics". We provide warehousing, inventory management, and distribution services for e-commerce companies and manufacturers. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Delta Storage & Logistics BV", address "34 Waalhaven, 3087 Rotterdam", VAT number NL901234567B01, phone 010 345 6789, email info@deltastorage.nl
- VAT: 21% not included in prices. Classes: Standard Rate (21%) for warehousing and logistics services
- Payment methods: bank transfer, confirming
- Employees:
  - Emilio Castro (Warehouse Manager, PIN 1234)
  - Jesus Pardo (Warehouse Worker, PIN 5678)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database with storage agreements |
| inventory | Multi-client inventory with location tracking |
| invoicing | Storage and handling fee billing |
| purchase_orders | Supplier and inbound shipment management |
| tax | Tax configuration — standard rate for warehousing |
| warehouse | Location management (aisles, racks, bins) and operations |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Warehouse Manager | full warehouse, full inventory, purchase orders |
| Warehouse Worker | full warehouse, view-only inventory |

---

## Typical use cases

- Manage warehouse locations (aisles, shelves, bins) with stock per location
- Record inbound and outbound movements with delivery notes and documentation
- Track inventory for multiple clients separately in the same warehouse
- Invoice clients for cubic metres stored and per handling operation

---

## Notes

Logistics sector — standard VAT for warehousing and handling services. The warehouse can operate as a dedicated warehouse or as a third-party logistics (3PL) warehouse. Location management optimises space and reduces picking times. Regular stock counts with a handheld barcode scanner are essential for detecting discrepancies. Warehouse insurance must cover the value of clients' stored goods.
