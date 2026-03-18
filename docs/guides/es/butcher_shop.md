# Setup Guide: Butcher Shop

> Configure your Butcher Shop hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una carnicería en Burgos. Se llama "Carnicería La Madrileña". Vendemos carne fresca, embutidos y productos elaborados. Tenemos báscula y hacemos trazabilidad de lotes obligatoria. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Carnicería La Madrileña", dirección "Plaza Mayor 12, 09003 Burgos", CIF B09345678, teléfono 947 123 456, email lamadrileña@carniceria.es
- IVA: 10% incluido en precios. Clases: IVA reducido (10%) para carne fresca y elaborados cárnicos
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Fernando Gómez (Manager, PIN 1234)

- Productos:
  - Ternera filetes (€/kg — 18,00€/kg)
  - Cerdo chuletas (€/kg — 8,50€/kg)
  - Pollo entero (€/kg — 3,90€/kg)
  - Cordero pierna (€/kg — 12,00€/kg)
  - Chorizo fresco (€/kg — 7,50€/kg)
  - Morcilla (€/unidad — 3,50€)
  - Hamburguesa casera (€/unidad — 1,80€)
  - Albóndigas (€/kg — 9,00€/kg)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with scale integration and weight-based pricing |
| inventory | Stock with mandatory lot/batch traceability |
| invoicing | Issue invoices for wholesale clients and restaurants |
| sales | Counter sales with weight pricing and per-unit items |
| tax | Tax configuration — 10% IVA reducido for meat products |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Vender productos por peso con integración de báscula en el TPV
- Registrar los lotes de carne con número de animal y origen para trazabilidad legal
- Gestionar la fecha de caducidad de productos elaborados
- Emitir facturas a hostelería y restaurantes que compran al por mayor

---

## Notes

Sector retail alimentario — IVA al 10% (IVA reducido) para carne fresca y elaborados cárnicos. La trazabilidad de lotes es **obligatoria por ley** en carnicerías (Reglamento CE 853/2004). Cada pieza debe poder rastrearse al animal de origen. Los productos elaborados (hamburguesas, albóndigas) también requieren información de alérgenos visible en el etiquetado. La báscula debe estar homologada.
