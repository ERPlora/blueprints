# Guía de configuración: Training Center

> Configura tu Training Center desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo un centro de formación profesional en Valencia. Se llama "Centro FP Avanza". Impartimos cursos de formación para el empleo, certificados de profesionalidad y formación para empresas. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Centro FP Avanza S.L.", dirección "Calle Játiva 34, 46002 Valencia", CIF B46456789, teléfono 963 456 789, email info@fpavanza.es
- IVA: exento para formación para el empleo acreditada. 21% para formación no acreditada
- Métodos de pago: transferencia bancaria, bonificación FUNDAE, tarjeta
- Empleados:
  - Patricia Molina (Instructor, PIN 1234)
  - Roberto Camps (Admin, PIN 5678)

- Cursos:
  - Atención al cliente (60h, 280€)
  - Excel avanzado (20h, 150€)
  - Técnico en contabilidad (120h, 450€)
  - Inglés de negocios B2 (80h, 320€)
  - Gestión del tiempo (8h, 95€)
  - Formación bonificada para empresas (precio a medida)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| course_mgmt | Course catalog with hours, content, and certifications |
| invoicing | Student, company, and FUNDAE invoicing |
| schedules | Class timetable and room management |
| staff | Instructor management with subject assignments |
| student_mgmt | Student enrollment, attendance, and certification |
| tax | Tax configuration — exempt accredited, 21% non-accredited |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Instructor | view-only courses, view-only students, attendance |
| Admin | full student management, courses, schedules, invoicing |

---

## Typical use cases

- Gestionar la matrícula de alumnos en cursos con control de plazas disponibles
- Registrar la asistencia diaria para cumplir los requisitos mínimos de los certificados
- Facturar a empresas con bonificación FUNDAE con la documentación requerida
- Emitir certificados de aprovechamiento al completar el curso con asistencia mínima

---

## Notes

Sector educación — la formación para el empleo con certificado de profesionalidad puede estar **exenta de IVA** si el centro está acreditado por SEPE o la Comunidad Autónoma. La formación bonificada para empresas a través de FUNDAE requiere comunicar el inicio de la acción formativa con antelación y llevar un registro de asistencia. Los certificados de profesionalidad son títulos oficiales del SEPE. La asistencia mínima exigida varía según el certificado (generalmente 75-80%).
