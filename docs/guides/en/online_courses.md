# Setup Guide: Online Courses

> Configure your Online Courses hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have an online learning platform in Amsterdam. It's called "AulaNet Academy". We offer courses in digital marketing, programming, and graphic design online. Students can access via a monthly subscription or by purchasing individual courses. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "AulaNet Academy BV", address "34 Kalverstraat, 1012 Amsterdam", VAT number NL678901234B01, phone 020 012 3456, email hello@aulanetacademy.nl
- VAT: 21% included in prices. Classes: Standard Rate (21%) for non-accredited online training
- Payment methods: card, PayPal, Stripe
- Employees:
  - David Soria (Instructor, PIN 1234)
  - Marina Peters (Admin, PIN 5678)
- Courses/services:
  - Digital Marketing for entrepreneurs (€149), Python for non-programmers (€199), Design with Canva Pro (€79), Monthly subscription (full access) (€29/month), 3-course bundle (€329), Completion certificate (included)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| course_mgmt | Course creation with modules, lessons, and content |
| invoicing | Student and subscription invoicing |
| student_mgmt | Student enrolment, progress tracking, and certifications |
| subscriptions | Recurring subscription plan management |
| tax | Tax configuration — standard rate for non-accredited online training |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Instructor | course management, view-only students |
| Admin | full student management, courses, invoicing, view analytics |

---

## Typical use cases

- Create courses with modules, lessons, and assessment quizzes
- Manage access for subscribed students and track each one's progress
- Issue completion certificates when a course is finished
- Manage monthly subscriptions with automatic recurring billing

---

## Notes

Education sector — standard VAT for non-accredited online training (skills courses without an official qualification). If courses are accredited for employment or hold official certification, they may be VAT-exempt. Subscriptions are managed with the `subscriptions` module with automatic monthly or annual billing. Completion certificates must include the number of hours and content to be valid on a student's CV.
