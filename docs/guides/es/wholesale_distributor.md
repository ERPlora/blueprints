# Setup Guide: Wholesale Distributor

> Configure your Wholesale Distributor hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una empresa distribuidora mayorista en Alicante. Se llama "Distribuidora Mediterráneo S.L.". Distribuimos productos de alimentación y droguería a bares, restaurantes y supermercados. Tenemos almacén propio y flota de reparto. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Distribuidora Mediterráneo S.L.", dirección "Polígono Industrial Babel, Nave 8, 03006 Alicante", CIF B03456789, teléfono 965 456 789, email pedidos@distribumediterraneo.es
- IVA: 10% para alimentación elaborada, 4% para básicos. No incluido en precios (B2B)
- Métodos de pago: domiciliación bancaria, transferencia bancaria
- Empleados:
  - Paco Carbonell (Sales Representative, PIN 1234)
  - Salud Martínez (Warehouse Worker, PIN 5678)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | B2B client database with individual price lists |
| inventory | Warehouse stock with minimum reorder levels |
| invoicing | Grouped invoicing and delivery notes management |
| purchase_orders | Supplier purchasing and stock replenishment |
| sales | Order taking and sales management with client tariffs |
| tax | Tax configuration — multiple rates for food distribution |
| warehouse | Warehouse management with location tracking |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Sales Representative | customers, quotes, view-only invoicing, view-only inventory |
| Warehouse Worker | full inventory, warehouse, shipping |

---

## Typical use cases

- Gestionar listas de precios individuales por cliente según volumen de compra
- Recibir pedidos de clientes por teléfono o portal online y preparar albarán de entrega
- Optimizar las rutas de reparto para reducir costes de distribución
- Emitir facturas consolidadas semanales o mensuales a cada cliente

---

## Notes

Sector distribución mayorista B2B — IVA no incluido en precios. Los distribuidores mayoristas de alimentación aplican los tipos de IVA de los productos (4% y 10% para alimentos). Los clientes B2B tienen tarifas diferenciadas según volumen, exclusividad o tipo de negocio. Las facturas consolidadas (agrupando varios albaranes) simplifican la gestión del cliente. El descuento por pronto pago es habitual en el sector (2% si paga en 10 días).
