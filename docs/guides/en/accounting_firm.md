# Setup Guide: Accounting Firm

> Configure your Accounting Firm hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have an accounting and tax advisory firm in Dublin. It's called "Harper & Associates Accountants". We provide bookkeeping, tax compliance, payroll, corporate advisory, and financial consulting to freelancers and SMEs. We handle client accounts, file tax returns, manage payroll, and perform company formation and administrative procedures. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Harper & Associates Accountants Ltd", address "14 Grafton Street, Dublin 2, D02 XY12", VAT number IE1234567T, phone 01 234 5678, email info@harperassociates.ie
- VAT: 23% not included in prices. Classes: Standard Rate (23%) for professional services
- Payment methods: bank transfer, direct debit, card
- Employees:
  - Claire Harper (Senior Accountant, PIN 1234)
  - Liam O'Brien (Junior Accountant, PIN 5678)
  - Sinead Doyle (Office Manager, PIN 9012)
  - Conor Walsh (Admin Assistant, PIN 3456)
- Services (categories):
  - Basic tax advisory (freelancers): 75 EUR/month
  - Business tax advisory (Ltd): 180 EUR/month
  - Full bookkeeping SME: 250 EUR/month
  - Payroll (per employee): 15 EUR/payslip
  - Personal income tax return: 80 EUR
  - Company formation (Ltd): 500 EUR
  - VAT registration / changes: 60 EUR
  - Corporate tax return: 300 EUR
  - Ad-hoc certificates and filings: 50 EUR
- Client categories: Freelancers, SMEs (Ltd/PLC), Partnerships, Individuals

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database with VAT number, tax details, and categories |
| invoicing | Issue monthly invoices to clients for advisory services |
| accounting | Firm's own bookkeeping and journal entries |
| tax | Tax configuration — VAT rates, tax classes, quarterly and annual returns |
| expenses | Track firm's own expenses (utilities, insurance, software) |
| calendar | Tax calendar with filing deadline reminders |
| documents | Document management: client files, contracts, certificates |
| crm | Commercial tracking of prospects and client portfolio |
| contracts | Service contracts and retainer agreements with clients |
| tasks | Task management and per-client to-do tracking |
| time_control | Timesheet to record hours per client for profitability control |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Senior Accountant | Full access: clients, invoicing, accounting, tax, configuration, reports |
| Junior Accountant | Clients, tasks, accounting, tax (no configuration), documents |
| Admin Assistant | Assigned tasks, documents, calendar, time tracking, view-only clients |

---

## Typical use cases

### New client onboarding
1. Register client in `customers` with tax details (VAT number, business type, tax regime)
2. Create service contract in `contracts` with agreed fees
3. Set up recurring tasks in `tasks` (quarterly, monthly, annual)

### Quarterly tax cycle
1. Receive client documentation (sales and purchase invoices)
2. Record transactions in `accounting` for the quarter
3. Prepare and review tax returns in `tax`
4. File before deadlines
5. Archive filing confirmations in `documents`

### Monthly client invoicing
1. Review services rendered in `time_control` and `tasks`
2. Generate invoices in `invoicing` per contract (fixed fee + extra services)
3. Send invoices by email and record payments

### Payroll management
1. Receive monthly changes (sick leave, overtime, new hires)
2. Calculate payslips per employee
3. Invoice client for payroll service (15 EUR x employee)

### Corporate tax preparation
1. Year-end accounting close in `accounting`
2. Calculate taxable profit
3. Prepare corporate tax return
4. File before deadline

### Personal tax return season
1. Gather data from individual clients
2. Prepare and submit income tax returns
3. Invoice service (80 EUR per return)

---

## Notes

### Sector overview

Accounting firms are professional practices that act as intermediaries between their clients and tax authorities. They handle bookkeeping, tax compliance, payroll, and administrative procedures. The sector is regulated by professional bodies and requires relevant qualifications and registrations.

### Typical pricing model

- **Fixed monthly retainer**: most firms work with fixed fees per client based on complexity (freelancer: 50-100 EUR/month, Ltd: 100-250 EUR/month, PLC: 250-600 EUR/month)
- **Ad-hoc services**: specific filings charged per unit (company formations, tax returns, registrations)
- **Payroll**: fixed fee per employee per month (10-20 EUR/payslip)
- **VAT at standard rate**: as B2B professional services, prices are always quoted excluding VAT

### How ERPlora helps

- **Automated tax calendar**: the `calendar` module alerts on filing deadlines, avoiding penalties for late submissions
- **Per-client profitability tracking**: `time_control` shows actual time spent per client vs. what is billed
- **Recurring invoicing**: `invoicing` + `contracts` enables automatic monthly invoice generation
- **Digital archive**: `documents` centralises all client documentation, making audits and lookups straightforward
- **CRM for growth**: `crm` tracks potential clients and manages the commercial pipeline
