# Extend: inventory → Scale, Traceability & Allergens

**Status:** To extend
**Priority:** LOW
**Sectors:** Retail (fruit_shop, butcher_shop, fish_shop, gourmet, health_store)

## Current State

Models: `Product`, `Stock`, `StockLocation` — standard inventory management.

## What to Add

### Extend Product Model

```python
# Add to existing Product:
sell_by_weight = models.BooleanField(default=False)  # Enable scale integration
default_unit = models.CharField(default='unit')      # "unit", "kg", "g", "l"
origin = models.CharField(blank=True)                # "Spain - Valencia"
catch_zone = models.CharField(blank=True)            # FAO zone (fish)
allergens = models.JSONField(default=list)            # ["gluten", "milk", "nuts", ...]
nutritional_info = models.JSONField(default=dict)     # {calories, protein, fat, carbs}
is_organic = models.BooleanField(default=False)
```

### Models

```python
ALLERGEN_CHOICES = [
    ('gluten', 'Gluten'),
    ('crustaceans', 'Crustaceans'),
    ('eggs', 'Eggs'),
    ('fish', 'Fish'),
    ('peanuts', 'Peanuts'),
    ('soy', 'Soy'),
    ('milk', 'Milk'),
    ('nuts', 'Tree Nuts'),
    ('celery', 'Celery'),
    ('mustard', 'Mustard'),
    ('sesame', 'Sesame'),
    ('sulphites', 'Sulphites'),
    ('lupin', 'Lupin'),
    ('molluscs', 'Molluscs'),
]  # EU 14 mandatory allergens

class ExpiryBatch(models.Model):
    """Expiry date tracking per product batch."""
    product = models.ForeignKey(Product)
    batch_number = models.CharField(blank=True)
    expiry_date = models.DateField()
    quantity = models.DecimalField()
    location = models.ForeignKey(StockLocation, null=True)
    alert_days_before = models.IntegerField(default=7)

class WeighingRecord(models.Model):
    """Record from scale integration (via Bridge)."""
    product = models.ForeignKey(Product)
    weight = models.DecimalField()                   # kg
    price_per_kg = models.DecimalField()
    total_price = models.DecimalField()
    weighed_at = models.DateTimeField(auto_now_add=True)
    sale = models.ForeignKey('sales.Sale', null=True)
```

### Bridge Integration (Scale)

Scale communication via ERPlora Bridge WebSocket:

```javascript
// bridge.js addition
Alpine.store('bridge').getWeight()  // Returns weight from connected scale
// Protocol: {"action": "scale_read"} → {"weight": 0.450, "unit": "kg", "stable": true}
```

### New Views

- **Expiry dashboard** — Products expiring soon, grouped by days remaining
- **Allergen matrix** — Grid: products × 14 EU allergens
- **Origin/traceability** — Filter products by origin, catch zone
- **Scale mode** — POS integration: tap product → read scale → price calculated

### Features

| Feature | Business Type | Description |
|---------|---------------|-------------|
| Scale integration | fruit_shop, butcher_shop, fish_shop | Read weight from scale via Bridge |
| Expiry tracking | All food retail | Alerts when products approach expiry |
| Allergen tagging | All food retail | EU 14 mandatory allergens per product |
| Origin traceability | fish_shop, fruit_shop | FAO catch zone, farm/region |
| Organic/eco badge | health_store, gourmet | Product badge in POS and catalog |
| Cut-to-measure | butcher_shop | Record custom cuts, yield tracking |

## Dependencies

- ERPlora Bridge (scale hardware communication)
- `sales` / `cash_register` (weight-based pricing at POS)
- `notifications` (expiry alerts)
