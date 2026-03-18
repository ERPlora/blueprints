# Setup Guide: Massage Therapy

> Configure your Massage Therapy hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a massage therapy centre in Vienna. It's called "Oasis Therapy Center". We offer therapeutic, relaxation, and sports massages. We have online booking and session package deals. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Oasis Therapy Center GmbH", address "45 Mariahilfer Strasse, 1060 Vienna", VAT number ATU34567890, phone 01 890 1234, email bookings@oasistherapy.at
- VAT: 20% included in prices. Classes: Standard Rate (20%) for non-medical massage services
- Payment methods: cash, card, contactless
- Employees:
  - Rosa Klein (Therapist, PIN 1234)
  - Paul Fischer (Receptionist, PIN 5678)
- Services:
  - Relaxation massage 60min (€50), Relaxation massage 90min (€70), Sports massage 60min (€55), Therapeutic massage 60min (€60), Foot massage (€30), 5-session relaxation bundle (€225), Couples massage 60min (€95), Aromatherapy 75min (€65)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Session scheduling per therapist with room assignment |
| cash_register | POS and payment management |
| customers | Client profiles with health records and treatment preferences |
| inventory | Oils, towels, and supplies stock |
| invoicing | Issue invoices and session vouchers |
| online_booking | Online booking via website or link |
| sales | Service and product sales |
| services | Service catalogue with duration and pricing |
| tax | Tax configuration — standard rate for non-medical massage |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Therapist | appointments, view-only customers, view-only sales |
| Receptionist | appointments, customers, sales, cash register |

---

## Typical use cases

- Manage therapist diaries with availability and assigned room
- Sell session bundles with tracking of sessions used
- Collect relevant health information from the client before the first massage
- Offer direct online booking to reduce calls to the centre

---

## Notes

Personal services sector — standard VAT for aesthetic and relaxation massages. Massage with a medical-therapeutic purpose may be exempt if delivered by a registered healthcare professional, but in most massage centres the standard rate applies. The client form should include contraindications and relevant health conditions to adapt the treatment. Session bundles must not expire in less than one year from purchase (EU consumer law).
