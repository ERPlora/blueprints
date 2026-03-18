# Setup Guide: Car Dealership

> Configure your Car Dealership hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo un concesionario de coches en Alicante. Se llama "Automóviles Costa Blanca S.L.". Vendemos vehículos nuevos y de ocasión, gestionamos financiaciones, pruebas de conducción y el taller de postventa. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Automóviles Costa Blanca S.L.", dirección "Avenida de la Estación 78, 03005 Alicante", CIF B03456789, teléfono 965 345 678, email ventas@costablancaautos.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%) vehículos nuevos, IVA segunda mano (régimen especial bienes usados)
- Métodos de pago: transferencia bancaria, financiación externa, contado
- Empleados:
  - Roberto Sánchez (Sales Representative, PIN 1234)
  - Luis Martínez (Mechanic, PIN 5678)
  - Amparo Torres (Manager, PIN 9012)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Deposits and payments at the showroom |
| customers | Customer database with purchase history and financing details |
| inventory | Vehicle stock management with VIN, features, and pricing |
| invoicing | Issue vehicle purchase invoices and service invoices |
| quotes | Create and send vehicle quotes with options and financing |
| sales | Record vehicle sales and commission tracking |
| tax | Tax configuration — 21% for new vehicles, REBU for used |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Sales Representative | sales, customers, quotes, view-only inventory |
| Mechanic | maintenance, view-only inventory |
| Manager | sales, customers, invoicing, full inventory, view reports |

---

## Typical use cases

- Gestionar el stock de vehículos nuevos y de ocasión con características completas
- Crear presupuestos de vehículo con diferentes opciones de financiación
- Registrar pruebas de conducción y seguimiento de clientes potenciales
- Gestionar el taller de postventa con órdenes de reparación

---

## Notes

Sector automoción — IVA al 21% para vehículos nuevos. Los vehículos de segunda mano pueden acogerse al Régimen Especial de Bienes Usados (REBU) donde el IVA solo se aplica sobre el margen del concesionario. La venta de vehículos requiere contrato de compraventa. El informe de fabricante (reporting al importador) se genera con los datos de ventas mensuales.
