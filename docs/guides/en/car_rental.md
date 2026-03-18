# Setup Guide: Car Rental

> Configure your Car Rental hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a car rental company at the airport in Faro, Portugal. It's called "Algarve Rent a Car Lda". We rent vehicles by the day to tourists and businesses, with fleet management, insurance, and online reservations. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Algarve Rent a Car Lda", address "Faro International Airport, Terminal Building, 8005-139 Faro", VAT number PT123456789, phone 289 345 678, email info@algarverentacar.pt
- VAT: 23% included in prices. Classes: Standard Rate (23%) for vehicle rental
- Payment methods: card, bank transfer, online payment
- Employees:
  - Catarina Rodrigues (Rental Agent, PIN 1234)
  - Tiago Ferreira (Fleet Manager, PIN 5678)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | Rental contracts with terms, damage policy, and insurance |
| customers | Customer database with driving licence validation |
| fleet | Fleet management with vehicle status, maintenance, and availability |
| invoicing | Issue rental invoices and deposits |
| reservations | Reservation system with availability calendar and booking |
| tax | Tax configuration — standard rate for vehicle rental |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Rental Agent | reservations, customers, sales, cash register, view-only fleet |
| Fleet Manager | full fleet management, maintenance |

---

## Typical use cases

- Manage online and counter reservations with fleet availability calendar
- Record pre and post-rental damage with photos attached to the contract
- Control preventive maintenance for each vehicle (MOT, services)
- Manage included insurance and optional extras (GPS, child seat)

---

## Notes

Automotive sector — standard VAT for vehicle rental. The rental contract must include insurance terms, damage excess, and fuel policy. Vehicle pick-up and return must be recorded with photos to avoid disputes. Extras (additional driver, GPS, full cover insurance) should be configured as options in reservations.
