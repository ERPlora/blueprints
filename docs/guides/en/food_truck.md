# Setup Guide: Food Truck

> Configure your Food Truck hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a food truck in Edinburgh. It's called "Road to Flavour Food Truck". We sell gourmet sandwiches, street snacks, and soft drinks at markets, events, and rotating locations. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Road to Flavour Food Truck", address "45 Grassmarket, Edinburgh EH1 2HS", VAT number GB678901234, phone 0131 234 5678, email roadtoflavour@foodtruck.co.uk
- VAT: 20% included in prices. Classes: Standard Rate (20%) for prepared food and drinks
- Payment methods: cash, card (portable card reader), contactless
- Products:
  - Pulled pork bap (€6.50), Crispy chicken sandwich (€5.50), Croquettes x3 (€3.50), Soft drink can (€2.00), Water (€1.50), Craft beer (€3.50), Loaded fries (€4.50), Sandwich + drink combo (€7.50)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Mobile POS with card reader and cash management |
| inventory | Stock loaded per service day — ingredient management |
| invoicing | Issue simplified receipts on the go |
| sales | Quick sales registration with minimal steps |
| tax | Tax configuration — standard rate |

---

## Roles

No defined roles — the food truck owner typically operates alone or with one helper.

---

## Typical use cases

- Load the daily inventory before each service based on demand forecast
- Charge quickly with a portable card reader and contactless
- Manage the cash closing at the end of each service
- Track best-selling products per location

---

## Notes

Hospitality sector — applicable VAT rate for prepared food and drinks. Food trucks operate frequently at markets, festivals, and events. A reduced menu simplifies stock management: load only what is needed for each service. A portable card reader is essential as customers often pay by card or contactless. Verify that the municipal licence permits operating at each location.
