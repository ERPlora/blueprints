# Setup Guide: Pub

> Configure your Pub hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a pub in Dublin. It's called "The Old Anchor Pub". We serve craft beers on tap, cocktails, and bar snacks. We have live music on weekends. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "The Old Anchor Pub Ltd", address "45 Temple Bar, Dublin 2, D02 HW56", VAT number IE8901234T, phone 01 467 8901, email anchor@pubdublin.ie
- VAT: 9% included in prices. Classes: Reduced Rate (9%) for drinks and snacks in a hospitality venue
- Payment methods: cash, card, contactless
- Employees:
  - James Walker (Bartender, PIN 1234)
- Products:
  - Craft beer pint (€5.50), Craft beer half pint (€3.20), Glass of wine (€5.00), Gin & Tonic (€9.00), Mojito (€8.50), Whiskey and Coke (€7.50), Nachos with dip (€6.00), Cheese board (€12.00)
- Zones and tables: Bar counter (no table), Lounge (8 tables), Beer garden (4 tables)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Bar POS with quick-access drink buttons |
| customers | Customer database for loyalty and events |
| inventory | Beer kegs, spirits, and snack stock management |
| invoicing | Issue tickets and invoice for events |
| orders | Table and bar order management |
| sales | Drink and food sales at bar and tables |
| tables | Table map with bar, lounge, and beer garden zones |
| tax | Tax configuration — reduced rate for bar |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Bartender | sales, cash register, tables, view-only inventory |

---

## Typical use cases

- Manage the bar with quick charge per item
- Track beer keg and spirits stock
- Manage live music events with cover charge or minimum spend
- Close the cash register at the end of each night

---

## Notes

Hospitality sector — reduced VAT rate for drinks and snacks in hospitality establishments. Pubs with live music need an entertainment licence and music licensing compliance. Keg stock control allows tracking litres remaining per tap. Cocktails can be created as composite products with a list of ingredients.
