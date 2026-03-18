# Setup Guide: Pet Store

> Configure your Pet Store hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a pet shop in Dublin. It's called "Pet World Dublin". We sell pet food, accessories, and products for animals. We also offer dog grooming services. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Pet World Dublin Ltd", address "78 Henry Street, Dublin 1, D01 XY56", VAT number IE5678901T, phone 01 123 4567, email petworlddublin@gmail.com
- VAT: 0% for pet food (Zero Rate). 23% for accessories and grooming services (Standard Rate)
- Payment methods: cash, card, contactless
- Employees:
  - Sylvia Murphy (Manager, PIN 1234)
- Products:
  - Adult dog food 10kg (€28), Neutered cat food 3kg (€18), Cat litter 8L (€9), Adjustable dog collar (€8), Cat scratching post (€25), Extendable lead (€15), Dental dog treats (€6), Dog grooming small size (€25)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS for counter sales |
| customers | Customer profiles with pet information |
| inventory | Product stock with expiry tracking for food |
| invoicing | Issue invoices and tickets |
| sales | Record product and grooming service sales |
| tax | Tax configuration — zero rate food, standard accessories and services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Manage pet food stock with expiry date tracking and FIFO rotation
- Create pet profiles with breed, weight, and medical condition for grooming
- Manage recurring food subscriptions with periodic delivery for regular clients
- Sell accessories and hygiene products in-store at the POS

---

## Notes

Retail sector — pet food is typically zero-rated or reduced VAT; accessories and grooming services are at the standard rate. The sale of live animals requires registration and animal welfare documentation. Pet food with an approaching expiry date must be managed with FIFO rotation.
