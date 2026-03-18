# Setup Guide: Food Workshop / Artisan

> Configure your Food Workshop / Artisan hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo un obrador artesanal de alimentación en La Rioja. Se llama "Conservas Artesanas Rioja". Fabricamos conservas, salsas y mermeladas artesanales para distribución B2B a tiendas delicatessen y restaurantes. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Conservas Artesanas Rioja S.L.", dirección "Polígono Industrial La Portalada, Nave 5, 26006 Logroño", CIF B26345678, teléfono 941 345 678, email produccion@conservasrioja.es
- IVA: 10% no incluido en precios para productos alimenticios elaborados. Materias primas al 4%
- Métodos de pago: transferencia bancaria, domiciliación para clientes habituales
- Empleados:
  - Carmen Ruiz (Production Manager, PIN 1234)
  - Raúl Martínez (Delivery Driver, PIN 5678)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| inventory | Raw material and finished product stock with lot traceability |
| invoicing | B2B invoicing with customer-specific pricing |
| manufacturing | Production orders with recipes (BOM) and batch management |
| purchase_orders | Order raw materials from suppliers |
| quality | Quality control and batch inspections |
| tax | Tax configuration — 10% elaborated foods, 4% basic ingredients |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Production Manager | manufacturing, quality, full inventory |
| Delivery Driver | view-only orders, shipping |

---

## Typical use cases

- Gestionar órdenes de producción con recetas BOM y tamaño de lote
- Registrar la trazabilidad de cada lote desde la materia prima hasta el producto final
- Distribuir a clientes B2B con rutas de reparto y albaranes de entrega
- Emitir facturas consolidadas mensuales a clientes habituales

---

## Notes

Sector alimentación artesanal — IVA al 10% para alimentos elaborados, 4% para materias primas básicas. La trazabilidad de lotes es **obligatoria** (Reglamento CE 178/2002) para poder retirar productos del mercado en caso de alerta sanitaria. El número de registro sanitario del obrador (RGSEAA) debe aparecer en el etiquetado. Los alérgenos deben declararse en la ficha de producto.
