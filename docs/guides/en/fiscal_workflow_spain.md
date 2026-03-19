# Fiscal Workflow Spain — Complete Guide

> Complete guide to the fiscal workflow for businesses in Spain using ERPlora.
> This is not a setup guide — it explains how the full fiscal cycle works, from daily sales to annual filings.

---

## 1. Introduction

If you run a business in Spain, you have tax obligations. Whether you are a sole trader (autonomo) with a hair salon or a limited company (SL) with a restaurant, the Spanish Tax Agency (AEAT) expects you to record every transaction, settle VAT quarterly, and file annual returns.

### What tax obligations does your business have

| Obligation | Frequency | Who |
|------------|-----------|-----|
| Issue an invoice for every sale | Each transaction | Everyone |
| Maintain VAT ledgers (issued and received) | Ongoing | Everyone |
| File Form 303 (quarterly VAT) | Quarterly | Everyone (except surcharge regime) |
| File Form 130 (quarterly income tax) | Quarterly | Sole traders on direct estimation only |
| File Form 390 (annual VAT summary) | Annual | Everyone |
| VERI*FACTU (invoice chain) | Each invoice | Everyone (mandatory from 1 July 2026) |
| Accounting per PGC (Spanish chart of accounts) | Ongoing | Companies mandatory, sole traders recommended |

### Sole Trader vs. Company (SL/SA)

| Aspect | Sole Trader (Autonomo) | Company (SL/SA) |
|--------|----------------------|-----------------|
| Quarterly income tax (Form 130) | Yes, 20% of net income | No — pays Corporate Tax (done by accountant) |
| Quarterly VAT (Form 303) | Yes | Yes |
| PGC accounting | Recommended | Mandatory |
| Liability | Personal, unlimited | Limited to share capital |

### Which ERPlora modules cover each obligation

```
invoicing       → Invoice issuance (base, mandatory)
expenses        → Purchase and expense tracking
accounting      → PGC accounting (journal entries, balance sheet, P&L)
tax             → VAT rate configuration
verifactu       → VERI*FACTU: hash, QR, AEAT submission in real time
fiscal_es       → VAT ledgers, forms 303/390/130, accountant exports
gestoria_es     → Portal for your accountant (optional, paid)
```

All modules are **free** except `gestoria_es` (14.99 EUR/month), which is optional.

---

## 2. Daily Flow — Operations

Every day, your business generates sales and incurs expenses. ERPlora records everything automatically.

### When you make a sale

1. **You charge the customer** at the POS (cash register)
2. ERPlora **generates an invoice** automatically (`invoicing` module)
3. **VERI*FACTU** seals the invoice: computes the SHA-256 hash, generates the QR code, and sends data to AEAT (`verifactu` module)
4. The invoice is recorded in the **issued invoices ledger** (`fiscal_es` module)
5. An **accounting entry** is created automatically in the PGC (`fiscal_es` + `accounting`)

### When you make a purchase or have an expense

1. **You record the supplier invoice** (`expenses` module)
2. It is recorded in the **received invoices ledger** (`fiscal_es` module)
3. An **accounting entry** is created automatically

### Concrete example: you sell a set menu for 12 EUR

```
Set menu:  12.00 EUR (10% VAT included)

Breakdown:
  Tax base:        10.91 EUR  (12 / 1.10)
  Output VAT:       1.09 EUR  (10.91 x 10%)
  Total:           12.00 EUR

What happens automatically:
  1. Invoice issued → series + sequential number
  2. VERI*FACTU → SHA-256 hash chained with previous invoice → QR → AEAT
  3. Issued ledger → new line: date, customer tax ID, base 10.91, VAT 10%, tax 1.09
  4. Accounting entry:
       Debit:  430 Customers .............. 12.00 EUR
       Credit: 700 Sales .................. 10.91 EUR
       Credit: 477 Output VAT .............  1.09 EUR
  5. When payment is received (cash/card):
       Debit:  572 Bank (or 570 Cash) .... 12.00 EUR
       Credit: 430 Customers .............. 12.00 EUR
```

You do not do any of this manually. ERPlora handles everything at the moment of payment.

---

## 3. Quarterly Flow — Tax Returns

Every three months, you must settle VAT with the tax authority. If you are a sole trader, income tax as well.

### Fiscal calendar

