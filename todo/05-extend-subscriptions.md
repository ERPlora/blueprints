# Extend: subscriptions → Membership Features

**Status:** To extend
**Priority:** HIGH
**Sectors:** Personal Services (gym, pilates_yoga), Entertainment (sports_club, escape_room), Coworking

## Current State

Models: `Plan`, `Subscription` — basic recurring billing.

## What to Add

### Models

```python
class SessionPack(models.Model):
    """Prepaid session credits (10 classes for €80)."""
    name = models.CharField()                        # "Bono 10 clases"
    total_sessions = models.IntegerField()
    price = models.DecimalField()
    validity_days = models.IntegerField(null=True)   # null = no expiry
    is_active = models.BooleanField(default=True)

class MemberSessionCredit(models.Model):
    """Credits for a specific subscription."""
    subscription = models.ForeignKey(Subscription)
    session_pack = models.ForeignKey(SessionPack, null=True)
    remaining = models.IntegerField()
    expires_at = models.DateField(null=True)

class CheckIn(models.Model):
    """Access control check-in/out."""
    subscription = models.ForeignKey(Subscription)
    checked_in_at = models.DateTimeField(auto_now_add=True)
    checked_out_at = models.DateTimeField(null=True)
    method = models.CharField(choices=[
        ('manual', 'Manual'),
        ('qr', 'QR Code'),
        ('pin', 'PIN'),
    ])
```

### Features to Add to Subscription Model

```python
# Add to existing Subscription:
is_frozen = models.BooleanField(default=False)
frozen_until = models.DateField(null=True)
family_group = models.ForeignKey('self', null=True)  # Group memberships
```

### New Views

- **Check-in screen** — Full-screen: scan QR / enter PIN → green/red result
- **Session packs** — CRUD + credit consumption log
- **Freeze membership** — Pause/resume with date
- **Member dashboard** — Check-in history, credits remaining, next payment

## Dependencies

- `customers` (member = customer with subscription)
- `cash_register` (payment on renewal)
- ERPlora Bridge (QR scanner for check-in)
