# Setup Guide: Delivery Services

> Configure your Delivery Services hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a last-mile courier and delivery company in Rotterdam. It's called "Sprint Couriers BV". We deliver parcels for online shops and businesses, with real-time tracking and proof of delivery. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Sprint Couriers BV", address "45 Rijnhaven, 3071 Rotterdam", VAT number NL345678901B01, phone 010 567 8901, email operations@sprintcouriers.nl
- VAT: 21% not included in prices. Classes: Standard Rate (21%) for transport services
- Payment methods: bank transfer, monthly direct debit for regular clients
- Employees:
  - Jordi Peters (Courier, PIN 1234)
  - Sandra van Dijk (Dispatcher, PIN 5678)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database for online shops and business clients |
| invoicing | Monthly or per-shipment invoicing to clients |
| orders | Shipment order management with tracking and status |
| shipping | Route and delivery management with proof of delivery |
| tax | Tax configuration — standard rate for transport services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Courier | view-only shipping, view-only orders, tasks |
| Dispatcher | full shipping, orders, view-only customers |

---

## Typical use cases

- Assign daily deliveries to couriers with optimised routes
- Record recipient signature or photo as proof of delivery
- Manage returns and undelivered parcels with reason codes
- Invoice clients monthly with a consolidated list of shipments

---

## Notes

Logistics sector — standard VAT for courier and transport services. Proof of delivery (signature or photo) is essential for resolving disputes with clients. Returns must be recorded with a reason (absent, wrong address, refused) to inform the client. Monthly consolidated invoicing simplifies management with high-volume clients.