| Quarter | Period | Filing deadline |
|---------|--------|----------------|
| Q1 | January - March | 1 to 20 April |
| Q2 | April - June | 1 to 20 July |
| Q3 | July - September | 1 to 20 October |
| Q4 | October - December | 1 to 30 January (following year) |

ERPlora generates alerts **15 days before** each deadline.

### Form 303 — Quarterly VAT

Form 303 is the VAT self-assessment. The formula is straightforward:

```
Output VAT (VAT you charged your customers)
- Input VAT (VAT you paid to your suppliers)
= Result
```

If the result is **positive**, you owe it to the tax authority. If **negative**, you can offset it in the next quarter or request a refund in Q4.

#### Step by step in ERPlora

1. Go to **Fiscal ES** in the side menu
2. Select **Form 303**
3. Choose the quarter (e.g., Q1 2026)
4. Click **Calculate** — ERPlora fills in all fields automatically from the VAT ledgers
5. **Review** the figures. Check they match your business activity
6. Click **Export** — generates the XML (to import into the AEAT online portal) and a PDF summary

#### Example: Q1 for a cafe

```
Sales for the quarter (10% VAT):
  Total tax base:       18,200 EUR
  Output VAT:            1,820 EUR

Purchases for the quarter (21% and 10% VAT):
  Deductible input VAT:    890 EUR

Form 303 result:
  1,820 - 890 = 930 EUR to pay
```

### Form 130 — Sole Trader Income Tax

Only if you are a **sole trader on direct estimation** (not companies).

```
Cumulative income for the year up to this quarter
- Cumulative deductible expenses
= Net income

Net income x 20% = Tax liability
Tax liability - Previous fractional payments - Withholdings = Amount to pay
```

#### Step by step in ERPlora

1. Go to **Fiscal ES** → **Form 130**
2. Choose the quarter
3. Click **Calculate** — ERPlora accumulates income and expenses for the fiscal year
4. **Review** and **Export**

**Important**: Form 130 is **cumulative**. Q2 includes data from January to June, not just April to June. ERPlora calculates this correctly and subtracts previous fractional payments.

---

## 4. Annual Flow — Fiscal Year End

In January, the previous fiscal year is closed with annual filings.

### Form 390 — Annual VAT Summary

Form 390 is an informational summary that **aggregates all 4 quarterly Form 303s** for the year. It does not generate a new tax payment — it only summarizes.

- Filed from 1 to 30 January (together with Q4 of Form 303)
- ERPlora calculates it automatically from the four quarterly 303s
- Includes: annual totals by VAT rate, breakdown by business activity (IAE code), volume of operations

### Fiscal year closing

When closing the fiscal year, ERPlora generates:

- **Balance sheet**: assets, liabilities, and equity as of 31 December
- **Profit and Loss statement (P&L)**: income minus expenses for the year
- **Complete annual package** for your accountant

### Step by step

1. Make sure all 4 quarters are closed and reviewed
2. Go to **Fiscal ES** → **Form 390** → **Calculate**
3. Review the annual totals
4. Generate the **annual package** (see section 5)

---

## 5. Sending to Your Accountant

Most businesses have an accountant (gestor/asesor fiscal) who reviews and files the returns using a digital certificate. ERPlora streamlines this process.

### Generate the accountant package

1. Go to **Fiscal ES** → **Accountant Export**
2. Select the period (quarter or annual)
3. Choose your accountant's software format (Excel, A3, Sage, or generic)
4. Click **Generate package**

### What the quarterly ZIP contains

```
fiscal_{your_business}_2026_Q1.zip
├── ledgers/
│   ├── issued_invoices_2026_Q1.xlsx
│   ├── issued_invoices_2026_Q1.csv
│   ├── received_invoices_2026_Q1.xlsx
│   └── received_invoices_2026_Q1.csv
├── forms/
│   ├── form_303_2026_Q1.xml
│   ├── form_303_2026_Q1.pdf
│   └── form_130_2026_Q1.pdf    (if sole trader)
├── accounting/
│   ├── balance_sheet_2026_Q1.xlsx
│   └── profit_loss_2026_Q1.xlsx
├── accountant_formats/
│   ├── a3_import_2026_Q1.csv         (Wolters Kluwer)
│   ├── sage_import_2026_Q1.csv       (ContaPlus/Sage 50c)
│   └── generic_import_2026_Q1.csv    (universal)
└── summary.pdf
```

The **annual** package includes the same for all 4 quarters, plus Form 390 and annual reports.

### Sending to your accountant

Two options:

