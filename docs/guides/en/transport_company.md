# Setup Guide: Transportation Company

> Configure your Transportation Company hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a road haulage company in Antwerp. It's called "Scheldt Transport NV". We carry freight nationally with our own fleet of trucks. We manage the fleet, drivers, and client billing. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Scheldt Transport NV", address "23 Industrieweg, 2030 Antwerp", VAT number BE0789012345, phone 03 678 9012, email info@scheldttransport.be
- VAT: 21% not included in prices. Classes: Standard Rate (21%) for freight transport
- Payment methods: bank transfer, confirming
- Employees:
  - Miguel Sanz (Driver, PIN 1234)
  - Carlos Herrera (Fleet Manager, PIN 5678)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database with rate cards and contracts |
| expenses | Fuel, tolls, and vehicle maintenance cost tracking |
| fleet | Vehicle fleet management with MOT, maintenance, and driver assignment |
| invoicing | Per-trip and consolidated monthly client invoicing |
| tax | Tax configuration — standard rate for freight transport |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Driver | view-only schedules, tasks |
| Fleet Manager | full fleet, schedules, view-only staff |

---

## Typical use cases

- Manage vehicle fleet with MOT dates, service records, and documentation
- Assign drivers to routes with cargo information
- Track fuel and toll costs per vehicle
- Invoice clients per trip or consolidated flat monthly rate

---

## Notes

Transport sector — standard VAT for road freight. Transport companies require a transport operator licence for each vehicle over 3.5t. A digital tachograph is mandatory and records must be retained on board for a set period. Truck drivers need a valid Certificate of Professional Competence (CPC). Carrier liability insurance covers goods in transit.
