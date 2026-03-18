# Setup Guide: Tobacconist

> Configure your Tobacconist hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a tobacconist shop in Vienna. It's called "Tabak & Press Nr. 34". We sell tobacco products, stamps, lottery tickets, and stationery. Tobacco prices are regulated. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Tabak & Press Nr. 34 - Maria Puertolas", address "45 Mariahilfer Strasse, 1060 Vienna", VAT number ATU56789012, phone 01 456 7890, email tabak34vienna@gmail.com
- VAT: 20% included for non-regulated items. Tobacco products have regulated retail prices with excise duty
- Payment methods: cash, card
- Employees:
  - Maria Puertolas (Manager, PIN 1234)
- Products:
  - Marlboro Red (€5.40), Camel Blue (€5.20), Cigars (from €3.50), Rolling tobacco (€3.80), National stamp (€0.90), EU stamp (€1.10), Lighter (€1.50), Ballpoint pen (€0.80)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with regulated price management |
| inventory | Tobacco and non-tobacco product stock |
| invoicing | Issue receipts and invoices |
| sales | Counter sales with regulated price enforcement |
| tax | Tax configuration — tobacco regulated prices |
| tobacco | Price sync for regulated tobacco and tobacco-specific management |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Sell tobacco at the regulated fixed retail prices
- Manage stock of tobacco and stationery products
- Sell stamps and postal services as a service point
- Manage lottery commissions

---

## Notes

Regulated retail sector — tobacconist shops are licensed concessions with exclusive rights to sell tobacco. Tobacco prices are **fixed regulated retail prices** set by the tax authority and published in the official gazette. The `tobacco` module keeps prices automatically up to date. The sale of tobacco to under-18s is prohibited and subject to penalties. Tobacconists typically apply a flat-rate VAT scheme which simplifies tax management.
