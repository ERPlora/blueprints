# Setup Guide: Accounting Firm / Tax Advisory (Gestoria)

> Set up your Accounting Firm from scratch using the ERPlora AI Assistant.
> All commands are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this message first to the AI Assistant:

```
Hi! I have an accounting and tax advisory firm in Valencia, Spain. It's called "Gestoria Navarro & Asociados". We offer accounting, tax, payroll, labor, and corporate services to both freelancers and SMEs (SL, SA). We handle full accounting for our clients, file their quarterly and annual taxes, manage payroll, and handle administrative procedures (registrations, certificates, deeds). I need to set up the whole system.
```

The assistant will detect your business type and install the appropriate modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Great, modules are installed. Configure everything:

- Business data: name "Gestoria Navarro & Asociados S.L.", address "Calle Colon 42, 3o B, 46004 Valencia", tax ID B96345678, phone 963 456 789, email info@gestorianavarro.es
- VAT: 21% not included in prices. Classes: Standard VAT (21%) for professional services
- Payment methods: bank transfer, direct debit, card
- Employees:
  - Antonio Navarro (Senior Advisor, PIN 1234)
  - Elena Rodriguez (Junior Advisor, PIN 5678)
  - Carmen Ruiz (Administrative, PIN 9012)
  - Pablo Garcia (Administrative, PIN 3456)
- Services (categories):
  - Basic tax advisory freelancers: 65 EUR/month
  - Tax advisory SL company: 150 EUR/month
  - Full accounting SME: 200 EUR/month
  - Payroll (per employee): 12 EUR/payslip
  - Income tax return (IRPF): 60 EUR
  - SL incorporation: 400 EUR
  - Freelancer registration / activity change: 50 EUR
  - Form 720 (foreign assets declaration): 120 EUR
  - Corporate tax: 250 EUR
  - Certificates and one-off procedures: 40 EUR
- Customer categories: Freelancers, SMEs (SL/SA), Communities of goods, Individuals

Execute everything without further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database with tax ID, fiscal data, and categories |
| invoicing | Monthly invoicing to clients for advisory services |
| accounting | Firm's own accounting and journal entry management |
| tax | VAT configuration, tax classes, quarterly and annual models |
| expenses | Firm's own expense tracking (supplies, insurance, software) |
| fiscal_es | Spanish fiscal compliance: models 303, 111, 115, 347, 390, IS |
| calendar | Fiscal calendar with filing deadline reminders |
| documents | Document management: client files, deeds, contracts |
| crm | Commercial tracking of prospects and client portfolio |
| contracts | Service contracts and advisory agreements with clients |
| tasks | Task management and per-client pending tracking |
| time_control | Time tracking per client for profitability analysis |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Senior Advisor | Full access: clients, invoicing, accounting, fiscal, settings, reports |
| Junior Advisor | Clients, tasks, accounting, fiscal (no settings), documents |
| Administrative | Assigned tasks, documents, calendar, time tracking, client view |

---

## Typical use cases

### New client onboarding
1. Register client in `customers` with tax data (tax ID, activity code, VAT regime)
2. Create service contract in `contracts` with agreed rates
3. Set up recurring tasks in `tasks` (quarterly, monthly, annual)

### Quarterly tax cycle
1. Receive client documentation (issued and received invoices)
2. Post accounting entries in `accounting` for the quarter
3. Prepare and review tax models in `fiscal_es` (303, 111, 115)
4. File with AEAT before deadlines (April 20, July 20, October 20, January 20)
5. Archive filing receipts in `documents`

### Monthly client invoicing
1. Review services provided during the month in `time_control` and `tasks`
2. Generate invoices in `invoicing` per contract (fixed fee + extra services)
3. Send invoices by email and record payments

### Payroll management
1. Receive monthly incidents (leaves, overtime, new hires)
2. Calculate payslips per employee
3. Invoice client for payroll service (12 EUR x employee)

### Corporate tax preparation
1. Year-end closing in `accounting`
2. Calculate result and tax base
3. Prepare form 200 in `fiscal_es`
4. File before July 25

### Income tax season (April-June)
1. Gather data from individual clients
2. Prepare draft and IRPF declaration
3. Invoice service (60 EUR per declaration)

---

## Notes

### Sector and regulatory framework

Accounting firms and tax advisories (gestorias) in Spain are professional practices that act as intermediaries between their clients and the tax administration (AEAT). Administrative managers require professional college membership. The sector is governed by Law 34/2006 on access to legal professions and the regulations of the Administrative Managers' Colleges.

### Typical pricing model

- **Fixed monthly fee**: most firms work with fixed rates per client based on complexity (freelancer: 50-80 EUR/month, SL: 100-200 EUR/month, SA: 200-500 EUR/month)
- **One-off services**: specific procedures billed per unit (incorporations, registrations, tax returns)
- **Payroll**: fixed fee per employee per month (8-15 EUR/payslip)
- **VAT at 21%**: being B2B services, prices are always expressed without VAT

### How ERPlora helps

- **Automated fiscal calendar**: the `calendar` + `fiscal_es` modules alert on filing deadlines, avoiding late penalties
- **Per-client profitability tracking**: `time_control` shows actual time spent per client vs. what's invoiced
- **Automated invoicing**: `invoicing` + `contracts` enables recurring monthly invoice generation
- **Digital archive**: `documents` centralizes all client documentation, facilitating audits and lookups
- **CRM for acquisition**: `crm` enables prospect tracking and portfolio management
