# Setup Guide: Hostel

> Configure your Hostel hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a hostel in Lisbon. It's called "Riverside Youth Hostel". We have shared dormitory rooms with bunk beds and private rooms. We welcome young travellers and backpackers from all over the world. We manage online and walk-in bookings. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Riverside Youth Hostel Lda", address "12 Rua do Cais de Sodré, 1200 Lisbon", VAT number PT345678901, phone 21 901 2345, email info@riversidehostel.pt
- VAT: 6% included in prices for accommodation. Classes: Reduced Rate (6%) hospitality
- Payment methods: card, cash, online payment
- Employees:
  - Sarah Johnson (Receptionist, PIN 1234)
- Room types:
  - Bed in mixed 8-bed dorm (€18/night), Bed in female 6-bed dorm (€20/night), Private single room (€45/night), Private double room (€65/night)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Reception payments and deposits |
| customers | Guest database with ID verification |
| inventory | Bar, vending, and hostel supplies stock |
| invoicing | Issue accommodation invoices per stay |
| online_booking | Online booking with channel manager connectivity |
| reservations | Reservation management with bed/room availability calendar |
| sales | Bar sales, lockers, and extra services |
| tax | Tax configuration — reduced rate for accommodation |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Receptionist | reservations, customers, sales, cash register |

---

## Typical use cases

- Manage availability of individual beds in shared dormitories
- Record check-in and check-out with identity document copy (mandatory)
- Sell extras at reception: breakfast, towel hire, lockers
- Manage bookings from Booking.com, Hostelworld, and other online channels

---

## Notes

Tourism sector — reduced VAT rate for accommodation services. Guest registration with passport/ID is **mandatory by law** (police notification requirement). A tourist tax may apply in certain cities and must be added to the invoice. Hostels typically have flexible cancellation policies to attract backpackers.
