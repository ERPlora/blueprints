# Setup Guide: Vacation Rental Management

> Configure your Vacation Rental Management hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a holiday apartment management company in Lisbon. It's called "Atlantic Vacation Management". We manage 30 apartments owned by private landlords in Lisbon and the Algarve. We handle bookings, cleaning, maintenance, and owner settlements. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Atlantic Vacation Management Lda", address "56 Avenida da Liberdade, 1250 Lisbon", VAT number PT789012345, phone 21 345 6789, email info@atlanticvacation.pt
- VAT: 23% not included for management commissions. Tourist accommodation charged to guests at 6%
- Payment methods: card, bank transfer
- Employees:
  - Alvaro Moreno (Property Manager, PIN 1234)
  - Rocio Campos (Cleaner, PIN 5678)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Guest and property owner database |
| invoicing | Guest invoices and owner payout reports |
| online_booking | Multi-property online booking with channel manager |
| property_mgmt | Multi-property portfolio management for owners |
| reservations | Centralised reservation management across all properties |
| tax | Tax configuration — standard rate management fees, reduced accommodation |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Property Manager | full property management, reservations, customers, invoicing |
| Cleaner | tasks, view-only reservations |

---

## Typical use cases

- Manage the calendar of all apartments from a single dashboard
- Coordinate cleaning shifts based on the day's check-outs
- Issue monthly settlement reports to each owner with income, expenses, and commission
- Manage maintenance incidents at each property with status tracking

---

## Notes

Real estate/tourism sector — the management company charges a commission to the owner (typically 15–25% of revenue), which is taxed at the standard VAT rate. Accommodation charged to the guest is at the reduced tourist accommodation rate. The `property_mgmt` module allows managing multiple properties from different owners with independent settlements. Any tourist tax collected from guests must be remitted to the relevant local authority.
