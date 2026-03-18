# Setup Guide: Barbershop

> Configure your Barbershop hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a barbershop in Manchester. It's called "The Sharp Edge Barbershop". We do haircuts, beard trims, and classic wet shaves. We accept appointments and walk-ins. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "The Sharp Edge Barbershop", address "67 Deansgate, Manchester M3 2BW", VAT number GB456789012, phone 0161 456 7890, email thesharpedge@gmail.com
- VAT: 20% included in prices. Classes: Standard Rate (20%) for personal care services
- Payment methods: cash, card, contactless
- Employees:
  - Jake Morrison (Manager, PIN 1234)
- Services:
  - Haircut (€15), Beard trim (€10), Cut + beard (€22), Classic wet shave (€18), Fade (€12), Moisturising treatment (€8), Eyebrow shaping (€6)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Appointment booking per barber with time slots |
| cash_register | POS and cash management |
| customers | Client profiles with haircut history and preferences |
| inventory | Stock for hair products, blades, and retail items |
| invoicing | Issue tickets and invoices |
| sales | Record service and product sales |
| services | Service catalog with duration and price |
| tax | Tax configuration — standard rate for personal care services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Manage appointment schedules per barber with available time slots
- Handle walk-ins with a waiting queue when no appointment is available
- Record each client's cut preferences for the next visit
- Sell hair care products alongside services

---

## Notes

Personal services sector — standard VAT rate for hairdressing and barbering services. The walk-in queue allows serving clients without appointments who arrive directly. The client profile stores their preferred cut style for each visit.
