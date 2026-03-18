# Setup Guide: Tour Operator

> Configure your Tour Operator hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have an active tourism company in Innsbruck. It's called "Alpine Adventures Tours". We organise hikes, cycling tours, via ferrata, and adventure activities. We manage group and individual bookings with our own guides. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Alpine Adventures Tours GmbH", address "56 Herzog-Friedrich-Strasse, 6020 Innsbruck", VAT number ATU67890123, phone 0512 012 345, email bookings@alpineadventures.at
- VAT: 10% included in prices. Classes: Reduced Rate (10%) for tourist and leisure activities
- Payment methods: card, bank transfer, online payment
- Employees:
  - Albert Jennings (Sales Representative, PIN 1234)
  - Laura Fischer (Tour Guide, PIN 5678)
- Activities:
  - Full-day mountain hike (€35/person), Mountain biking tour (€45/person), Beginner climbing (€40/person), Guided city walk (€25/person), Private 4WD tour (€120/group), Nature photography walk (€38/person), Alpine lake kayaking (€42/person)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | On-site payments and deposits |
| customers | Client database with group booking history |
| inventory | Equipment and material inventory (bikes, harnesses, etc.) |
| invoicing | Issue vouchers, invoices, and group billing |
| online_booking | Online booking with activity calendar |
| reservations | Group and individual reservation management |
| sales | Activity booking sales |
| tax | Tax configuration — reduced rate for tourist activities |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Sales Representative | quotes, customers, reservations, view-only invoicing |
| Tour Guide | view-only reservations, view-only customers, tasks |

---

## Typical use cases

- Manage activity bookings with an availability calendar per activity
- Control maximum capacity per activity to avoid overbooking
- Assign guides to each excursion with group information
- Manage adventure equipment (bikes, harnesses) with status per item

---

## Notes

Tourism sector — reduced VAT rate for tourist activities and leisure services. Active tourism companies must be registered with the relevant regional tourism register. Nature guides must hold an official qualification. Public liability insurance is mandatory to cover accidents during activities. Cancellation due to weather conditions must be covered by the booking policy.
