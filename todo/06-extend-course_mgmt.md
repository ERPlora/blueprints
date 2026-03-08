# Extend: course_mgmt → Full Education Support

**Status:** To extend
**Priority:** HIGH
**Sectors:** Education (academy, driving_school, music_school, dance_school, language_school)

## Current State

Models: `Course`, `ClassSession` — basic catalog and scheduling.

## What to Add

### Models

```python
class CourseLevel(models.Model):
    """Level/grade within a course (e.g., CEFR A1, A2, B1)."""
    course = models.ForeignKey(Course)
    name = models.CharField()                        # "A1 Beginner"
    order = models.IntegerField()
    min_hours = models.IntegerField(null=True)       # Required hours to complete
    prerequisites = models.ManyToManyField('self', blank=True)

class ClassEnrollment(models.Model):
    """Student enrollment in a specific class session."""
    class_session = models.ForeignKey(ClassSession)
    student = models.ForeignKey('student_mgmt.Student')
    status = models.CharField(choices=[
        ('enrolled', 'Enrolled'),
        ('waitlist', 'Waitlisted'),
        ('cancelled', 'Cancelled'),
        ('completed', 'Completed'),
    ])
    attendance = models.CharField(choices=[
        ('pending', 'Pending'),
        ('present', 'Present'),
        ('absent', 'Absent'),
        ('makeup', 'Makeup Class'),
    ], default='pending')

class Exam(models.Model):
    """Exam or evaluation."""
    course = models.ForeignKey(Course)
    level = models.ForeignKey(CourseLevel, null=True)
    name = models.CharField()
    date = models.DateTimeField()
    max_score = models.DecimalField(default=10)
    pass_score = models.DecimalField(default=5)

class ExamResult(models.Model):
    """Student exam result."""
    exam = models.ForeignKey(Exam)
    student = models.ForeignKey('student_mgmt.Student')
    score = models.DecimalField(null=True)
    passed = models.BooleanField(default=False)
    notes = models.TextField(blank=True)

class PracticeLog(models.Model):
    """Practice hours (driving school: mandatory hours tracking)."""
    student = models.ForeignKey('student_mgmt.Student')
    course = models.ForeignKey(Course)
    instructor = models.ForeignKey('accounts.LocalUser')
    date = models.DateField()
    duration = models.DurationField()
    practice_type = models.CharField()               # "road", "maneuvers", "highway"
    notes = models.TextField(blank=True)
    signed = models.BooleanField(default=False)      # Student confirmed
```

### Extend ClassSession

```python
# Add to existing ClassSession:
capacity = models.IntegerField(null=True)            # Max students
instructor = models.ForeignKey('accounts.LocalUser', null=True)
room = models.CharField(blank=True)                  # "Aula 3", "Pista 2"
is_makeup = models.BooleanField(default=False)       # Replacement class
level = models.ForeignKey(CourseLevel, null=True)
```

### New Views

- **Class roster** — Attendance list per session with bulk mark
- **Level progression** — Student level history, prerequisites check
- **Exams** — Schedule, results entry, pass/fail
- **Practice log** — Per student: hours logged, instructor, type (driving_school)
- **Certificate generation** — From doc_templates when level completed
- **Capacity alerts** — When class reaches limit, auto-waitlist

## Dependencies

- `student_mgmt` (Student model)
- `schedules` (room/instructor scheduling)
- `doc_templates` (certificate generation)
- `invoicing` (course fee billing)
