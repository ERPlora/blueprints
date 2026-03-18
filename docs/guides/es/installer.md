# Guía de configuración: Installer (Plumbing, Electric, HVAC)

> Configura tu Installer desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una empresa de instalaciones en Murcia. Se llama "Instalaciones TechClima". Hacemos instalaciones y mantenimiento de climatización, fontanería y electricidad. Trabajamos para particulares y comunidades de vecinos con contratos de mantenimiento. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Instalaciones TechClima S.L.", dirección "Polígono Industrial El Palmar, Calle Industria 8, 30120 Murcia", CIF B30678901, teléfono 968 678 901, email info@techclima.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%) servicios e instalaciones
- Métodos de pago: transferencia bancaria, domiciliación para mantenimientos
- Empleados:
  - Eduardo Pérez (Installer, PIN 1234)
  - Raquel Navarro (Manager, PIN 5678)

- Servicios:
  - Instalación aire acondicionado split (350€)
  - Mantenimiento anual AC (89€)
  - Revisión fontanería (55€)
  - Instalación caldera (280€)
  - Revisión eléctrica (65€)
  - Presupuesto gratuito (0€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database with installation records |
| inventory | Parts, filters, and supplies stock per van and warehouse |
| invoicing | On-site and office invoicing |
| quotes | Detailed installation quotes with labor and materials |
| staff | Installer assignment and schedule management |
| tasks | Work order management with site details |
| tax | Tax configuration — 21% for installations |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Installer | tasks, field service, view-only inventory |
| Manager | quotes, customers, invoicing, view-only staff |

---

## Typical use cases

- Crear presupuestos de instalación con desglose de materiales y mano de obra
- Asignar órdenes de trabajo a instaladores con la dirección y descripción del trabajo
- Gestionar contratos de mantenimiento anual con facturación recurrente
- Controlar el stock de material en furgoneta de cada instalador

---

## Notes

Sector instalaciones — IVA al 21% para servicios de instalación. El certificado de instalación es obligatorio para algunas instalaciones (electricidad, gas). Los contratos de mantenimiento preventivo generan ingresos recurrentes estables. Los instaladores con carné habilitante (fontanería, electricidad, gas) deben tener la documentación vigente. El stock de furgoneta permite facturar materiales directamente desde el campo.
