# Setup Guide: Electronics & IT

> Configure your Electronics & IT hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have an electronics and IT shop in Newcastle. It's called "TechZone Northeast". We sell phones, laptops, tablets, and accessories. We also do technical repairs and accept trade-ins. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "TechZone Northeast Ltd", address "34 Northumberland Street, Newcastle upon Tyne NE1 7DE", VAT number GB901234567, phone 0191 234 5678, email info@techzonenortheast.co.uk
- VAT: 20% included in prices. Classes: Standard Rate (20%) for electronics and technical services
- Payment methods: cash, card, financing, contactless
- Employees:
  - Ryan Lawson (Sales Assistant, PIN 1234)
  - Ivan Patel (Technician, PIN 5678)
- Products:
  - Samsung Galaxy A55 (€329), iPhone 15 (€799), HP Laptop 15s (€549), iPad 10th gen (€379), Universal case (€15), USB-C cable (€12), Wireless earbuds (€49), 20000mAh power bank (€35)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with serial number capture at sale |
| customers | Customer database with purchase history and warranty records |
| inventory | Serial number tracking per device, warranty management |
| invoicing | Issue invoices with serial number detail for warranty |
| sales | Record product and repair service sales |
| tax | Tax configuration — standard rate for electronics |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Sales Assistant | sales, cash register, view-only customers |
| Technician | maintenance/repairs, view-only inventory |

---

## Typical use cases

- Sell products with automatic serial number recording for warranty purposes
- Manage technical repairs with diagnosis, estimate, and turnaround time
- Handle trade-ins with used device valuation
- Offer financing with credit contract management

---

## Notes

Retail sector — standard VAT for consumer electronics. Serial number registration is essential for managing warranties (2-year statutory warranty in the EU). Used devices may use the margin scheme to avoid full VAT on second-hand items. Repairs are invoiced separately for labour and parts. It is recommended to get customer sign-off before opening a device for repair.
