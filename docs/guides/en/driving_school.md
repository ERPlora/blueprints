# Setup Guide: Driving School

> Configure your Driving School hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a driving school in Coventry. It's called "Midlands Driving Academy". We teach theory and practical lessons for car (Category B) and motorcycle (Category A) licences. We manage student schedules, driving tests, and the training vehicle fleet. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Midlands Driving Academy Ltd", address "56 Corporation Street, Coventry CV1 1GF", VAT number GB890123456, phone 024 7890 1234, email info@midlandsdrivingacademy.co.uk
- VAT: exempt from VAT for driving tuition. DVSA test fees outside VAT
- Payment methods: cash, bank transfer, financing
- Employees:
  - Alan Wright (Driving Instructor, PIN 1234)
  - Becky Holmes (Admin, PIN 5678)
- Services:
  - Full Category B licence package (€700), Individual practical lesson (€35), Theory test registration (€95), Practical test booking (€120), Category A (motorcycle) full package (€400)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Practical lesson scheduling per instructor and vehicle |
| fleet | Driving school vehicle fleet with maintenance tracking |
| invoicing | Student invoicing with package and instalment billing |
| schedules | Instructor and classroom scheduling |
| student_mgmt | Student records with exam history and progress tracking |
| tax | Tax configuration — exempt driving education |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Driving Instructor | view schedules, view students, appointments, view-only fleet |
| Admin | full student management, schedules, fleet, invoicing |

---

## Typical use cases

- Manage each student's progress: theory hours, practical hours, test attempts
- Schedule practical lessons per instructor with vehicle assignment
- Track MOT dates and maintenance for training vehicles
- Invoice full licence packages or individual lessons per student choice

---

## Notes

Education sector — driving tuition is **exempt from VAT** when its purpose is obtaining a driving licence. DVSA test fees have no VAT as they are official administrative fees. Tracking the number of practical hours is mandatory before presenting for the test. Instructors must hold a valid Approved Driving Instructor (ADI) qualification.
