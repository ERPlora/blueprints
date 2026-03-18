# Guía de configuración: Driving School

> Configura tu Driving School desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una autoescuela en Valladolid. Se llama "Autoescuela Castilla". Impartimos clases teóricas y prácticas para carné B y A. Gestionamos el calendario de alumnos, los exámenes de la DGT y la flota de vehículos de prácticas. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

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
