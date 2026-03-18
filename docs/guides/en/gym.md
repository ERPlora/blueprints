# Setup Guide: Gym / Sports Center

> Configure your Gym / Sports Center hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a gym in Dublin. It's called "FitZone Sport Center". We offer a weights room, group fitness classes, and personal training. Members pay monthly fees and can book classes. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "FitZone Sport Center Ltd", address "14 Pearse Street, Dublin 2, D02 YV14", VAT number IE2345678T, phone 01 678 9012, email info@fitzonedublin.ie
- VAT: 23% included in prices. Classes: Standard Rate (23%) for gym services
- Payment methods: direct debit (memberships), card, cash
- Employees:
  - Rodrigo Murphy (Trainer, PIN 1234)
- Services:
  - Basic monthly membership (€29.90/month), Premium monthly membership (€49.90/month), Personal training 1h (€40), Pack of 10 PT sessions (€350), Joining fee (€20), Day pass (€8), Yoga class (€8), Spinning class (€8)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Counter payments for day passes and extras |
| customers | Member database with subscription and access control |
| inventory | Gym retail (supplements, merchandise) stock |
| invoicing | Monthly subscription invoicing and individual sales |
| sales | Retail and one-time service sales |
| services | Class catalogue with schedule and capacity |
| staff | Trainer management with class assignments |
| subscriptions | Recurring membership management and billing |
| tax | Tax configuration — standard rate for fitness services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Trainer | appointments, view-only customers |

---

## Typical use cases

- Manage member fees with automatic monthly direct debit
- Book group classes with capacity control and waiting list
- Control access for active members and suspend access on non-payment
- Sell personal training sessions and packs with usage tracking

---

## Notes

Personal services sector — standard VAT for gym services. Recurring membership fees are managed with the `subscriptions` module, which generates automatic monthly invoices. The `subscriptions` module also manages automatic access suspension in case of non-payment. Class bundles have an expiry date to prevent indefinite accumulation.
