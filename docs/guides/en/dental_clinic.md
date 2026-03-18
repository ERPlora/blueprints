# Setup Guide: Dental Clinic

> Configure your Dental Clinic hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a dental clinic in Amsterdam. It's called "Perfect Smile Dental Clinic". We offer general dentistry, orthodontics, implants, and cosmetic dentistry. We have a digital dental chart, treatment plans, and online appointment booking. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Perfect Smile Dental Clinic BV", address "34 Herengracht, 1017 BN Amsterdam", VAT number NL456789012B01, phone 020 567 8901, email info@perfectsmile.nl
- VAT: exempt from VAT for dental services. Products sold (home whitening kits, etc.): standard rate
- Payment methods: cash, card, internal financing
- Employees:
  - Dr. Anna de Vries (Dentist, PIN 1234)
  - Karel Bakker (Hygienist, PIN 5678)
  - Laura van Dam (Receptionist, PIN 9012)
- Services:
  - Initial consultation (free / €0), Filling (€80), Dental cleaning (€60), Simple extraction (€70), Invisible orthodontics per month (€120), Implant (€800), Whitening (€250), Check-up and X-rays (€50)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Multi-dentist agenda with chair/room assignment |
| cash_register | Patient payment management at reception |
| customers | Patient database with insurance and billing info |
| inventory | Dental materials and consumables stock |
| invoicing | Patient invoicing and insurance billing |
| online_booking | Online appointment booking for patients |
| patient_records | Odontogram, clinical history, and treatment plans |
| sales | Record treatment charges per session |
| tax | Tax configuration — exempt dental services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Dentist | full patient records, appointments, view-only patients |
| Hygienist | appointments, view patient records |
| Receptionist | appointments, customers, sales, cash register |

---

## Typical use cases

- Manage the digital odontogram with the status of each tooth per patient
- Create treatment plans with phases, costs, and signed estimate
- Track treatment history and X-rays per patient
- Manage the schedule of multiple dentists with assigned chairs

---

## Notes

Healthcare sector — dental services are **exempt from VAT** (healthcare assistance exemption). Products sold without fitting (home whiteners, etc.) are taxed at the standard rate. Informed consent is mandatory for each invasive procedure. Treatment plans must be provided in writing with the estimate before starting. Internal financing requires compliance with consumer credit regulations.
