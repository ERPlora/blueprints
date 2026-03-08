# Extend: maintenance → Field Service Contracts

**Status:** To extend
**Priority:** MEDIUM
**Sectors:** Construction (installer, locksmith, maintenance_company), Professional Services (cleaning_company, landscaping)

## Current State

Models: `MaintenanceOrder` — internal CMMS (preventive/corrective for own equipment).

## What to Add

### Models

```python
class ServiceContract(models.Model):
    """Customer-facing service/maintenance contract."""
    customer = models.ForeignKey('customers.Customer')
    contract_number = models.CharField(unique=True)
    name = models.CharField()                        # "Mantenimiento anual caldera"
    contract_type = models.CharField(choices=[
        ('preventive', 'Preventive'),                # Periodic visits
        ('on_demand', 'On Demand'),                  # Call when needed
        ('full', 'Full Coverage'),                   # Preventive + emergency
    ])
    start_date = models.DateField()
    end_date = models.DateField()
    auto_renew = models.BooleanField(default=False)
    monthly_fee = models.DecimalField(null=True)
    includes_parts = models.BooleanField(default=False)
    max_response_hours = models.IntegerField(null=True)  # SLA
    visit_frequency = models.CharField(blank=True)   # "quarterly", "monthly"
    is_active = models.BooleanField(default=True)

class ServiceVisit(models.Model):
    """Scheduled or emergency visit under a contract."""
    contract = models.ForeignKey(ServiceContract, null=True)
    work_order = models.ForeignKey(MaintenanceOrder, null=True)
    visit_type = models.CharField(choices=[
        ('preventive', 'Scheduled Preventive'),
        ('corrective', 'Corrective'),
        ('emergency', 'Emergency'),
    ])
    scheduled_date = models.DateTimeField()
    completed_date = models.DateTimeField(null=True)
    technician = models.ForeignKey('accounts.LocalUser', null=True)
    address = models.TextField()
    checklist = models.JSONField(default=list)        # [{item, done, notes}]
    photos = models.JSONField(default=list)           # Before/after file paths
    customer_signature = models.TextField(blank=True) # Base64 signature
    notes = models.TextField(blank=True)

class Certification(models.Model):
    """Technician certifications (installer: gas, electric, etc.)."""
    employee = models.ForeignKey('accounts.LocalUser')
    name = models.CharField()                        # "Instalador Gas Cat. B"
    issuer = models.CharField()                      # "CONAIF"
    number = models.CharField(blank=True)
    issued_date = models.DateField()
    expiry_date = models.DateField(null=True)
    document = models.FileField(null=True)

class Subcontractor(models.Model):
    """External subcontractor for specialized work."""
    name = models.CharField()
    specialty = models.CharField()
    phone = models.CharField()
    email = models.EmailField(blank=True)
    hourly_rate = models.DecimalField(null=True)
    is_active = models.BooleanField(default=True)
```

### Extend MaintenanceOrder

```python
# Add to existing MaintenanceOrder:
is_emergency = models.BooleanField(default=False)    # 24h urgency
subcontractor = models.ForeignKey(Subcontractor, null=True)
service_contract = models.ForeignKey(ServiceContract, null=True)
ohs_checklist = models.JSONField(default=list)       # Safety checklist
```

### New Views

- **Service contracts** — CRUD, renewal alerts, visit calendar
- **Visit calendar** — Map view + calendar of upcoming visits
- **Technician certifications** — Expiry alerts dashboard
- **Emergency mode** — Priority queue, SLA countdown timer
- **Visit report** — Checklist completion + customer signature + photos

## Dependencies

- `customers` (contract holder)
- `field_service` (route optimization, GPS)
- `invoicing` (billing from contracts)
- `file_manager` (photos, documents)
- `esign` (customer signature on visit reports)
