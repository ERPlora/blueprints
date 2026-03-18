# Setup Guide: IT Services

> Configure your IT Services hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have an IT services company in Amsterdam. It's called "BinarySoft Solutions BV". We manage IT for businesses: helpdesk support, maintenance contracts, implementation projects, and custom development. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "BinarySoft Solutions BV", address "123 Keizersgracht, 3rd Floor, 1015 Amsterdam", VAT number NL456789012B01, phone 020 601 2345, email hello@binarysoft.nl
- VAT: 21% not included in prices. Classes: Standard Rate (21%) for IT services
- Payment methods: bank transfer, monthly direct debit
- Employees:
  - Thomas Rivera (Technician, PIN 1234)
  - Elena Vidal (Project Manager, PIN 5678)
  - Marcus Ortiz (Sales Representative, PIN 9012)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | SLA contracts and maintenance agreements |
| customers | Client database with IT infrastructure notes |
| invoicing | Monthly maintenance billing and project invoicing |
| projects | IT project management with phases and deliverables |
| support | Helpdesk ticket management with SLA tracking |
| tasks | Task assignment per technician and project |
| tax | Tax configuration — standard rate for IT services |
| time_control | Timesheet for billable hours per client |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Technician | support tickets, tasks, time tracking |
| Project Manager | projects, tasks, view-only customers, time tracking |
| Sales Representative | quotes, customers, contracts, view-only invoicing |

---

## Typical use cases

- Manage support tickets with SLA, priority, and resolution time
- Track hours worked per client for accurate billing
- Manage implementation projects with phases and deliverables
- Issue monthly maintenance invoices with incident details

---

## Notes

Professional services sector — standard VAT for IT services. SLA contracts define response and resolution times for incidents (e.g. P1: 2h response, 4h resolution). A timesheet is essential to justify hourly billing to clients. Software licences managed for the client should be inventoried to track renewals. Recurring maintenance billing is automated with the `contracts` module.
