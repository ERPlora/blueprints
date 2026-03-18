# Setup Guide: Spa / Massage

> Configure your Spa / Massage hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a spa in Nice. It's called "Aqua Spa Nice". We offer a water circuit, massages, body treatments, and combination packages. We manage online and in-person bookings. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Aqua Spa Nice SAS", address "45 Promenade des Anglais, 06000 Nice", VAT number FR78901234567, phone 04 93 23 45 67, email bookings@aquaspanice.fr
- VAT: 20% included in prices. Classes: Standard Rate (20%) for spa services
- Payment methods: card, cash, contactless
- Employees:
  - Caroline Vega (Manager, PIN 1234)
- Services:
  - Water circuit 2h (€35), Water circuit + massage 60min (€75), Relaxation massage 60min (€55), Hot stone massage (€70), Facial treatment (€60), Body scrub (€50), Full day spa package (€120), Spa gift voucher (from €50)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Circuit and cabin scheduling with capacity control |
| cash_register | Reception payments and gift voucher redemption |
| customers | Client profiles with treatment preferences |
| inventory | Towels, oils, and product stock |
| invoicing | Issue invoices and gift vouchers |
| online_booking | Online reservation for circuits and treatments |
| sales | Service and retail product sales |
| services | Service catalogue with circuits, treatments, and packages |
| tax | Tax configuration — standard rate for spa services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Manage water circuit capacity with time-slot occupancy control
- Sell combination packages (circuit + massage) at a special price
- Sell gift vouchers for birthdays and anniversaries
- Offer online booking with service, therapist, and time selection

---

## Notes

Personal services sector — standard VAT for spa services. The water circuit has limited capacity and must be managed with mandatory booking to avoid overcrowding. Gift vouchers are a high-demand product at Christmas and Valentine's Day. Combination packages (circuit + treatment) are configured at a special price below the sum of individual components to incentivise purchase.
