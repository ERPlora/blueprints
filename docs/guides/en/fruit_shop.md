# Setup Guide: Fruit & Vegetable Shop

> Configure your Fruit & Vegetable Shop hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a fruit and vegetable shop in Lisbon. It's called "The Market Greengrocer". We sell fresh fruit and vegetables by weight and by unit. We have a scale and work with variable seasonal prices. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "The Market Greengrocer", address "Mercado da Ribeira, Stand 34, 1200 Lisbon", VAT number PT234567890, phone 21 567 8901, email greengrocer@market.pt
- VAT: 6% included in prices for fresh fruit and vegetables (reduced rate)
- Payment methods: cash, card, contactless
- Employees:
  - Vicente Soares (Manager, PIN 1234)
- Products:
  - Oranges (€/kg — €1.80/kg), Golden apples (€/kg — €2.20/kg), Bananas (€/kg — €1.60/kg), Tomatoes (€/kg — €2.50/kg), Lettuce (€/unit — €1.20), Red peppers (€/kg — €2.80/kg), Potatoes (€/kg — €0.90/kg), Lemons (€/kg — €1.50/kg)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with scale integration for weight-based pricing |
| inventory | Fresh produce stock with daily rotation and shrinkage tracking |
| invoicing | Issue invoices for wholesale clients and restaurants |
| sales | Weight and unit sales at the counter |
| tax | Tax configuration — reduced rate for fresh produce |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Sell products by weight with direct scale integration at the POS
- Update product prices seasonally based on market conditions
- Manage daily stock with shrinkage and deterioration control
- Issue delivery notes to restaurants and hospitality businesses buying wholesale

---

## Notes

Food retail sector — fresh fruit and vegetables typically apply the **reduced VAT rate**. Prices change frequently based on season and market, so quick price updates are essential. The scale must be officially certified for trade use. Shrinkage tracking is important for fresh produce to calculate the true margin.
