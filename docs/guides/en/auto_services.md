# Setup Guide: Auto Services (MOT, Tires, Wash)

> Configure your Auto Services hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have an automotive services centre in Leeds. It's called "FastLane Auto Services". We do tyre changes, car washes, and quick maintenance services by appointment. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "FastLane Auto Services Ltd", address "112 Kirkstall Road, Leeds LS4 2AQ", VAT number GB345678901, phone 0113 345 6789, email info@fastlaneauto.co.uk
- VAT: 20% included in prices. Classes: Standard Rate (20%) for services and parts
- Payment methods: cash, card, contactless
- Employees:
  - Paul Mitchell (Technician, PIN 1111)
  - Sarah Green (Cashier, PIN 2222)
- Services:
  - Tyre change (€18), Wheel balancing (€12), Exterior wash (€8), Full valet (€18), Oil change (€45), Pre-MOT check (€29), Wiper blades (€15)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Appointment booking for services with vehicle and customer info |
| cash_register | POS cash drawer management and Z reports |
| customers | Customer database linked to vehicle records |
| inventory | Stock for tyres, spare parts, oils, and cleaning products |
| invoicing | Issue invoices and simplified receipts |
| sales | Record sales transactions at the counter |
| tax | Tax configuration — VAT rates for services and parts |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Technician | appointments, tasks, view-only inventory |
| Cashier | sales, cash register, view-only appointments |

---

## Typical use cases

- Manage appointments for tyre changes with customer reminders
- Record vehicle history by registration plate and customer
- Charge for services at the counter with the cash register
- Track tyre stock by size and brand

---

## Notes

Automotive sector — VAT included in prices for end consumers. MOT and inspection services are charged at the official regulated price. It is recommended to record the vehicle registration at each sale to trace the service history. Appointment notifications are sent automatically if the customer's email is configured.
