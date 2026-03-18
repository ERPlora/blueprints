# Setup Guide: Tattoo / Piercing

> Configure your Tattoo / Piercing hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a tattoo studio in London. It's called "Black Needle Tattoo Studio". We do custom tattoos, piercings, and microblading. We work by appointment only with a mandatory deposit. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Black Needle Tattoo Studio Ltd", address "34 Brick Lane, London E1 6RF", VAT number GB890123456, phone 020 8901 2345, email info@blackneedle.co.uk
- VAT: 20% included in prices. Classes: Standard Rate (20%) for tattoo and piercing services
- Payment methods: cash, card, contactless
- Employees:
  - Oscar Reyes (Manager, PIN 1234)
- Services:
  - Tattoo consultation/quote (free), Small tattoo (up to 10cm²) (from €80), Medium tattoo (from €150), Large tattoo (session) (from €200), Ear piercing (€25), Nose piercing (€30), Microblading eyebrows (€180), Appointment deposit (€50, deducted from total price)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Appointment scheduling with session duration and artist |
| cash_register | POS and payment management |
| customers | Client profiles with tattoo history and design portfolio |
| inventory | Needles, inks, and consumable stock |
| invoicing | Issue invoices with design description |
| sales | Service and product sales |
| services | Service catalogue with artist and price |
| tax | Tax configuration — standard rate for tattoo and piercing |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Manage the artist's diary with multi-hour appointments for large tattoos
- Record each client's tattoo history with photos of completed work
- Charge the deposit on booking and the balance on the day of the session
- Manage mandatory informed consent before each session

---

## Notes

Personal services sector — standard VAT rate. Informed consent is **mandatory by law** before tattooing or piercing. Under-18s require signed consent from a legal guardian. Inks and materials must comply with EU regulations on cosmetic substances. The artist's digital portfolio allows clients to view their style before booking.
