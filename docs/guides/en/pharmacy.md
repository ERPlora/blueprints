# Setup Guide: Pharmacy / Parapharmacy

> Configure your Pharmacy / Parapharmacy hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a pharmacy in Vienna. It's called "Central Pharmacy". We dispense prescription and over-the-counter medicines, and stock parapharmacy, orthopaedic products, and cosmetics. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Central Pharmacy GmbH", address "8 Stephansplatz, 1010 Vienna", VAT number ATU45678901, phone 01 678 9012, email centralpharmacy@gmail.com
- VAT: 10% for prescription medicines (reduced rate). 10% for medical devices and parapharmacy. 20% for cosmetics and perfumery
- Payment methods: cash, card, health insurance (Krankenkasse)
- Employees:
  - Dr. Maria Huber (Pharmacist, PIN 1234)
  - Jakob Müller (Sales Assistant, PIN 5678)
- Products:
  - Ibuprofen 600mg (box) (€3.50), Paracetamol 1g (box) (€2.80), Vitamin C 1g (€10.50), Body moisturiser (€12.00), SPF50 sun cream (€18.00), Digital thermometer (€8.50), FFP2 mask (€1.20), Hand sanitiser gel 500ml (€5.00)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with barcode scanning for medication dispensing |
| customers | Patient database with purchase history and loyalty |
| inventory | Stock with batch/lot tracking and expiry date control |
| invoicing | Issue invoices and receipts |
| sales | Dispensing and product sales at the counter |
| tax | Tax configuration — multiple rates |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Pharmacist | sales, cash register, inventory, customers |
| Sales Assistant | sales, cash register |

---

## Typical use cases

- Manage medication stock with batch and expiry date tracking
- Dispense prescription medications recording the prescription number
- Control minimum stock alerts to place orders with wholesalers
- Manage the loyalty programme with points per purchase

---

## Notes

Pharmacy sector — multiple VAT rates apply and must be correctly assigned per product category. Pharmacies must be managed by a registered pharmacist. Dispensing of controlled medications requires additional record-keeping. Batch tracking allows rapid withdrawal of products affected by safety alerts.
