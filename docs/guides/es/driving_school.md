# Setup Guide: Driving School

> Configure your Driving School hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una autoescuela en Valladolid. Se llama "Autoescuela Castilla". Impartimos clases teóricas y prácticas para carné B y A. Gestionamos el calendario de alumnos, los exámenes de la DGT y la flota de vehículos de prácticas. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Autoescuela Castilla", dirección "Calle Santiago 56, 47001 Valladolid", CIF B47567890, teléfono 983 567 890, email info@autoescuelacastilla.es
- IVA: exento de IVA para clases de conducción. Tasas DGT fuera de IVA
- Métodos de pago: efectivo, transferencia bancaria, financiación
- Empleados:
  - Álvaro Gómez (Driving Instructor, PIN 1234)
  - Beatriz López (Admin, PIN 5678)

- Servicios:
  - Carné B completo (700€)
  - Clase práctica suelta (35€)
  - Matrícula examen teórico (95€)
  - Matrícula examen práctico (120€)
  - Carné A (moto) completo (400€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Practical lesson scheduling per instructor and vehicle |
| fleet | Driving school vehicle fleet with maintenance tracking |
| invoicing | Student invoicing with package and installment billing |
| schedules | Instructor and classroom scheduling |
| student_mgmt | Student records with exam history and progress tracking |
| tax | Tax configuration — exempt driving education |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Driving Instructor | view schedules, view students, appointments, view-only fleet |
| Admin | full student management, schedules, fleet, invoicing |

---

## Typical use cases

- Gestionar el progreso de cada alumno: horas teóricas, horas prácticas, intentos de examen
- Programar clases prácticas por instructor con asignación de vehículo
- Controlar las revisiones ITV y mantenimiento de los vehículos de prácticas
- Facturar el carné completo o clases sueltas según modalidad del alumno

---

## Notes

Sector educación — las clases de conducción están **exentas de IVA** cuando tienen por objeto la obtención del carné de conducir. Las tasas de la DGT (exámenes) no llevan IVA ya que son tasas administrativas. El seguimiento del número de horas de prácticas es obligatorio para la presentación al examen. Los instructores deben tener la habilitación de profesor de formación vial vigente.
