# Setup Guide: Installer (Plumbing, Electric, HVAC)

> Configure your Installer hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have an installation company in Marseille. It's called "TechClima Installations". We install and maintain air conditioning, plumbing, and electrical systems. We work for private clients and residential buildings on maintenance contracts. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "TechClima Installations SARL", address "8 Zone Industrielle Les Arnavaux, 13014 Marseille", VAT number FR56789012345, phone 04 91 67 89 01, email info@techclima.fr
- VAT: 20% not included in prices. Classes: Standard Rate (20%) for services and installations. Reduced Rate (10%) for qualifying residential renovation work
- Payment methods: bank transfer, direct debit for maintenance contracts
- Employees:
  - Edouard Perez (Installer, PIN 1234)
  - Rachel Navarro (Manager, PIN 5678)
- Services:
  - Air conditioning split unit installation (€350), Annual AC maintenance (€89), Plumbing inspection (€55), Boiler installation (€280), Electrical check (€65), Free quote (€0)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database with installation records |
| inventory | Parts, filters, and supplies stock per van and warehouse |
| invoicing | On-site and office invoicing |
| quotes | Detailed installation quotes with labour and materials |
| staff | Installer assignment and schedule management |
| tasks | Work order management with site details |
| tax | Tax configuration — standard rate for installations |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Installer | tasks, field service, view-only inventory |
| Manager | quotes, customers, invoicing, view-only staff |

---

## Typical use cases

- Create installation quotes with labour and materials breakdown
- Assign work orders to installers with address and job description
- Manage annual maintenance contracts with recurring billing
- Track material stock in each installer's van

---

## Notes

Installations sector — standard VAT for installation services. An installation certificate is mandatory for certain installations (electrical, gas). Preventive maintenance contracts generate stable recurring revenue. Installers must hold a valid trade qualification for the relevant discipline. Van stock allows billing materials directly from the field.
