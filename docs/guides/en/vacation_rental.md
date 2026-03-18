# Setup Guide: Vacation Rental

> Configure your Vacation Rental hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a holiday apartment in Faro, Portugal. It's called "Algarve Sun & Sea Apartment". I rent my flat to tourists by the week and fortnight. I manage bookings via Airbnb, Booking.com, and direct. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Algarve Sun & Sea Apartment", address "23 Avenida do Mar, Apartment 5B, 8000 Faro", VAT number PT678901234, phone 289 345 678, email algarvesunnsea@vacations.pt
- VAT: 6% included for tourist accommodation. 23% for extra services (additional cleaning, parking)
- Payment methods: card, Stripe, bank transfer
- Employees:
  - Consuelo Martins (Property Manager, PIN 1234)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Guest database with stay history |
| invoicing | Issue accommodation invoices and deposit management |
| online_booking | Online booking page with availability calendar |
| reservations | Reservation calendar with channel management |
| tax | Tax configuration — reduced rate accommodation, standard extras |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Property Manager | reservations, customers, invoicing, tasks |

---

## Typical use cases

- Manage the availability calendar synchronised across platforms (Airbnb, Booking.com)
- Coordinate cleaning and preparation between check-outs and check-ins
- Issue invoices for guests who need them for business expenses
- Manage the security deposit and its return at the end of each stay

---

## Notes

Tourism sector — reduced VAT rate for holiday accommodation when the owner provides hotel-like services (regular cleaning, linen changes, etc.). If the rental is purely a lease without services, it may be exempt. A tourist accommodation licence is mandatory in most EU countries. A tourist tax may apply in certain cities and must be collected from guests. Guest registration may be required by local law.
