# Setup Guide: Marketing Agency

> Configure your Marketing Agency hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a digital marketing agency in Amsterdam. It's called "Pixel & Brand Agency". We do digital strategy, social media management, advertising campaigns, and design for mid-size brands. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Pixel & Brand Agency BV", address "345 Herengracht, 1016 Amsterdam", VAT number NL567890123B01, phone 020 623 4567, email hello@pixelbrand.nl
- VAT: 21% not included in prices. Classes: Standard Rate (21%) for marketing services
- Payment methods: bank transfer
- Employees:
  - Lucy Vos (Account Manager, PIN 1234)
  - Marc de Boer (Creative, PIN 5678)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database with brand briefs and history |
| invoicing | Monthly retainer and project-based invoicing |
| projects | Creative project management with briefings and deliverables |
| tasks | Task assignment per creative and account manager |
| tax | Tax configuration — standard rate for marketing services |
| time_control | Timesheet for billable hours per client |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Account Manager | projects, customers, tasks, view-only campaigns |
| Creative | view-only projects, tasks, time tracking |

---

## Typical use cases

- Manage creative projects with client briefs, tasks, and deadlines
- Track hours per client to identify true profitability
- Invoice monthly retainers for social media management or recurring campaigns
- Manage freelance collaborators with purchase orders and external invoices

---

## Notes

Professional services sector — standard VAT. Monthly retainers (fixed monthly fee for ongoing services) are the most common billing model in agencies. Tracking hours reveals when a client consumes more resources than included in the retainer. Project briefs must be approved by the client before production starts to avoid unlimited revisions.