- **Email**: ERPlora sends the ZIP directly to your accountant's configured email
- **Download link**: a secure link is generated (expires in 7 days) that you can share

Your accountant receives the data, imports it into their software (A3, Sage, or whichever they use), reviews it, and files the returns with their digital certificate.

### If you have gestoria_es (paid portal)

With the `gestoria_es` module (14.99 EUR/month), your accountant gets:

- Direct access to the hub with their own login (no waiting for emails)
- Dashboard with pending items and deadlines
- Live review of tax forms with per-field corrections
- Formal approval with signature (name + date + hash)
- Complete activity history

---

## 6. VAT Rates in Spain

| Type | Rate | Equivalence Surcharge | Where it applies |
|------|------|----------------------|-----------------|
| **Standard** | 21% | 5.2% | Most products and services |
| **Reduced** | 10% | 1.4% | Hospitality, food, transport, new housing |
| **Super-reduced** | 4% | 0.5% | Bread, milk, eggs, fruit, vegetables, books, medicine |
| **Exempt** | 0% | — | Healthcare, education, insurance, financial services |

### Examples by business type

| Business | Main VAT rate | Notes |
|----------|--------------|-------|
| Restaurant | 10% | All food and drinks served on premises |
| Clothing store | 21% | Standard goods |
| Bakery | 4% on basic bread, 10% on pastries | Two rates in one business |
| Dental clinic | Exempt | Healthcare services |
| Supermarket | 4%, 10%, and 21% | Mix of rates depending on product |
| Hair salon | 21% | Personal services |

### Equivalence surcharge (Recargo de equivalencia)

Only applies to **retail businesses** operated by **natural persons** (sole traders). If you are a retailer under the surcharge regime:

- Your supplier charges you VAT **plus** the surcharge
- You **do not file** Form 303
- VAT is already settled at the source

ERPlora handles this automatically if you enable the surcharge in fiscal settings.

---

## 7. Tax Regimes

### Sole Trader (direct estimation)

- You file: **Form 303** (VAT) + **Form 130** (income tax) quarterly
- Annual: **Form 390** + personal income tax return (done by accountant)
- ERPlora covers Forms 303, 130, and 390 in full

### Company (SL/SA)

- You file: **Form 303** (VAT) quarterly
- Annual: **Form 390** + **Corporate Tax** (Form 200, done by accountant)
- ERPlora covers Forms 303 and 390. Form 200 is the accountant's responsibility

### Sole trader under equivalence surcharge

- **You do not file Form 303** — VAT is settled through purchases
- Your supplier charges you VAT + equivalence surcharge
- ERPlora records transactions but does not generate the 303

### Cooperative

- Special regime with particularities in VAT and Corporate Tax
- ERPlora generates the ledgers and Form 303; the specifics are handled by your accountant

---

## 8. VERI*FACTU — What You Need to Know

### What it is

VERI*FACTU is the Spanish Tax Agency's (AEAT) system to ensure invoices cannot be tampered with after issuance. It works like a simplified blockchain: each invoice is chained to the previous one through a cryptographic hash.

### When it becomes mandatory

**From 1 July 2026** for all businesses using invoicing software (Royal Decree 1007/2023).

### What ERPlora does automatically

When you issue an invoice, the `verifactu` module does all of this without any intervention:

1. **Computes the SHA-256 hash** of the invoice, including the hash of the previous invoice (immutable chain)
2. **Generates the mandatory QR code** with the AEAT verification URL
3. **Sends the data in XML format** to the AEAT via SOAP (in real time or within 4 calendar days)
4. **Seals the record** — the invoice can no longer be modified, only cancelled with a corrective invoice

### What you do

**Nothing.** VERI*FACTU is transparent. You keep selling as usual and ERPlora takes care of everything. The only visible difference is the QR code on your invoices.

### Exceptions

- **Basque Country** (Alava, Bizkaia, Gipuzkoa): uses TicketBAI instead of VERI*FACTU (separate module, pending)
- **Navarra**: has its own system
- **Canary Islands, Ceuta, and Melilla**: IGIC/IPSI instead of VAT; VERI*FACTU still applies where applicable

---

## 9. Special Cases

### Simplified invoices (tickets)

If the transaction is under **400 EUR**, you can issue a simplified invoice (formerly known as a "ticket"). The difference:

| | Full invoice | Simplified invoice |
|---|---|---|
| Customer tax ID | Required | Not required |
| Full customer details | Yes | Not necessary |
| Maximum amount | No limit | 400 EUR (3,000 EUR in certain sectors) |

