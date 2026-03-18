# Setup Guide: Hair Salon

> Configure your Hair Salon hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a hair salon in Lyon. It's called "Helena Hair Studio". We do cuts, colouring, hair treatments, and also sell professional haircare products. We manage appointments and staff commissions. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Helena Hair Studio", address "56 Rue de la République, 69001 Lyon", VAT number FR34567890123, phone 04 77 34 56 78, email helena@hairsalon.fr
- VAT: 20% included in prices. Classes: Standard Rate (20%) for hairdressing services and product sales
- Payment methods: cash, card, contactless
- Employees:
  - Helena Dubois (Stylist, PIN 1234)
- Services:
  - Women's cut (€25), Men's cut (€18), Full colour (€65), Highlights (€80), Keratin treatment (€90), Blowdry (€20), Root tint (€40), Manicure (€20)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Appointment scheduling per stylist with duration |
| cash_register | POS and cash management |
| commissions | Staff commission calculation per service and product sale |
| customers | Client profiles with colour formula and treatment history |
| inventory | Stock for colorants, treatments, and retail products |
| invoicing | Issue tickets and invoices |
| sales | Record service and product sales |
| services | Service catalogue with duration, price, and stylist assignment |
| staff | Staff management with availability and commission rates |
| tax | Tax configuration — standard rate for hairdressing services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Stylist | sales, appointments, view-only customers |

---

## Typical use cases

- Manage the diary per stylist with duration per service
- Save each client's exact colour formula for reproduction
- Calculate staff commissions per service and products sold
- Sell professional haircare products at retail

---

## Notes

Personal services sector — standard VAT for hairdressing services. The colour card per client is essential for reproducing exact results and avoiding costly mistakes. Commissions on product sales incentivise staff to recommend products during the appointment. The `commissions` module automatically calculates commissions when closing each sale.
