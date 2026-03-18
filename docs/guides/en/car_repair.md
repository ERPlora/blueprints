# Setup Guide: Car Repair / Garage

> Configure your Car Repair / Garage hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a car repair garage in Bristol. It's called "Gateway Motor Garage". We do car repairs, oil changes, brakes, MOT checks, and carry spare parts in stock. We send MOT reminder notices to customers. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Gateway Motor Garage Ltd", address "34 Stokes Croft, Bristol BS1 3QD", VAT number GB678901234, phone 0117 678 9012, email gatewaygarage@gmail.com
- VAT: 20% included in prices. Classes: Standard Rate (20%) for garage services and parts
- Payment methods: cash, card, bank transfer
- Employees:
  - Steve Gardner (Mechanic, PIN 1234)
  - Helen Briggs (Receptionist, PIN 5678)
- Services:
  - Oil change + filter (€49), Brake check (€35), Electronic diagnostics (€25), Brake pads replacement (€60), Pre-MOT check (€39), Timing belt replacement (€180), Tyre fitting (€20/unit)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS and cash management for counter payments |
| customers | Customer database linked to vehicle records |
| inventory | Parts and supplies stock management |
| invoicing | Issue repair invoices with breakdown of labour and parts |
| maintenance | Repair orders with vehicle history, assigned mechanic, and status |
| sales | Record service and parts sales |
| tax | Tax configuration — standard rate for services and parts |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Mechanic | maintenance orders, view-only inventory, tasks |
| Receptionist | customers, sales, cash register, view-only maintenance |

---

## Typical use cases

- Open repair orders per vehicle with fault description and estimate
- Record the full service history by registration plate
- Send automatic MOT reminders to customers
- Manage the parts warehouse and order from the distributor

---

## Notes

Automotive sector — standard VAT for mechanical services and parts. Repair orders must break down labour and materials separately. A signed estimate must be provided before carrying out repairs. MOT reminders increase customer loyalty.
