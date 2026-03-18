# Setup Guide: Training Center

> Configure your Training Center hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a professional training centre in Brussels. It's called "BrusselsSkills Academy". We deliver vocational training courses, professional certifications, and corporate training programmes. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "BrusselsSkills Academy ASBL", address "34 Rue de la Science, 1040 Brussels", VAT number BE0678901234, phone 02 456 7890, email info@brusselsskills.be
- VAT: exempt for accredited vocational training. 21% for non-accredited courses
- Payment methods: bank transfer, corporate training subsidies, card
- Employees:
  - Patricia Molina (Instructor, PIN 1234)
  - Roberto Camps (Admin, PIN 5678)
- Courses:
  - Customer service skills (60h, €280), Advanced Excel (20h, €150), Accounting technician (120h, €450), Business English B2 (80h, €320), Time management (8h, €95), Corporate training (tailored pricing)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| course_mgmt | Course catalogue with hours, content, and certifications |
| invoicing | Student, company, and training subsidy invoicing |
| schedules | Class timetable and room management |
| staff | Instructor management with subject assignments |
| student_mgmt | Student enrolment, attendance, and certification |
| tax | Tax configuration — exempt accredited, standard non-accredited |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Instructor | view-only courses, view-only students, attendance |
| Admin | full student management, courses, schedules, invoicing |

---

## Typical use cases

- Manage student enrolment on courses with available places control
- Record daily attendance to meet minimum certificate requirements
- Invoice companies for subsidised corporate training with required documentation
- Issue completion certificates at the end of the course with minimum attendance

---

## Notes

Education sector — accredited vocational training with an official certification may be **exempt from VAT** if the centre is recognised by the competent authority. Subsidised corporate training requires prior notification of the training activity and an attendance register. Professional certification programmes are official qualifications issued by the relevant authority. The minimum attendance requirement varies depending on the programme (typically 75–80%).
