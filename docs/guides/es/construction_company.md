# Setup Guide: Construction Company

> Configure your Construction Company hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una empresa constructora en Córdoba. Se llama "Construcciones Guadalquivir S.L.". Hacemos obra civil, rehabilitación de edificios y construcción de viviendas. Gestionamos proyectos con subcontratas, certificaciones de obra y control de costes. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Construcciones Guadalquivir S.L.", dirección "Polígono Industrial Las Quemadas, Nave 12, 14014 Córdoba", CIF B14567890, teléfono 957 345 678, email info@construccionesguadalquivir.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%), IVA reducido (10%) para rehabilitación de vivienda habitual
- Métodos de pago: transferencia bancaria, certificaciones de obra
- Empleados:
  - Francisco Pérez (Project Manager, PIN 1234)
  - Manuel Jiménez (Site Manager, PIN 5678)
  - Dolores Sánchez (Sales Representative, PIN 9012)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database for property developers and private clients |
| expenses | Track costs per project: materials, subcontractors, equipment |
| invoicing | Issue certifications and final project invoices |
| projects | Project management with phases, milestones, and budget tracking |
| purchase_orders | Purchase orders for materials and subcontractor services |
| quotes | Detailed project quotes with scope, materials, and labor |
| staff | Staff assignments to projects with role tracking |
| tasks | Task management per project phase and worker |
| tax | Tax configuration — 21% general, 10% residential rehabilitation |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Project Manager | projects, tasks, quotes, view-only purchase orders |
| Site Manager | view projects, tasks, view-only inventory and staff |
| Sales Representative | quotes, customers, view-only invoicing |

---

## Typical use cases

- Gestionar proyectos de obra con fases, hitos y control de costes en tiempo real
- Emitir certificaciones de obra mensuales según avance de la construcción
- Controlar subcontratas con pedidos de compra y validación de facturas
- Seguimiento del margen de cada obra comparando presupuesto vs. coste real

---

## Notes

Sector construcción — IVA al 21% en obra nueva; IVA al 10% en rehabilitación de vivienda habitual (cuando el cliente es el propietario y la vivienda lleva más de 2 años construida). La Inversión del Sujeto Pasivo (ISP) puede aplicarse en determinadas obras entre empresas. Las certificaciones de obra son documentos legales que acreditan el avance y dan derecho al cobro.
