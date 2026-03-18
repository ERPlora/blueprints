# Setup Guide: Physiotherapy

> Configure your Physiotherapy hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a physiotherapy clinic in Dublin. It's called "FisioHealth Dublin". We do orthopaedic, sports, and rehabilitation physiotherapy. We have several physiotherapists and manage session bundles. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "FisioHealth Dublin Ltd", address "34 Baggot Street, Dublin 2, D02 PQ34", VAT number IE6789012T, phone 01 678 9012, email info@fisiohealthdublin.ie
- VAT: exempt from VAT for physiotherapy services. Classes: exempt healthcare services
- Payment methods: cash, card, health insurance (VHI, Laya, Irish Life)
- Employees:
  - Aoife Gaztañaga (Manager, PIN 1234)
- Services:
  - 30min physiotherapy session (€35), 50min physiotherapy session (€50), 10-session bundle 50min (€430), 5-session bundle 50min (€225), Electrotherapy (€25), Dry needling (€40), Initial assessment (€40), Therapeutic massage 30min (€35)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Therapist scheduling with room and equipment assignment |
| cash_register | Patient payments at reception |
| customers | Patient database with evolution history |
| inventory | Physiotherapy materials and consumables stock |
| invoicing | Issue invoices and insurance billing documents |
| sales | Record treatment charges and bundle sales |
| services | Service catalogue with duration and therapist assignment |
| tax | Tax configuration — exempt physiotherapy services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Manage physiotherapist diaries with assigned cabin and equipment
- Track session bundles with sessions-used counter
- Record patient progress per session (pain level, mobility, exercises)
- Bill health insurers with the appropriate service codes

---

## Notes

Healthcare sector — physiotherapy services delivered by registered physiotherapists are **exempt from VAT** (healthcare assistance exemption). Session bundles allow patient retention with advance payment and a discount. Progress notes per session are key to justifying treatment to insurers. The physiotherapist must be registered with the relevant professional regulatory body.
