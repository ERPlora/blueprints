# Setup Guide: Psychology / Coaching

> Configure your Psychology / Coaching hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a psychology practice in Amsterdam. It's called "Balance Psychology Centre". We offer individual, couples, and family therapy. We work in face-to-face consultations and also online via video call. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Balance Psychology Centre BV", address "234 Prinsengracht, Floor 3, 1016 Amsterdam", VAT number NL789012345B01, phone 020 678 9012, email appointment@balancepsychology.nl
- VAT: exempt from VAT for psychology services. Classes: exempt healthcare services
- Payment methods: cash, card, contactless, bank transfer
- Employees:
  - Dr. Marta Soldevila (Psychologist, PIN 1234)
- Services:
  - Initial consultation (€60), Individual therapy session 50min (€70), Couples therapy session 60min (€90), Online session 50min (€65), 10-session individual bundle (€600), 5-session individual bundle (€320), Psychological report (€150)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Therapist scheduling with session type (in-person/online) |
| customers | Patient database with encrypted session notes |
| invoicing | Issue invoices with confidentiality |
| online_booking | Online appointment booking for patients |
| patient_records | Encrypted session notes and progress tracking |
| tax | Tax configuration — exempt psychological services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Psychologist | full patient records, appointments, view-only customers, view-only invoicing |

---

## Typical use cases

- Manage in-person and online session schedules per therapist
- Record session notes with encryption to protect patient confidentiality
- Sell advance session bundles with sessions-used tracking
- Offer direct online booking to reduce friction for new patients

---

## Notes

Healthcare sector — psychology services delivered by registered psychologists are **exempt from VAT** (healthcare assistance exemption). Session notes are particularly sensitive health data under GDPR — they must be encrypted and accessible only to the responsible therapist. Patients typically have the right to free cancellation with 24 hours' notice. The psychologist must be registered with the relevant professional body.