ERPlora issues simplified invoices by default for POS sales. If the customer requests a full invoice (with their details), it is generated from the same sale.

### Corrective invoices

If you make a mistake on an invoice or there is a return:

1. **You cannot delete** the original invoice (VERI*FACTU prevents it)
2. You issue a **corrective invoice** that fully or partially cancels the original
3. ERPlora generates the reverse accounting entries automatically
4. Both invoices (original and corrective) remain in the ledgers

### Exempt operations

Some services are VAT-exempt (healthcare, education, etc.):

- They are recorded normally in the issued invoices ledger
- They appear in Form 303 as exempt operations (field without tax amount)
- They do not generate output or input VAT

### Equivalence surcharge as a buyer

If you are a retail business (natural person) under the equivalence surcharge:

- Your suppliers charge you VAT + surcharge (e.g., 21% + 5.2%)
- You **do not file** Form 303
- Your retail selling price already includes all taxes
- ERPlora records everything but disables Form 303 generation

---

## 10. Visual Flow

### Daily flow (each transaction)

```
SALE / PAYMENT
     │
     ▼
INVOICE (invoicing)
     │
     ├──→ VERI*FACTU (verifactu)
     │       │
     │       ├── Chained SHA-256 hash
     │       ├── QR code
     │       └── XML submission → AEAT
     │
     ├──→ ISSUED INVOICES LEDGER (fiscal_es)
     │
     └──→ ACCOUNTING ENTRY (accounting)
              │
              ├── 430 Customers (Debit)
              ├── 700 Sales (Credit)
              └── 477 Output VAT (Credit)
```

```
PURCHASE / EXPENSE
     │
     ▼
EXPENSE RECORD (expenses)
     │
     ├──→ RECEIVED INVOICES LEDGER (fiscal_es)
     │
     └──→ ACCOUNTING ENTRY (accounting)
              │
              ├── 62x Expense (Debit)
              ├── 472 Input VAT (Debit)
              └── 410 Creditors (Credit)
```

### Quarterly flow

```
QUARTER COMPLETE (e.g., January-March)
         │
         ▼
VAT LEDGERS CLOSED
         │
         ├──→ FORM 303 (VAT)
         │       Output VAT - Input VAT = Result
         │
         ├──→ FORM 130 (Income tax, sole traders only)
         │       20% cumulative net income - previous payments
         │
         └──→ ACCOUNTANT PACKAGE (ZIP)
                 │
                 ├── Ledgers (Excel + CSV)
                 ├── Forms (XML + PDF)
                 ├── Accounting (Balance sheet + P&L)
                 └── Accountant formats (A3, Sage, generic)
                         │
                         ▼
              EMAIL + DOWNLOAD LINK
                         │
                         ▼
              ACCOUNTANT REVIEWS → FILES WITH AEAT
              (using digital certificate)
```

### Annual flow

```
4 QUARTERS CLOSED
         │
         ▼
FORM 390 (annual VAT summary)
         │
         ▼
FISCAL YEAR CLOSE
  ├── Balance sheet
  └── Profit & Loss statement
         │
         ▼
ANNUAL ACCOUNTANT PACKAGE
         │
         ▼
ACCOUNTANT → Form 200 (Corporate Tax) or Income Tax → AEAT
```

---

## Summary: what ERPlora does vs. what your accountant does

| Task | ERPlora (automatic) | Your accountant |
|------|--------------------|--------------------|
| Issue invoices | Yes | — |
| VERI*FACTU (hash, QR, AEAT) | Yes | — |
| VAT ledgers | Yes | Reviews |
| PGC accounting | Yes | Reviews |
| Form 303 (quarterly VAT) | Calculates and exports | Reviews and files |
| Form 130 (sole trader income tax) | Calculates and exports | Reviews and files |
| Form 390 (annual VAT summary) | Calculates and exports | Reviews and files |
| Corporate Tax (Form 200) | — | Accountant handles |
| Personal income tax return | — | Accountant handles |
| File on AEAT online portal | Generates XML for import | Files with digital certificate |

ERPlora does the heavy lifting: it records, calculates, generates the forms, and exports them in whatever format your accountant needs. Your accountant reviews that everything is correct and officially files it with the tax authority.

---

> **Note**: This guide reflects Spanish tax regulations as of 2026. Legislation may change — ERPlora updates to comply with legal requirements at all times.
