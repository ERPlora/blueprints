# Setup Guide: Consulting / Advisory

> Configure your Consulting / Advisory hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una consultoría de negocio en Madrid. Se llama "NextStep Consulting S.L.". Ofrecemos consultoría estratégica, transformación digital y gestión del cambio a empresas medianas. Facturamos por horas y proyectos. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "NextStep Consulting S.L.", dirección "Calle Serrano 45, 4ª planta, 28001 Madrid", CIF B28789012, teléfono 915 789 012, email info@nextstepconsulting.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%) para servicios de consultoría
- Métodos de pago: transferencia bancaria, domiciliación
- Empleados:
  - Patricia Álvarez (Consultant, PIN 1234)
  - Rodrigo Fernández (Manager, PIN 5678)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | Service contracts and retainer agreements with clients |
| customers | Client CRM with contact history and pipeline |
| invoicing | Issue invoices — hourly, fixed fee, or milestone-based |
| projects | Project management with phases and deliverables |
| tasks | Task tracking per project and consultant |
| tax | Tax configuration — 21% for consulting services |
| time_control | Timesheet to record hours per project and consultant |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Consultant | projects, tasks, time tracking, view-only customers |
| Manager | projects, customers, invoicing, contracts, view reports |

---

## Typical use cases

- Registrar horas trabajadas por proyecto y consultor para facturación por tiempo
- Gestionar contratos de retainer mensual con horas incluidas y excedentes
- Crear proyectos con fases y entregables con seguimiento de progreso
- Generar informes de rentabilidad por cliente y proyecto

---

## Notes

Sector servicios profesionales — IVA al 21% no incluido (B2B). La facturación por horas requiere un timesheet preciso para justificar los importes ante el cliente. Los contratos de retainer son acuerdos de disponibilidad mensual con un número de horas incluidas. Los informes de rentabilidad permiten detectar proyectos con escaso margen o clientes con exceso de demanda de soporte.
