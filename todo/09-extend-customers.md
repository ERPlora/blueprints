# Extend: customers → Rich Client Profiles

**Status:** To extend
**Priority:** LOW
**Sectors:** Personal Services, Retail (pet shops, food shops)

## Current State

Basic `Customer` model with standard fields (name, phone, email, address).

## What to Add

### Models

```python
class CustomerProfile(models.Model):
    """Extended profile data, schema varies by business type."""
    customer = models.OneToOneField(Customer)
    profile_data = models.JSONField(default=dict)
    # Dynamic fields based on business_type:
    # hair_salon: {"formulas": [{"date": "...", "color": "6.3", "developer": "20vol"}]}
    # beauty_center: {"skin_type": "combination", "allergies": ["latex"]}
    # nutrition: {"weight": 72, "height": 175, "goal": "muscle_gain", "allergies": ["gluten"]}
    # dog_grooming: {"pets": [{"name": "Luna", "breed": "Labrador", "weight": 28}]}
    # gym: {"goals": "weight_loss", "injuries": ["knee"]}

class CustomerPhoto(models.Model):
    """Before/after photos (beauty, physiotherapy, tattoo)."""
    customer = models.ForeignKey(Customer)
    photo_type = models.CharField(choices=[
        ('before', 'Before'),
        ('after', 'After'),
        ('progress', 'Progress'),
    ])
    image = models.ImageField()
    date = models.DateField(auto_now_add=True)
    service = models.CharField(blank=True)           # What service was performed
    notes = models.TextField(blank=True)

class ConsentRecord(models.Model):
    """Consent form tracking (GDPR, treatment consent)."""
    customer = models.ForeignKey(Customer)
    consent_type = models.CharField()                # "treatment", "data_processing", "tattoo"
    signed_at = models.DateTimeField()
    document = models.FileField(null=True)           # Signed PDF from esign
    expires_at = models.DateField(null=True)
    is_valid = models.BooleanField(default=True)

class CustomerNote(models.Model):
    """Session notes / visit notes."""
    customer = models.ForeignKey(Customer)
    date = models.DateTimeField(auto_now_add=True)
    author = models.ForeignKey('accounts.LocalUser')
    content = models.TextField()
    is_private = models.BooleanField(default=False)  # Only visible to author
    # For encrypted notes (psychology):
    is_encrypted = models.BooleanField(default=False)
```

### Profile Schemas per Business Type

Defined in business_type JSON `sector_features`, rendered as dynamic form:

```json
{
  "hair_salon": {
    "fields": [
      {"key": "hair_type", "type": "select", "options": ["straight", "wavy", "curly", "coily"]},
      {"key": "scalp_condition", "type": "select", "options": ["normal", "oily", "dry"]},
      {"key": "color_history", "type": "textarea"}
    ]
  },
  "dog_grooming": {
    "fields": [
      {"key": "pet_name", "type": "text"},
      {"key": "breed", "type": "text"},
      {"key": "weight_kg", "type": "number"},
      {"key": "temperament", "type": "select", "options": ["calm", "nervous", "aggressive"]},
      {"key": "health_notes", "type": "textarea"}
    ]
  }
}
```

### New Views

- **Customer detail** — Extended tab with profile data, photos, consent records, notes
- **Photo gallery** — Before/after comparison slider
- **Consent management** — List of signed consents, expiry alerts
- **Profile form** — Dynamic form based on business type config

## Dependencies

- `file_manager` (photo storage)
- `esign` (consent signing)
- `gdpr` (data processing consent tracking)
