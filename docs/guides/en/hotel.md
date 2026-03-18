# Setup Guide: Hotel

> Configure your Hotel hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a hotel in Dublin. It's called "The Emerald Hotel". We have 40 rooms, a restaurant, a bar, and room service. We manage reservations, check-in/check-out, housekeeping, and billing. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "The Emerald Hotel Ltd", address "12 O'Connell Street, Dublin 1, D01 AB34", VAT number IE4567890T, phone 01 234 5678, email reservations@emeraldhotel.ie
- VAT: 9% included in prices for accommodation. Restaurant 9% included. Classes: Reduced Rate (9%)
- Payment methods: card, bank transfer, OTA (Booking.com, Expedia)
- Employees:
  - Aoife Brennan (Receptionist, PIN 1234)
  - Brigid Walsh (Housekeeper, PIN 5678)
  - Conor Kelly (Manager, PIN 9012)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Reception and restaurant payments |
| customers | Guest database with stay history and preferences |
| inventory | Hotel supplies, bar, restaurant, and amenities stock |
| invoicing | Comprehensive billing with all hotel charges per stay |
| reservations | Room reservation management and occupancy calendar |
| sales | Restaurant, bar, and extra services sales |
| staff | Housekeeping and reception staff management |
| tax | Tax configuration — reduced rate for accommodation and food |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Receptionist | reservations, customers, sales, cash register |
| Housekeeper | view-only reservations, tasks |
| Manager | reservations, customers, sales, view reports, view-only staff |

---

## Typical use cases

- Manage room availability by type and date
- Record check-in with ID copy and room assignment
- Accumulate restaurant, bar, and extra charges to the room bill
- Coordinate the housekeeping plan based on the day's check-outs

---

## Notes

Tourism sector — reduced VAT rate for hotel accommodation and restaurant services. Guest registration with identity document is mandatory. A tourist tax applies in many cities and must be itemised on the invoice. Channel manager integration allows syncing availability with Booking.com, Expedia, and other platforms.
