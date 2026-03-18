# Setup Guide: Marketing Agency

> Configure your Marketing Agency hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una agencia de marketing digital en Barcelona. Se llama "Pixel & Brand Agency". Hacemos estrategia digital, gestión de redes sociales, campañas de publicidad y diseño para marcas medianas. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Pixel & Brand Agency S.L.", dirección "Carrer del Consell de Cent 345, 08007 Barcelona", CIF B08234567, teléfono 936 234 567, email hola@pixelbrand.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%) para servicios de marketing
- Métodos de pago: transferencia bancaria
- Empleados:
  - Lucía Valls (Account Manager, PIN 1234)
  - Marc Ferrer (Creative, PIN 5678)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database with brand briefs and history |
| invoicing | Monthly retainer and project-based invoicing |
| projects | Creative project management with briefings and deliverables |
| tasks | Task assignment per creative and account manager |
| tax | Tax configuration — 21% for marketing services |
| time_control | Timesheet for billable hours per client |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Account Manager | projects, customers, tasks, view-only campaigns |
| Creative | view-only projects, tasks, time tracking |

---

## Typical use cases

- Gestionar proyectos creativos con briefing del cliente, tareas y fechas de entrega
- Controlar las horas dedicadas a cada cliente para detectar rentabilidad real
- Facturar retainers mensuales de gestión de redes o campañas recurrentes
- Gestionar colaboradores freelance con órdenes de compra y facturas externas

---

## Notes

Sector servicios profesionales — IVA al 21%. Los retainers mensuales (tarifa fija mensual por servicios continuos) son el modelo de facturación más habitual en agencias. El control de horas permite detectar cuándo un cliente consume más recursos de los incluidos en el retainer. Los briefings de proyecto deben aprobarse por el cliente antes de iniciar la producción para evitar revisiones ilimitadas.
