# Setup Guide: Property Management

> Configure your Property Management hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a property management company in Dublin. It's called "Capital Property Management". We manage residential and commercial tenancies. We handle rent collection, maintenance issues, and owner and tenant relations. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Capital Property Management Ltd", address "45 Fitzwilliam Square, Dublin 2, D02 KR56", VAT number IE7890123T, phone 01 456 7890, email info@capitalpropmgmt.ie
- VAT: 23% not included for management fees. Residential leases: exempt. Commercial leases: 23%
- Payment methods: direct debit, bank transfer
- Employees:
  - Susan Morales (Property Manager, PIN 1234)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | Lease contracts and property management agreements |
| customers | Tenant and owner database with property assignments |
| invoicing | Rent invoicing and management fee billing |
| maintenance | Maintenance incident tracking per property |
| property_mgmt | Multi-property portfolio management |
| tax | Tax configuration — standard rate management fees, exempt residential rents |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Property Manager | full property management, reservations, customers, invoicing, maintenance, contracts |

---

## Typical use cases

- Manage monthly rent collection with automatic arrears notifications
- Record and manage maintenance incidents per property
- Issue owner settlement reports with income and expense breakdown
- Manage lease agreements with start, end, and renewal dates

---

## Notes

Real estate sector — management fees are taxed at the standard rate. Residential tenancy rent may be exempt from VAT; commercial property rent is typically standard rated. Lease agreements must comply with applicable tenancy legislation including minimum duration and rent review rules. Tax withholding obligations may apply to certain rental income payments.
