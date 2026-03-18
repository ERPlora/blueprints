# Setup Guide: Accounting Firm

> Configure your Accounting Firm hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una asesoría contable en Barcelona. Se llama "Gestoría Martínez & Asociados". Ofrecemos servicios de contabilidad, fiscalidad y asesoría fiscal a particulares y empresas. Llevamos la contabilidad de clientes, presentamos impuestos y hacemos la declaración de la renta. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Gestoría Martínez & Asociados", dirección "Calle Aragón 245, 08007 Barcelona", CIF B12345678, teléfono 932 456 789, email info@gestoriamartinez.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%), servicios profesionales
- Métodos de pago: transferencia bancaria, domiciliación bancaria, tarjeta
- Empleados:
  - Carlos Martínez (Contable, PIN 1234)
  - Laura Sánchez (Contable, PIN 5678)
  - Marta López (Manager, PIN 9012)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | Manage service contracts and retainer agreements with clients |
| customers | Client database with contact info, CIF, and multi-client management |
| invoicing | Issue invoices and credit notes to clients |
| projects | Track work per client including deadlines and deliverables |
| tasks | Task management for fiscal calendar deadlines and to-dos |
| tax | Tax configuration — IVA rates, fiscal classes, quarterly returns |
| time_control | Timesheet to record hours worked per client for billing |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Accountant | projects, tasks, time tracking, view-only customers, document templates |
| Manager | projects, customers, invoicing, contracts, view reports |

---

## Typical use cases

- Registrar horas trabajadas por cliente y facturar mensualmente según tiempo dedicado
- Gestionar el calendario fiscal (IVA trimestral, IS, IRPF, modelo 303, 347...)
- Crear facturas a clientes con las condiciones del contrato de asesoría
- Controlar el avance de los proyectos y tareas por cliente

---

## Notes

Sector de servicios profesionales — IVA al 21% no incluido en precio (B2B). Las asesorías suelen trabajar con tarifas fijas mensuales por cliente, facturación al mes. El módulo `time_control` permite registrar las horas reales para detectar clientes con más coste del esperado. El módulo `tax` es esencial para la gestión de las obligaciones fiscales de la propia gestoría.
