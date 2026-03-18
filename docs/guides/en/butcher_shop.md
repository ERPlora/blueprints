# Setup Guide: Butcher Shop

> Configure your Butcher Shop hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a butcher shop in Edinburgh. It's called "The Highland Butcher". We sell fresh meat, cured meats, and prepared products. We have a scale and carry out mandatory lot traceability. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "The Highland Butcher", address "12 Royal Mile, Edinburgh EH1 1TH", VAT number GB567890123, phone 0131 567 8901, email thehighlandbutcher@gmail.com
- VAT: 0% for fresh meat (Zero Rate). Standard Rate (20%) for prepared meat products
- Payment methods: cash, card, contactless
- Employees:
  - Fergus MacDonald (Manager, PIN 1234)
- Products:
  - Beef fillet (€/kg — €18.00/kg), Pork chops (€/kg — €8.50/kg), Whole chicken (€/kg — €3.90/kg), Leg of lamb (€/kg — €12.00/kg), Fresh chorizo (€/kg — €7.50/kg), Black pudding (€/unit — €3.50), Homemade burger (€/unit — €1.80), Meatballs (€/kg — €9.00/kg)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with scale integration and weight-based pricing |
| inventory | Stock with mandatory lot/batch traceability |
| invoicing | Issue invoices for wholesale clients and restaurants |
| sales | Counter sales with weight pricing and per-unit items |
| tax | Tax configuration — multiple rates for meat products |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Sell products by weight with direct scale integration at the POS
- Record meat batches with animal number and origin for legal traceability
- Manage expiry dates of prepared products
- Issue invoices to hospitality businesses and restaurants buying wholesale

---

## Notes

Food retail sector — lot traceability is **mandatory by law** for butcher shops (EC Regulation 853/2004). Each cut must be traceable to the source animal. Prepared products (burgers, meatballs) also require visible allergen information on labelling. The scale must be officially certified for trade use.
