# Setup Guide: Logistics & Distribution

> Configure your Logistics & Distribution hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a logistics and distribution company in Antwerp. It's called "Scheldt Logistics BV". We do regional distribution with our own fleet, a warehouse, and shipment management for businesses. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Scheldt Logistics BV", address "3 Havenweg, 2030 Antwerp", VAT number BE0456789012, phone 03 789 0123, email operations@scheldtlogistics.be
- VAT: 21% not included in prices. Classes: Standard Rate (21%) for transport and warehousing
- Payment methods: bank transfer, direct debit
- Employees:
  - Victor Lambert (Dispatcher, PIN 1234)
  - Felix Goossens (Delivery Driver, PIN 5678)
  - Carmen Martens (Warehouse Worker, PIN 9012)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database for shippers and consignees |
| fleet | Vehicle fleet management with maintenance and assignment |
| inventory | Warehouse inventory and pallet tracking |
| invoicing | B2B invoicing per shipment or consolidated monthly |
| shipping | Shipment management with tracking and delivery confirmation |
| tax | Tax configuration — standard rate for logistics |
| warehouse | Warehouse location and stock management |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Dispatcher | shipping, view-only fleet, tasks |
| Delivery Driver | view-only shipping, tasks |
| Warehouse Worker | full warehouse, full inventory |

---

## Typical use cases

- Manage shipments with vehicle and driver assignment per route
- Track shipment status with real-time tracking
- Manage the warehouse with locations, inbound and outbound operations
- Invoice clients per shipment volume or flat monthly rate

---

## Notes

Logistics sector — standard VAT for freight transport. Transport companies require a transport authorisation for each vehicle over 3.5t. The CMR (International Consignment Note) is mandatory for cross-border transport. Chain of custody traceability is key for resolving loss or damage incidents. The `fleet` module manages periodic maintenance and MOT for vehicles.
