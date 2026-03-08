# Module: delivery

**Status:** To create
**Priority:** HIGH
**Sectors:** Hospitality (all), Retail (food shops, florist)

## Why

Currently no way to manage takeaway/delivery orders. All hospitality types need this. `orders` module handles in-house table orders, but delivery has a different lifecycle:
- No table assignment
- Delivery address + zone
- Driver assignment
- Packaging
- External platform integration (future)

## Models

```python
class DeliveryZone(models.Model):
    """Geographic delivery zone with pricing."""
    name = models.CharField()                        # "Centro", "Zona 2"
    min_order = models.DecimalField(default=0)
    delivery_fee = models.DecimalField(default=0)
    estimated_time = models.IntegerField()           # Minutes
    is_active = models.BooleanField(default=True)
    # Simple: zip codes or radius
    zip_codes = models.JSONField(default=list)       # ["28001", "28002"]
    max_radius_km = models.DecimalField(null=True)

class DeliveryOrder(models.Model):
    """Takeaway or delivery order."""
    number = models.CharField(unique=True)           # DEL-0001
    order_type = models.CharField(choices=[
        ('takeaway', 'Takeaway (pickup)'),
        ('delivery', 'Delivery'),
    ])
    customer_name = models.CharField()
    customer_phone = models.CharField()
    # Delivery-only
    delivery_address = models.TextField(blank=True)
    delivery_zone = models.ForeignKey(DeliveryZone, null=True)
    driver = models.ForeignKey(Driver, null=True)
    # Status
    status = models.CharField(choices=[
        ('pending', 'Pending'),
        ('preparing', 'Preparing'),
        ('ready', 'Ready'),
        ('in_transit', 'In Transit'),      # delivery only
        ('delivered', 'Delivered'),
        ('picked_up', 'Picked Up'),        # takeaway only
        ('cancelled', 'Cancelled'),
    ])
    # Timing
    ordered_at = models.DateTimeField(auto_now_add=True)
    promised_at = models.DateTimeField(null=True)    # "listo en 30 min"
    completed_at = models.DateTimeField(null=True)
    # Money
    subtotal = models.DecimalField()
    delivery_fee = models.DecimalField(default=0)
    total = models.DecimalField()
    payment_method = models.CharField()
    paid = models.BooleanField(default=False)
    notes = models.TextField(blank=True)

class Driver(models.Model):
    """Delivery driver (internal or external)."""
    name = models.CharField()
    phone = models.CharField()
    is_active = models.BooleanField(default=True)
    vehicle_type = models.CharField(blank=True)      # moto, bici, coche
    is_external = models.BooleanField(default=False)
```

## Navigation

```python
NAVIGATION = [
    {'label': 'Dashboard', 'icon': 'speedometer-outline', 'id': 'dashboard'},
    {'label': 'Orders', 'icon': 'bicycle-outline', 'id': 'orders'},
    {'label': 'Zones', 'icon': 'map-outline', 'id': 'zones'},
    {'label': 'Drivers', 'icon': 'person-outline', 'id': 'drivers'},
]
```

## Key Views

- **Order board** — Kanban: Pending → Preparing → Ready → In Transit / Picked Up
- **New order** — Quick form: phone, items, address (autocomplete zone), payment
- **Driver view** — Mobile-friendly list of assigned deliveries
- **Kitchen integration** — Delivery orders appear in KDS with "DELIVERY" badge

## Dependencies

- `orders` (line items shared format)
- `cash_register` (payment integration)
- `kitchen` (KDS integration)
- `customers` (optional: save delivery addresses)
- ERPlora Bridge (receipt + delivery label printing)

## Future (Phase 2)

- Platform connectors: Glovo, UberEats, JustEat (webhook receivers)
- Self-order kiosk mode (simplified POS for customer-facing screen)
- Real-time driver tracking (GPS)

## Permissions

```
delivery.view_delivery_order
delivery.add_delivery_order
delivery.change_delivery_order
delivery.manage_zones
delivery.manage_drivers
```
