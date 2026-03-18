# Setup Guide: School / Academy

> Configure your School / Academy hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una academia de idiomas en Granada. Se llama "Academia Oxford Languages". Impartimos inglés, francés y alemán en grupos y clases particulares. Tenemos alumnos de diferentes edades y varios profesores. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Academia Oxford Languages S.L.", dirección "Gran Vía de Colón 23, 18001 Granada", CIF B18901234, teléfono 958 901 234, email info@oxfordlanguages.es
- IVA: exento de IVA para formación reglada. 21% para materiales y libros de texto
- Métodos de pago: domiciliación bancaria mensual, tarjeta, transferencia
- Empleados:
  - Sophie Martin (Teacher, PIN 1234)
  - Carlos Jiménez (Admin, PIN 5678)

- Cursos:
  - Inglés A1 (mensualidad 80€)
  - Inglés B2 (mensualidad 85€)
  - Inglés C1 (mensualidad 90€)
  - Francés A1 (mensualidad 80€)
  - Clase particular 1h (35€)
  - Matrícula anual (30€)
  - Examen oficial Cambridge (95€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| attendance | Daily attendance tracking per class and student |
| course_mgmt | Course catalog with levels, schedules, and content |
| invoicing | Monthly tuition billing and enrollment invoicing |
| schedules | Class timetable management |
| staff | Teacher management with subject assignments |
| student_mgmt | Student enrollment with level assessment and progress |
| tax | Tax configuration — exempt education, 21% materials |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Teacher | view-only courses, view-only students, attendance, view-only schedules |
| Admin | full student management, courses, schedules, invoicing, attendance |

---

## Typical use cases

- Gestionar la matrícula de alumnos con evaluación de nivel inicial
- Controlar la asistencia diaria por clase y generar informes para padres/alumnos
- Emitir mensualidades por domiciliación con aviso de impago automático
- Gestionar los horarios de clases para evitar solapamientos de profesores y aulas

---

## Notes

Sector educación — la formación en idiomas puede estar **exenta de IVA** si se imparte en centros reconocidos por la administración o si tiene validez oficial. Los materiales didácticos (libros) tributan al 4% (libros físicos) o 21% (acceso digital). La asistencia regular es condición para presentarse a los exámenes oficiales (Cambridge, DELF). La domiciliación bancaria mensual simplifica la gestión de cobros con muchos alumnos.
