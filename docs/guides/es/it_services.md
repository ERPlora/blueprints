# Guía de configuración: IT Services

> Configura tu IT Services desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una empresa de servicios informáticos en Madrid. Se llama "BinarySoft Solutions S.L.". Gestionamos la IT de empresas: soporte helpdesk, contratos de mantenimiento, proyectos de implantación y desarrollo a medida. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "BinarySoft Solutions S.L.", dirección "Calle Fuencarral 123, 3ª planta, 28010 Madrid", CIF B28012345, teléfono 916 012 345, email hola@binarysoft.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%) para servicios IT
- Métodos de pago: transferencia bancaria, domiciliación mensual
- Empleados:
  - Tomás Rivera (Technician, PIN 1234)
  - Elena Vidal (Project Manager, PIN 5678)
  - Marcos Ortiz (Sales Representative, PIN 9012)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | SLA contracts and maintenance agreements |
| customers | Client database with IT infrastructure notes |
| invoicing | Monthly maintenance billing and project invoicing |
| projects | IT project management with phases and deliverables |
| support | Helpdesk ticket management with SLA tracking |
| tasks | Task assignment per technician and project |
| tax | Tax configuration — 21% for IT services |
| time_control | Timesheet for billable hours per client |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Technician | support tickets, tasks, time tracking |
| Project Manager | projects, tasks, view-only customers, time tracking |
| Sales Representative | quotes, customers, contracts, view-only invoicing |

---

## Typical use cases

- Gestionar tickets de soporte con SLA, prioridad y tiempo de resolución
- Controlar horas trabajadas por cliente para facturación precisa
- Gestionar proyectos de implantación con fases y entregables
- Emitir facturas mensuales de mantenimiento con detalle de incidencias

---

## Notes

Sector servicios profesionales — IVA al 21% para servicios IT. Los contratos SLA definen el tiempo de respuesta y resolución de incidencias (ej. P1: 2h respuesta, 4h resolución). El timesheet es imprescindible para justificar la facturación por horas. Las licencias de software gestionadas para el cliente deben inventariarse para controlar renovaciones. La facturación recurrente de mantenimientos se automatiza con el módulo `contracts`.
