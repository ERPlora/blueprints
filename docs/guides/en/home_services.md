# Setup Guide: Home Services

> Configure your Home Services hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a home services company in Dublin. It's called "HomeFix Services". We do plumbing, electrical, and painting work in private homes. Our technicians work in the field with their own vans. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Homeffix Services Ltd", address "23 Victoria Quay, Dublin 8, D08 KX12", VAT number IE3456789T, phone 01 678 9012, email info@homefixservices.ie
- VAT: 23% not included in prices. Classes: Standard Rate (23%) for services and materials. Reduced Rate (13.5%) for qualifying home renovation work
- Payment methods: bank transfer, cash, contactless
- Employees:
  - Anthony Reilly (Technician, PIN 1234)
  - Claire Murphy (Dispatcher, PIN 5678)
- Services:
  - Plumbing inspection (€45), Fault repair (from €60), Electrical installation (from €80), Room painting (from €120), Drain unblocking (€55), Free quote (€0)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Customer database with address and service history |
| invoicing | Issue invoices on site or at office |
| quotes | Create and send quotes with labour and materials breakdown |
| schedules | Field technician scheduling with geographic zones |
| staff | Technician management and assignment |
| tasks | Work order management with status tracking |
| tax | Tax configuration — standard rate for services and materials |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Technician | tasks, field service, view-only inventory |
| Dispatcher | tasks, schedules, customers, quotes |

---

## Typical use cases

- Assign emergency calls to field technicians with available calendar view
- Issue a quote from the technician's phone and convert it to an invoice on payment
- Manage materials stock in each technician's van
- Record the service history at each address

---

## Notes

Services sector — standard VAT for home services. Some home renovation works may qualify for a reduced VAT rate depending on eligibility conditions. A written quote must be provided before starting work. The invoice must separately itemise labour and materials.
