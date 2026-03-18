# Setup Guide: Law Firm

> Configure your Law Firm hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a law firm in London. It's called "Saunders & Associates Solicitors". We specialise in employment law, civil litigation, and commercial law. We manage client files, court deadlines, and billing by the hour. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Saunders & Associates Solicitors LLP", address "23 Lincoln's Inn Fields, 3rd Floor, London WC2A 3LJ", VAT number GB901234567, phone 020 7123 4567, email contact@saunderslaw.co.uk
- VAT: 20% not included in fees. Classes: Standard Rate (20%) for legal services
- Payment methods: bank transfer, direct debit
- Employees:
  - Carmen Saunders (Lawyer, PIN 1234)
  - Paul Medina (Partner, PIN 5678)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | Contracts of services and retainer agreements |
| customers | Client database with case assignments |
| doc_templates | Document templates for contracts, powers of attorney, letters |
| invoicing | Hourly and fixed-fee client billing |
| projects | Case management with phases and court deadlines |
| tasks | Task and deadline management per case |
| tax | Tax configuration — standard rate for legal services |
| time_control | Legal timesheet for billable hours per case |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Lawyer | projects, tasks, time tracking, view-only customers, document templates |
| Partner | projects, customers, invoicing, contracts, view reports |

---

## Typical use cases

- Manage case files with court deadlines and expiry alerts
- Record hours worked per file for time-based billing
- Generate legal documents from templates (powers of attorney, contracts, letters)
- Invoice fees with an advance retainer payment

---

## Notes

Professional services sector — standard VAT for legal services. Advance retainer payments are standard practice in law. Deadline management is critical — a missed deadline can result in professional liability. Client documents have special protection under legal professional privilege. The `doc_templates` module allows creating reusable templates for frequently used documents.
