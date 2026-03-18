# Setup Guide: Travel Agency

> Configure your Travel Agency hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a travel agency in Dublin. It's called "Horizon Travel Agency". We sell holiday packages, flights, hotels, and cruises. We work with IATA and ATOL. We manage personalised travel quotes and supplier commissions. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Horizon Travel Agency Ltd", address "34 Grafton Street, Dublin 2, D02 XY34", VAT number IE0123456T, phone 01 523 4567, email info@horizontravel.ie
- VAT: 23% not included in agency fees. Travel packages: Tour Operators Margin Scheme (TOMS) applies
- Payment methods: card, bank transfer, financing
- Employees:
  - Isabel Cano (Travel Agent, PIN 1234)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Deposits and on-site payments |
| customers | Client database with travel history and preferences |
| inventory | Travel package catalogue and availability |
| invoicing | Issue travel invoices under TOMS regime |
| quotes | Custom travel quote creation with itineraries |
| sales | Package and component sales |
| tax | Tax configuration — TOMS for travel packages |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Travel Agent | customers, quotes, invoicing, view-only contracts |

---

## Typical use cases

- Create personalised travel quotes with flight, hotel, and activities
- Manage visa tracking and customer documentation follow-up
- Track commissions received from suppliers on each sale
- Invoice under the Tour Operators Margin Scheme (TOMS)

---

## Notes

Tourism sector — travel agencies typically invoice under the **Tour Operators Margin Scheme (TOMS)** where VAT is calculated on the margin (selling price minus cost of the trip), not on the total price. Package holidays are subject to the EU Package Travel Directive, giving customers the right to a full refund if substantial changes are made. Travel agencies must hold all required licences and financial protection bonds (e.g. ATOL in the UK/Ireland).
