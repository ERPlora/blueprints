# Setup Guide: Veterinary Clinic

> Configure your Veterinary Clinic hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a veterinary clinic in Dublin. It's called "VetNova Clinic". We treat dogs, cats, and small animals. We do consultations, vaccinations, surgeries, and sell veterinary products. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "VetNova Clinic Ltd", address "34 Merrion Road, Dublin 4, D04 KR78", VAT number IE1234567T, phone 01 234 5678, email info@vetnovaclinic.ie
- VAT: 23% included for veterinary services. 0% for veterinary medicines (Zero Rate). 0% for therapeutic pet food
- Payment methods: cash, card, contactless
- Employees:
  - Dr. Anthony Soler (Veterinarian, PIN 1234)
  - Marta Peters (Veterinary Assistant, PIN 5678)
  - Carmen Murphy (Receptionist, PIN 9012)
- Services:
  - General consultation (€35), Rabies vaccine (€25), Combination vaccine (€30), Deworming (€15), Basic blood test (€45), Cat castration (€120), Dental scaling (€85), Microchip ID (€25)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Multi-vet appointment scheduling with consultation room |
| cash_register | Patient payments at reception |
| customers | Owner database with pet profiles |
| inventory | Vaccines, medications, and supplies stock |
| invoicing | Issue invoices with detailed treatment breakdown |
| patient_records | Pet clinical history, vaccinations, and treatment plans |
| sales | Service and product sales at reception |
| tax | Multi-rate configuration — standard services, zero/reduced medications |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Veterinarian | full patient records, appointments, services, customers, view-only inventory, sales |
| Veterinary Assistant | view patient records, appointments, view-only customers and inventory, sales |
| Receptionist | appointments, customers, sales, cash register |

---

## Typical use cases

- Manage each patient's (pet's) clinical history per owner
- Track vaccination calendars with automatic reminders to the owner
- Manage vaccine stock with storage temperature and expiry requirements
- Issue the owner's invoice with a breakdown of consultation, medications, and services

---

## Notes

Veterinary healthcare sector — veterinary services are taxed at the standard VAT rate; veterinary medicines are typically zero-rated or reduced; therapeutic pet foods may be zero-rated with prescription. Microchipping is mandatory for dogs in many EU countries. A controlled substances register is mandatory for prescription-only medications. Prescribing antibiotics requires an official veterinary prescription.
