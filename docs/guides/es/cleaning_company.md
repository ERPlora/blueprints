# Guía de configuración: Cleaning Company

> Configura tu Cleaning Company desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una empresa de limpieza en Murcia. Se llama "Limpiezas Levante S.L.". Hacemos limpieza de oficinas, comunidades y locales comerciales con contratos periódicos. Tenemos equipos de limpieza con rutas asignadas. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Limpiezas Levante S.L.", dirección "Calle Mayor 45, 30002 Murcia", CIF B30345678, teléfono 968 234 567, email info@limpiezaslevante.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%) para servicios de limpieza
- Métodos de pago: domiciliación bancaria, transferencia bancaria
- Empleados:
  - Isabel Martínez (Team Leader, PIN 1234)
  - Pedro González (Manager, PIN 5678)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | Recurring service contracts with billing period and scope |
| customers | Client database for offices, communities, and commercial clients |
| invoicing | Monthly recurring invoicing per contract |
| schedules | Team scheduling with route assignments and shift management |
| staff | Staff management with availability and assignments |
| tax | Tax configuration — 21% for cleaning services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Team Leader | tasks, view-only schedules, field service |
| Manager | contracts, customers, invoicing, view-only staff, full schedules |

---

## Typical use cases

- Gestionar contratos de limpieza periódica con facturación mensual automática
- Asignar rutas de equipos por zonas y clientes con horario semanal
- Registrar los materiales de limpieza consumidos en cada cliente
- Controlar la satisfacción del cliente con checklists post-servicio

---

## Notes

Sector servicios — IVA al 21% para servicios de limpieza. Los contratos recurrentes permiten facturación automática mensual sin tener que crear cada factura manualmente. Los checklists de limpieza por cliente garantizan la calidad del servicio y sirven como evidencia ante reclamaciones. El módulo `schedules` permite optimizar las rutas de los equipos para minimizar desplazamientos.
