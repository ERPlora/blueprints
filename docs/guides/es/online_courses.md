# Guía de configuración: Online Courses

> Configura tu Online Courses desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una plataforma de cursos online en Valencia. Se llama "AulaNet Formación". Ofrecemos cursos de marketing digital, programación y diseño gráfico en formato online. Los alumnos pueden acceder con suscripción mensual o comprando cursos individuales. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "AulaNet Formación S.L.", dirección "Calle Colón 34, 46004 Valencia", CIF B46012345, teléfono 961 012 345, email hola@aulanetformacion.es
- IVA: 21% incluido en precios. Clases: IVA general (21%) para formación no reglada online
- Métodos de pago: tarjeta, PayPal, Stripe
- Empleados:
  - David Soria (Instructor, PIN 1234)
  - Marina Pérez (Admin, PIN 5678)

- Cursos/servicios:
  - Marketing Digital para emprendedores (149€)
  - Python para no programadores (199€)
  - Diseño con Canva Pro (79€)
  - Suscripción mensual (acceso total) (29€/mes)
  - Pack 3 cursos (329€)
  - Certificado de aprovechamiento (incluido)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| course_mgmt | Course creation with modules, lessons, and content |
| invoicing | Student and subscription invoicing |
| student_mgmt | Student enrollment, progress tracking, and certifications |
| subscriptions | Recurring subscription plan management |
| tax | Tax configuration — 21% for non-regulated online training |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Instructor | course management, view-only students |
| Admin | full student management, courses, invoicing, view analytics |

---

## Typical use cases

- Crear cursos con módulos, lecciones y quizzes de evaluación
- Gestionar el acceso de alumnos suscritos y el progreso de cada uno
- Emitir certificados de aprovechamiento al completar el curso
- Gestionar suscripciones mensuales con cobro automático recurrente

---

## Notes

Sector educación — IVA al 21% para formación online no reglada (cursos de habilidades sin titulación oficial). Si los cursos están acreditados como formación para el empleo o tienen certificación oficial, pueden estar exentos de IVA. Las suscripciones se gestionan con el módulo `subscriptions` con cobro automático mensual o anual. Los certificados deben incluir el número de horas y el contenido para ser válidos en el currículum del alumno.
