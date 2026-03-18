# Guía de configuración: Maintenance & SAT

> Configura tu Maintenance & SAT desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una empresa de mantenimiento y servicio técnico en Valencia. Se llama "TecniService Valencia S.L.". Hacemos mantenimiento preventivo y correctivo de instalaciones industriales y de hostelería. Tenemos técnicos con furgoneta y contratos SLA con clientes. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "TecniService Valencia S.L.", dirección "Calle Denia 34, 46006 Valencia", CIF B46890123, teléfono 963 890 123, email sat@tecniservice.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%) para servicios de mantenimiento
- Métodos de pago: transferencia bancaria, domiciliación para contratos
- Empleados:
  - Álvaro Miró (Technician, PIN 1234)
  - Lucía Ferrer (Dispatcher, PIN 5678)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | SLA maintenance contracts with response times and scope |
| customers | Client database with installation history |
| invoicing | Ticket and contract invoicing |
| maintenance | Maintenance orders, repair tickets, and work reports |
| staff | Technician management and scheduling |
| tasks | Task assignment per incident and technician |
| tax | Tax configuration — 21% for maintenance services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Technician | maintenance, field service, tasks, view-only inventory |
| Dispatcher | maintenance, tasks, schedules, customers |

---

## Typical use cases

- Recibir y gestionar tickets de avería con asignación prioritaria a técnico
- Controlar el tiempo de respuesta y resolución según el SLA del contrato
- Planificar mantenimientos preventivos periódicos con notificación automática
- Registrar el informe de trabajo del técnico para facturar la intervención

---

## Notes

Sector servicios — IVA al 21% para servicios de mantenimiento industrial y técnico. Los contratos SLA establecen los niveles de servicio garantizados (tiempo de respuesta, tiempo de resolución) con penalizaciones por incumplimiento. Los informes de trabajo firmados por el cliente son la base para la facturación y sirven como evidencia ante reclamaciones. El stock de furgoneta permite al técnico resolver la mayoría de averías en primera visita.
