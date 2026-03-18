# Setup Guide: Construction Company

> Configure your Construction Company hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a construction company in Cologne. It's called "Rhine Build GmbH". We do civil engineering, building renovation, and residential construction. We manage projects with subcontractors, work certifications, and cost control. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "Rhine Build GmbH", address "12 Industriestrasse, 50679 Cologne", VAT number DE345678901, phone 0221 345 6789, email info@rhinebuild.de
- VAT: 19% not included in prices. Classes: Standard Rate (19%), Reduced Rate (7%) for residential renovation
- Payment methods: bank transfer, construction progress billing
- Employees:
  - Franz Peters (Project Manager, PIN 1234)
  - Manuel Klein (Site Manager, PIN 5678)
  - Doris Schulz (Sales Representative, PIN 9012)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database for property developers and private clients |
| expenses | Track costs per project: materials, subcontractors, equipment |
| invoicing | Issue progress certifications and final project invoices |
| projects | Project management with phases, milestones, and budget tracking |
| purchase_orders | Purchase orders for materials and subcontractor services |
| quotes | Detailed project quotes with scope, materials, and labour |
| staff | Staff assignments to projects with role tracking |
| tasks | Task management per project phase and worker |
| tax | Tax configuration — standard rate, reduced for residential renovation |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Project Manager | projects, tasks, quotes, view-only purchase orders |
| Site Manager | view projects, tasks, view-only inventory and staff |
| Sales Representative | quotes, customers, view-only invoicing |

---

## Typical use cases

- Manage construction projects with phases, milestones, and real-time cost control
- Issue monthly progress certifications based on construction progress
- Control subcontractors with purchase orders and invoice validation
- Track margin per project comparing budget vs. actual cost

---

## Notes

Construction sector — standard VAT for new builds; reduced VAT for residential renovation (when the client is the owner and the property is more than 2 years old). Reverse charge VAT may apply in certain works between businesses. Progress certifications are legal documents that confirm work completion and entitle invoicing.
