# Setup Guide: Accounting Firm

> Configure your Accounting Firm hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have an accounting firm in Dublin. It's called "Harper & Associates Accountants". We provide bookkeeping, tax advisory, and financial consulting to individuals and businesses. We handle client accounts, file tax returns, and prepare financial statements. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Harper & Associates Accountants Ltd", address "14 Grafton Street, Dublin 2, D02 XY12", VAT number IE1234567T, phone 01 234 5678, email info@harperassociates.ie
- VAT: 23% not included in prices. Classes: Standard Rate (23%) for professional services
- Payment methods: bank transfer, direct debit, card
- Employees:
  - Claire Harper (Accountant, PIN 1234)
  - Liam O'Brien (Accountant, PIN 5678)
  - Sinead Doyle (Manager, PIN 9012)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | Manage service contracts and retainer agreements with clients |
| customers | Client database with contact info, VAT number, and multi-client management |
| invoicing | Issue invoices and credit notes to clients |
| projects | Track work per client including deadlines and deliverables |
| tasks | Task management for tax calendar deadlines and to-dos |
| tax | Tax configuration — VAT rates, tax classes, quarterly returns |
| time_control | Timesheet to record hours worked per client for billing |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Accountant | projects, tasks, time tracking, view-only customers, document templates |
| Manager | projects, customers, invoicing, contracts, view reports |

---

## Typical use cases

- Record hours worked per client and invoice monthly based on time spent
- Manage the tax calendar (quarterly VAT, corporate tax, income tax returns)
- Create client invoices based on the terms of the retainer agreement
- Track project and task progress per client

---

## Notes

Professional services sector — VAT not included in price (B2B). Accounting firms typically work with fixed monthly retainer fees per client, billed monthly. The `time_control` module allows recording actual hours to identify clients consuming more resources than expected. The `tax` module is essential for managing the firm's own tax obligations.
