# Setup Guide: Kebab Shop

> Configure your Kebab Shop hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a kebab shop in Berlin. It's called "Istanbul Kebab Berlin". We make döner kebab, wraps, combination plates, and a lunch menu. We also do delivery. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Istanbul Kebab Berlin", address "45 Kurfürstendamm, 10707 Berlin", VAT number DE456789012, phone 030 890 1234, email istanbulkebab@gmail.com
- VAT: 7% included in prices. Classes: Reduced Rate (7%) for prepared food takeaway; 19% for eat-in
- Payment methods: cash, card, contactless
- Employees:
  - Mehmet Yilmaz (Kebab Cook, PIN 1234)
- Products:
  - Large döner in bread (€5.50), Small döner in bread (€4.00), Chicken wrap (€5.00), Mixed wrap (€5.50), Döner plate with fries (€8.50), Kebab + drink menu (€7.50), Falafel (€4.50), Can of drink (€1.50)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Counter POS for quick service |
| inventory | Meat, bread, vegetables, and sauce stock management |
| invoicing | Issue simplified receipts |
| kitchen | Kitchen display for order preparation |
| orders | Order management for counter and delivery |
| sales | Counter and delivery sales |
| tax | Tax configuration — reduced rate for takeaway food |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Kebab Cook | kitchen display, view-only orders, sales, cash register |

---

## Typical use cases

- Manage counter orders with kitchen screen for the cook
- Integrate delivery orders (Deliveroo, Uber Eats) on the kitchen screen
- Track spit meat and bread stock to avoid running out
- Manage the lunch menu with a special price until mid-afternoon

---

## Notes

Hospitality sector — applicable VAT rate for prepared food. Kebab shops often operate in the late afternoon and evening, with peak sales late at night. Spit meat stock control is critical to avoid running out during peak hours. Delivery is an important part of the business, especially at weekends.
