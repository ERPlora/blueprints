# Module: timesheets

**Status:** To create
**Priority:** MEDIUM
**Sectors:** Professional Services (consulting, law_firm, tax_advisory, design_studio, marketing, admin_agency)

## Why

Professional services bill by the hour. Current modules (`projects`, `tasks`) track work but don't track billable time or generate invoices from hours. `attendance` tracks clock-in/out but not project-level time allocation.

## Models

```python
class HourlyRate(models.Model):
    """Billing rate configuration."""
    name = models.CharField()                        # "Senior Consultant", "Junior Dev"
    rate = models.DecimalField()                     # EUR/hour
    employee = models.ForeignKey('accounts.LocalUser', null=True)  # null = default rate
    customer = models.ForeignKey('customers.Customer', null=True)  # null = all customers
    project = models.ForeignKey('projects.Project', null=True)     # null = all projects

    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['employee', 'customer', 'project'], name='unique_rate')
        ]

class TimeEntry(models.Model):
    """Individual time tracking entry."""
    employee = models.ForeignKey('accounts.LocalUser')
    project = models.ForeignKey('projects.Project', null=True)
    task = models.ForeignKey('tasks.Task', null=True)
    customer = models.ForeignKey('customers.Customer', null=True)
    date = models.DateField()
    start_time = models.TimeField(null=True)         # Optional: exact times
    end_time = models.TimeField(null=True)
    duration = models.DurationField()                # Always required (can be calculated)
    description = models.TextField()
    is_billable = models.BooleanField(default=True)
    hourly_rate = models.DecimalField(null=True)     # Snapshot at entry time
    invoiced = models.BooleanField(default=False)
    invoice = models.ForeignKey('invoicing.Invoice', null=True)
    # Timer support
    timer_started_at = models.DateTimeField(null=True)
    status = models.CharField(choices=[
        ('draft', 'Draft'),
        ('submitted', 'Submitted'),
        ('approved', 'Approved'),
        ('rejected', 'Rejected'),
    ], default='draft')

class TimesheetApproval(models.Model):
    """Weekly/monthly timesheet approval."""
    employee = models.ForeignKey('accounts.LocalUser')
    period_start = models.DateField()
    period_end = models.DateField()
    status = models.CharField(choices=[
        ('pending', 'Pending'),
        ('approved', 'Approved'),
        ('rejected', 'Rejected'),
    ])
    approved_by = models.ForeignKey('accounts.LocalUser', null=True, related_name='approved_timesheets')
    total_hours = models.DurationField()
    billable_hours = models.DurationField()
    notes = models.TextField(blank=True)
```

## Navigation

```python
NAVIGATION = [
    {'label': 'My Time', 'icon': 'time-outline', 'id': 'my_time'},
    {'label': 'Timer', 'icon': 'stopwatch-outline', 'id': 'timer'},
    {'label': 'Approvals', 'icon': 'checkmark-circle-outline', 'id': 'approvals'},
    {'label': 'Reports', 'icon': 'bar-chart-outline', 'id': 'reports'},
    {'label': 'Rates', 'icon': 'cash-outline', 'id': 'rates'},
]
```

## Key Views

- **My Time** — Weekly grid view (Mon-Sun rows, project columns). Quick entry.
- **Timer** — Start/stop timer, auto-creates TimeEntry on stop
- **Approvals** — Manager view: approve/reject employee timesheets
- **Reports** — Hours by project, by client, by employee. Billable vs non-billable ratio.
- **Invoice from time** — Select unbilled entries → generate invoice (calls invoicing module)

## Dependencies

- `projects` (project assignment)
- `tasks` (task-level tracking, optional)
- `customers` (client billing)
- `invoicing` (generate invoices from time)
- `staff` (employee rates)

## Permissions

```
timesheets.view_time_entry
timesheets.add_time_entry
timesheets.change_time_entry
timesheets.approve_timesheet
timesheets.manage_rates
timesheets.view_reports
```
