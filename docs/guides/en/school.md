# Setup Guide: School / Academy

> Configure your School / Academy hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a language academy in Dublin. It's called "Dublin Language Academy". We teach English, French, and German in group and individual classes. We have students of different ages and several teachers. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Dublin Language Academy Ltd", address "23 O'Connell Street, Dublin 1, D01 AB78", VAT number IE9012345T, phone 01 901 2345, email info@dublinlanguages.ie
- VAT: exempt from VAT for accredited language education. 23% for textbooks and digital materials
- Payment methods: monthly direct debit, card, bank transfer
- Employees:
  - Sophie Martin (Teacher, PIN 1234)
  - Carlos Jiménez (Admin, PIN 5678)
- Courses:
  - English A1 (monthly €80), English B2 (monthly €85), English C1 (monthly €90), French A1 (monthly €80), Individual lesson 1h (€35), Annual enrolment fee (€30), Cambridge exam registration (€95)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| attendance | Daily attendance tracking per class and student |
| course_mgmt | Course catalogue with levels, schedules, and content |
| invoicing | Monthly tuition billing and enrolment invoicing |
| schedules | Class timetable management |
| staff | Teacher management with subject assignments |
| student_mgmt | Student enrolment with level assessment and progress |
| tax | Tax configuration — exempt education, standard rate materials |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Teacher | view-only courses, view-only students, attendance, view-only schedules |
| Admin | full student management, courses, schedules, invoicing, attendance |

---

## Typical use cases

- Manage student enrolment with initial level assessment
- Track daily attendance per class and generate reports for students or parents
- Issue monthly fees by direct debit with automatic arrears notification
- Manage class timetables to avoid teacher and room clashes

---

## Notes

Education sector — language courses may be **exempt from VAT** if delivered by a recognised institution. Teaching materials (books) are typically zero-rated for physical books or taxed at the standard rate for digital access. Regular attendance is a condition for sitting official exams (Cambridge, DELF). Monthly direct debit simplifies billing management with large numbers of students.
