# Setup Guide: Maintenance & SAT

> Configure your Maintenance & SAT hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hi! I have a maintenance and technical service company in Vienna. It's called "TecniService Vienna GmbH". We do preventive and corrective maintenance on industrial and hospitality installations. We have field technicians with vans and SLA contracts with clients. I need to set up the full system.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfect, modules are installed. Please configure everything:

- Business info: name "TecniService Vienna GmbH", address "34 Mariahilfer Strasse, 1060 Vienna", VAT number ATU23456789, phone 01 890 1234, email sat@tecniservice.at
- VAT: 20% not included in prices. Classes: Standard Rate (20%) for maintenance services
- Payment methods: bank transfer, direct debit for contracts
- Employees:
  - Alvaro Miro (Technician, PIN 1234)
  - Lucia Fischer (Dispatcher, PIN 5678)

Execute everything without asking further questions.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | SLA maintenance contracts with response times and scope |
| customers | Client database with installation history |
| invoicing | Ticket and contract invoicing |
| maintenance | Maintenance orders, repair tickets, and work reports |
| staff | Technician management and scheduling |
| tasks | Task assignment per incident and technician |
| tax | Tax configuration — standard rate for maintenance services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Technician | maintenance, field service, tasks, view-only inventory |
| Dispatcher | maintenance, tasks, schedules, customers |

---

## Typical use cases

- Receive and manage fault tickets with priority assignment to a technician
- Track response and resolution time according to the contract SLA
- Schedule periodic preventive maintenance with automatic notification
- Record the technician's work report for invoicing the intervention

---

## Notes

Services sector — standard VAT for industrial and technical maintenance services. SLA contracts define guaranteed service levels (response time, resolution time) with penalties for non-compliance. Work reports signed by the client are the basis for billing and serve as evidence in case of claims. Van stock allows the technician to resolve most faults on the first visit.
