# Extend: kitchen → Recipes & Menu Variants

**Status:** To extend
**Priority:** MEDIUM
**Sectors:** Hospitality (pizzeria, bakery, sushi_restaurant, coffee_shop, wine_bar)

## Current State

Models: KDS areas, order routing, kitchen display. No recipe/BOM management.

## What to Add

### Models

```python
class Recipe(models.Model):
    """Recipe/BOM for a menu item."""
    product = models.OneToOneField('inventory.Product')
    name = models.CharField()
    yield_qty = models.DecimalField(default=1)       # Portions per batch
    prep_time = models.IntegerField(null=True)       # Minutes
    instructions = models.TextField(blank=True)
    is_active = models.BooleanField(default=True)

class RecipeIngredient(models.Model):
    """Ingredient in a recipe (BOM line)."""
    recipe = models.ForeignKey(Recipe)
    ingredient = models.ForeignKey('inventory.Product')  # Raw material
    quantity = models.DecimalField()
    unit = models.CharField()                        # "g", "ml", "unit"
    is_optional = models.BooleanField(default=False)
    allergens = models.JSONField(default=list)       # ["gluten", "lactose"]

class ProductionBatch(models.Model):
    """Daily/periodic production plan (bakery: morning batch)."""
    date = models.DateField()
    recipe = models.ForeignKey(Recipe)
    planned_qty = models.IntegerField()
    produced_qty = models.IntegerField(null=True)
    status = models.CharField(choices=[
        ('planned', 'Planned'),
        ('in_progress', 'In Progress'),
        ('completed', 'Completed'),
    ])
    notes = models.TextField(blank=True)

class OpenBottle(models.Model):
    """Wine/spirits by-the-glass tracking (wine_bar)."""
    product = models.ForeignKey('inventory.Product')
    opened_at = models.DateTimeField(auto_now_add=True)
    servings_remaining = models.IntegerField()       # Glasses left
    serving_price = models.DecimalField()            # Price per glass
    expires_at = models.DateTimeField(null=True)     # Wine oxidation limit
    is_active = models.BooleanField(default=True)
```

### Features

| Feature | Business Type | Description |
|---------|---------------|-------------|
| Recipe cost calc | All | Sum ingredient costs → food cost % per dish |
| Menu variants | pizzeria | Half-and-half: combine 2 pizzas on 1 base |
| Size variants | pizzeria, coffee_shop | Small/Medium/Large with price diff |
| Open bottle mgmt | wine_bar | Track glasses poured from opened bottles |
| Production plan | bakery | Morning batch plan, ingredient requisition |
| Daily specials | restaurant | Temporary menu items with auto-expire |
| Allergen matrix | All | Per-recipe allergen tagging, menu display |

### New Views

- **Recipes** — CRUD with ingredient list, cost calculation, allergen summary
- **Production plan** — Calendar: what to produce each day, ingredient needs
- **Open bottles** — Current open bottles, servings remaining, expiry alert
- **Food cost report** — Cost vs price, margin per dish
- **Allergen matrix** — Grid: dishes × allergens (for legal compliance)

## Dependencies

- `inventory` (ingredients as products, stock deduction on sale)
- `orders` (link dish sale → recipe → ingredient consumption)
- `pricing` (size variants pricing)
