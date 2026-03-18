# Setup Guide: Consulting / Advisory

> Configure your Consulting / Advisory hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a business consulting firm in London. It's called "NextStep Consulting Ltd". We offer strategic consulting, digital transformation, and change management services to mid-size companies. We bill by the hour and by project. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "NextStep Consulting Ltd", address "45 Bishopsgate, 4th Floor, London EC2N 3AQ", VAT number GB789012345, phone 020 7890 1234, email info@nextstepconsulting.co.uk
- VAT: 20% not included in prices. Classes: Standard Rate (20%) for consulting services
- Payment methods: bank transfer, direct debit
- Employees:
  - Patricia Allen (Consultant, PIN 1234)
  - Roger Freeman (Manager, PIN 5678)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | Service contracts and retainer agreements with clients |
| customers | Client CRM with contact history and pipeline |
| invoicing | Issue invoices — hourly, fixed fee, or milestone-based |
| projects | Project management with phases and deliverables |
| tasks | Task tracking per project and consultant |
| tax | Tax configuration — standard rate for consulting services |
| time_control | Timesheet to record hours per project and consultant |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Consultant | projects, tasks, time tracking, view-only customers |
| Manager | projects, customers, invoicing, contracts, view reports |

---

## Typical use cases

- Record hours worked per project and consultant for time-based billing
- Manage monthly retainer contracts with included hours and overages
- Create projects with phases and deliverables with progress tracking
- Generate profitability reports per client and project

---

## Notes

Professional services sector — VAT not included (B2B). Hourly billing requires an accurate timesheet to justify amounts to the client. Retainer contracts are monthly availability agreements with a set number of included hours. Profitability reports help identify low-margin projects or clients with excessive support demands.
