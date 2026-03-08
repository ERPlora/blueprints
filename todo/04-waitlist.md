# Module: waitlist

**Status:** To create
**Priority:** LOW
**Sectors:** Personal Services (hair_salon, barber_shop), Hospitality (bar, restaurant)

## Why

Walk-in businesses need queue management. Currently no way to manage "customer arrives without appointment, waits for a turn." Different from `reservations` (pre-booked) and `appointments` (scheduled time slot).

## Models

```python
class WaitlistConfig(models.Model):
    """Singleton config for waitlist behavior."""
    average_service_time = models.IntegerField(default=30)  # Minutes
    max_queue_size = models.IntegerField(default=20)
    sms_notifications = models.BooleanField(default=False)
    display_mode = models.BooleanField(default=False)  # Public screen

class WaitlistEntry(models.Model):
    """Single entry in the walk-in queue."""
    name = models.CharField()
    phone = models.CharField(blank=True)
    party_size = models.IntegerField(default=1)
    service_type = models.CharField(blank=True)      # "Corte hombre", "Mesa 4 personas"
    priority = models.CharField(choices=[
        ('normal', 'Normal'),
        ('vip', 'VIP'),
    ], default='normal')
    status = models.CharField(choices=[
        ('waiting', 'Waiting'),
        ('called', 'Called'),
        ('seated', 'Seated / In Service'),
        ('no_show', 'No Show'),
        ('cancelled', 'Cancelled'),
    ])
    position = models.IntegerField()
    estimated_wait = models.IntegerField(null=True)  # Minutes
    joined_at = models.DateTimeField(auto_now_add=True)
    called_at = models.DateTimeField(null=True)
    completed_at = models.DateTimeField(null=True)
    notes = models.TextField(blank=True)
```

## Navigation

```python
NAVIGATION = [
    {'label': 'Queue', 'icon': 'people-outline', 'id': 'queue'},
    {'label': 'Display', 'icon': 'tv-outline', 'id': 'display'},
    {'label': 'Settings', 'icon': 'settings-outline', 'id': 'settings'},
]
```

## Key Views

- **Queue** — Live list: name, party size, wait time, action buttons (call, seat, no-show)
- **Display** — Public-facing screen: "Your turn: #42" (full screen, large text, auto-refresh)
- **Add to queue** — Quick form: name, phone (optional), party size

## Dependencies

- `notifications` (SMS when turn arrives — optional)
- `customers` (optional: link to customer record)

## Permissions

```
waitlist.view_waitlist
waitlist.manage_waitlist
```
