# Setup Guide: Medical Laboratory

> Configure your Medical Laboratory hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a clinical analysis laboratory in Brussels. It's called "BioMed Health Lab". We carry out blood, urine, microbiology, and PCR tests. We see private patients and referrals from doctors. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "BioMed Health Lab SPRL", address "34 Avenue Louise, 1050 Brussels", VAT number BE0567890123, phone 02 345 6789, email info@biomedlab.be
- VAT: exempt from VAT for clinical analysis services. Medical devices for sale: reduced rate
- Payment methods: cash, card, health insurance (mutualité)
- Employees:
  - Dr. Ignace Blanc (Lab Technician, PIN 1234)
  - Carmen Vega (Receptionist, PIN 5678)
- Services:
  - Basic blood panel (€35), Full blood count (€25), Comprehensive biochemistry (€45), Lipid profile (€20), PSA (€15), Urine culture (€30), PCR Covid/Flu (€40), Stool analysis (€25)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Patient payments at reception |
| customers | Patient database with ID and insurance info |
| inventory | Reagents, consumables, and sample tubes stock |
| invoicing | Issue invoices and insurance billing |
| patient_records | Sample tracking, test requests, and results management |
| sales | Record analysis charges per patient |
| tax | Tax configuration — exempt analysis services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Lab Technician | full patient records, full inventory |
| Receptionist | customers, sales, cash register |

---

## Typical use cases

- Record sample intake with barcode and assigned patient
- Track the status of each test (received, in progress, result available)
- Notify the patient by email/SMS when results are ready
- Invoice health insurers with the applicable service codes

---

## Notes

Healthcare sector — clinical analysis services are **exempt from VAT** (healthcare assistance exemption). Medical devices sold directly (test strips, etc.) are taxed at a reduced rate. Sample and result custody must comply with minimum legal retention periods. Test results are specially protected health data under GDPR. The laboratory must be authorised by the competent health authority.
