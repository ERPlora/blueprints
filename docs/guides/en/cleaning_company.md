# Setup Guide: Cleaning Company

> Configure your Cleaning Company hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a cleaning company in Rotterdam. It's called "CleanPro Services". We clean offices, residential blocks, and commercial premises on periodic contracts. We have cleaning teams with assigned routes. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "CleanPro Services BV", address "45 Coolsingel, 3012 AD Rotterdam", VAT number NL234567890B01, phone 010 234 5678, email info@cleanproservices.nl
- VAT: 21% not included in prices. Classes: Standard Rate (21%) for cleaning services
- Payment methods: direct debit, bank transfer
- Employees:
  - Isabel Martens (Team Leader, PIN 1234)
  - Peter de Jong (Manager, PIN 5678)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | Recurring service contracts with billing period and scope |
| customers | Client database for offices, residential blocks, and commercial clients |
| invoicing | Monthly recurring invoicing per contract |
| schedules | Team scheduling with route assignments and shift management |
| staff | Staff management with availability and assignments |
| tax | Tax configuration — standard rate for cleaning services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Team Leader | tasks, view-only schedules, field service |
| Manager | contracts, customers, invoicing, view-only staff, full schedules |

---

## Typical use cases

- Manage recurring cleaning contracts with automatic monthly billing
- Assign team routes by area and client with weekly schedule
- Record cleaning materials consumed at each client
- Monitor service quality with post-service checklists

---

## Notes

Services sector — standard VAT for cleaning services. Recurring contracts allow automatic monthly billing without creating each invoice manually. Post-service checklists guarantee service quality and serve as evidence in case of complaints. The `schedules` module allows optimising team routes to minimise travel time.
