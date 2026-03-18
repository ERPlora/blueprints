# Setup Guide: Real Estate Agency

> Configure your Real Estate Agency hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a real estate agency in Lisbon. It's called "Tagus Property Agency". We buy and sell apartments, commercial premises, and residential properties. We manage client CRM, property viewings, and follow-up through to completion. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Tagus Property Agency Lda", address "23 Avenida da Liberdade, 1250 Lisbon", VAT number PT456789012, phone 21 012 3456, email info@tagusproperty.pt
- VAT: 23% not included in fees. Classes: Standard Rate (23%) for property intermediation services
- Payment methods: bank transfer, bank draft
- Employees:
  - Ana Serrano (Real Estate Agent, PIN 1234)
  - Daniel Ruiz (Manager, PIN 5678)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | Mandate contracts and sales agreements |
| customers | Client database — buyers, sellers, and landlords |
| invoicing | Commission invoicing on successful transactions |
| leads | Lead management and prospect pipeline |
| tax | Tax configuration — standard rate for intermediation fees |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Real Estate Agent | leads, customers, view-only contracts |
| Manager | leads, customers, full contracts, invoicing, view reports |

---

## Typical use cases

- Manage the leads pipeline from first contact through to completion
- Schedule property viewings with confirmation to buyer and seller
- Track listed properties with status and price
- Calculate and issue the commission invoice on closing a transaction

---

## Notes

Real estate sector — intermediation fees are taxed at the standard rate. The sale of residential property between private individuals does not carry VAT (stamp duty is paid by the buyer). Real estate agencies must comply with applicable registration and anti-money laundering regulations. Rental commission payments from businesses may have withholding tax obligations.
