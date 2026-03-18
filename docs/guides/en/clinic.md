# Setup Guide: Clinic / Medical Center

> Configure your Clinic / Medical Center hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a private medical clinic in Vienna. It's called "Vienna Health Clinic". We offer general medicine, gynaecology, and orthopaedics consultations. We have electronic patient records, appointment management, and patient billing. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Vienna Health Clinic GmbH", address "22 Währinger Strasse, 1090 Vienna", VAT number ATU12345678, phone 01 456 7890, email info@viennahealthclinic.at
- VAT: exempt from VAT for medical services. Medical supplies for sale: reduced rate depending on product
- Payment methods: cash, card, health insurance (private)
- Employees:
  - Dr. Josef Huber (Doctor, PIN 1234)
  - Maria Weiss (Receptionist, PIN 5678)
  - Anna Klein (Nurse, PIN 9012)
- Services:
  - General medicine consultation (€50), Gynaecology consultation (€65), Orthopaedics consultation (€60), ECG (€35), Basic blood test (€45), Abdominal ultrasound (€55), Full medical check-up (€120)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Multi-doctor appointment scheduling with specialty and room |
| cash_register | Patient payments at reception |
| customers | Patient database with contact and insurance info |
| inventory | Medical supplies and consumables stock |
| invoicing | Issue invoices and insurance billing documents |
| online_booking | Online appointment booking for patients |
| patient_records | Electronic health records (EHR) with clinical history |
| sales | Record medical service charges |
| tax | Tax configuration — exempt medical services, reduced for supplies |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Doctor | full patient records, appointments, view-only patients |
| Receptionist | appointments, customers, sales, cash register |
| Nurse | view patient records, appointments, view-only inventory |

---

## Typical use cases

- Manage appointment schedules per doctor and specialty with automatic confirmation
- Record patient clinical history with progress notes per visit
- Bill private health insurers with the correct service codes
- Manage medical supply and consumables stock

---

## Notes

Healthcare sector — medical services are **exempt from VAT** (healthcare assistance exemption). Medical products sold over the counter (bandages, orthopaedic materials) may be taxed at a reduced rate. Electronic health records must comply with data protection regulations. Patient record access is restricted by role.
