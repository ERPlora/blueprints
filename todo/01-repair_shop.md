# Module: repair_shop

**Status:** To create
**Priority:** HIGH
**Sectors:** Manufacturing (auto_repair, electronics_repair), Retail (bicycle_shop)

## Why

`maintenance` module = internal CMMS (keep your own equipment running).
`repair_shop` = customer brings device/vehicle, you diagnose, quote, repair, return.

Completely different workflow, different models, different UX.

## Models

```python
class RepairOrder(models.Model):
    """Customer repair job from intake to delivery."""
    number = models.CharField(unique=True)          # REP-0001
    customer = models.ForeignKey('customers.Customer')
    device = models.ForeignKey('DeviceRecord', null=True)
    status = models.CharField(choices=[
        ('received', 'Received'),
        ('diagnosing', 'Diagnosing'),
        ('quoted', 'Quoted'),
        ('approved', 'Approved'),
        ('in_repair', 'In Repair'),
        ('ready', 'Ready for Pickup'),
        ('delivered', 'Delivered'),
        ('cancelled', 'Cancelled'),
    ])
    symptoms = models.TextField()                    # Customer description
    diagnosis = models.TextField(blank=True)         # Technician diagnosis
    estimated_cost = models.DecimalField(null=True)
    final_cost = models.DecimalField(null=True)
    received_at = models.DateTimeField(auto_now_add=True)
    promised_at = models.DateTimeField(null=True)
    delivered_at = models.DateTimeField(null=True)
    technician = models.ForeignKey('accounts.LocalUser', null=True)
    priority = models.CharField(choices=[('normal','Normal'),('urgent','Urgent')])
    warranty_repair = models.BooleanField(default=False)
    notes = models.TextField(blank=True)

class DeviceRecord(models.Model):
    """Customer's device/vehicle history."""
    customer = models.ForeignKey('customers.Customer')
    device_type = models.CharField()                 # 'vehicle', 'phone', 'laptop', 'bicycle'
    brand = models.CharField()
    model = models.CharField()
    serial_number = models.CharField(blank=True)
    # Vehicle-specific
    plate_number = models.CharField(blank=True)      # Matricula
    vin = models.CharField(blank=True)
    mileage = models.IntegerField(null=True)
    # General
    notes = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

class SparePartUsage(models.Model):
    """Parts used in a repair."""
    repair_order = models.ForeignKey(RepairOrder)
    product = models.ForeignKey('inventory.Product')  # From inventory
    quantity = models.DecimalField()
    unit_price = models.DecimalField()

class WarrantyRecord(models.Model):
    """Warranty tracking for repairs."""
    repair_order = models.ForeignKey(RepairOrder)
    warranty_type = models.CharField(choices=[
        ('manufacturer', 'Manufacturer'),
        ('shop', 'Shop'),
    ])
    start_date = models.DateField()
    end_date = models.DateField()
    conditions = models.TextField(blank=True)
```

## Navigation

```python
NAVIGATION = [
    {'label': 'Dashboard', 'icon': 'speedometer-outline', 'id': 'dashboard'},
    {'label': 'Repair Orders', 'icon': 'build-outline', 'id': 'orders'},
    {'label': 'Devices', 'icon': 'hardware-chip-outline', 'id': 'devices'},
    {'label': 'Spare Parts', 'icon': 'cube-outline', 'id': 'parts'},
    {'label': 'Warranties', 'icon': 'shield-checkmark-outline', 'id': 'warranties'},
]
```

## Business Type Variants

| Type | Device Type | Extra Features |
|------|-------------|---------------|
| auto_repair | vehicle | Plate number, VIN, mileage, MOT/ITV dates |
| electronics_repair | phone/laptop/tablet | Serial number, IMEI, diagnostic checklist |
| bicycle_shop | bicycle | Frame serial, component list |

## Dependencies

- `customers` (customer record)
- `inventory` (spare parts stock)
- `invoicing` (bill from repair order)
- ERPlora Bridge (receipt printing)

## Permissions

```
repair_shop.view_repair_order
repair_shop.add_repair_order
repair_shop.change_repair_order
repair_shop.delete_repair_order
repair_shop.view_device_record
repair_shop.change_device_record
```
