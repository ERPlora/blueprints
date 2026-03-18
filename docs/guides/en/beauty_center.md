# Setup Guide: Beauty Center

> Configure your Beauty Center hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a beauty centre in Milan. It's called "Sublime Beauty Centre". We offer facial treatments, laser hair removal, manicures, pedicures, and aesthetic massages. We have treatment cabins and a per-specialist booking system. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Sublime Beauty Centre", address "22 Via Montenapoleone, 20121 Milan", VAT number IT12345678901, phone 02 456 7890, email sublime@centrobeauty.it
- VAT: 22% included in prices. Classes: Standard Rate (22%) for aesthetic services
- Payment methods: cash, card, contactless
- Employees:
  - Cristina Ferrari (Manager, PIN 1234)
- Services:
  - Facial cleanse (€45), Laser hair removal small zone (€35), Laser hair removal large zone (€65), Manicure (€25), Pedicure (€30), Manicure + pedicure (€50), Facial massage (€40), Anti-ageing treatment (€75)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Cabin scheduling per specialist with time slot management |
| cash_register | POS and cash management |
| commissions | Track and calculate staff commissions per service |
| customers | Client profiles with treatment history and consent forms |
| inventory | Stock for cosmetic products and materials used in treatments |
| invoicing | Issue invoices and session vouchers |
| sales | Record service and product sales |
| services | Service catalog with cabin, duration, and price |
| staff | Staff management with schedules and commission rates |
| tax | Tax configuration — standard rate for aesthetic services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Manage appointments per cabin and specialist with weekly agenda view
- Sell session bundles (e.g. 10 laser sessions) with a discount
- Record treatment formulas and preferences for each client
- Calculate staff commissions per service rendered

---

## Notes

Personal services sector — standard VAT rate for aesthetic treatments. Session bundles allow client retention with advance payment. Informed consent forms are mandatory for invasive treatments such as laser or mesotherapy. The `commissions` module automatically calculates staff commissions on each service.
