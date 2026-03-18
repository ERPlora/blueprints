# Setup Guide: Car Dealership

> Configure your Car Dealership hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a car dealership in Frankfurt. It's called "Rhine Motors GmbH". We sell new and used vehicles, manage financing, test drives, and after-sales workshop services. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Rhine Motors GmbH", address "78 Mainzer Landstrasse, 60325 Frankfurt am Main", VAT number DE234567890, phone 069 234 5678, email sales@rhinemotors.de
- VAT: 19% not included in prices. Classes: Standard Rate (19%) for new vehicles, special margin scheme for used vehicles
- Payment methods: bank transfer, external financing, cash
- Employees:
  - Robert Schneider (Sales Representative, PIN 1234)
  - Klaus Meyer (Mechanic, PIN 5678)
  - Andrea Fischer (Manager, PIN 9012)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Deposits and payments at the showroom |
| customers | Customer database with purchase history and financing details |
| inventory | Vehicle stock management with VIN, features, and pricing |
| invoicing | Issue vehicle purchase invoices and service invoices |
| quotes | Create and send vehicle quotes with options and financing |
| sales | Record vehicle sales and commission tracking |
| tax | Tax configuration — standard rate for new vehicles, margin scheme for used |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Sales Representative | sales, customers, quotes, view-only inventory |
| Mechanic | maintenance, view-only inventory |
| Manager | sales, customers, invoicing, full inventory, view reports |

---

## Typical use cases

- Manage stock of new and used vehicles with full specifications
- Create vehicle quotes with different financing options
- Record test drives and follow up with potential buyers
- Manage the after-sales workshop with repair orders

---

## Notes

Automotive sector — standard VAT for new vehicles. Used vehicles may use the margin scheme where VAT applies only on the dealer's margin. Vehicle sales require a purchase contract. The manufacturer report (monthly sales reporting to the importer) is generated from sales data.
