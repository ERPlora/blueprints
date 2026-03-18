# Setup Guide: Bakery / Pastry Shop

> Configure your Bakery / Pastry Shop hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una panadería y pastelería artesanal en Sevilla. Se llama "La Miga Dorada". Elaboramos pan artesanal, bollería y tartas por encargo. Tenemos obrador propio y vendemos en tienda. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "La Miga Dorada", dirección "Calle Feria 34, 41003 Sevilla", CIF B41234567, teléfono 954 234 567, email lamigadorada@gmail.com
- IVA: incluido en precios. Clases: pan y bollería básica al 4% (IVA superreducido), pasteles y tartas al 10% (IVA reducido)
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Antonio Ruiz (Baker, PIN 1234)

- Productos:
  - Barra de pan (1,20€)
  - Pan de hogaza 1kg (3,50€)
  - Croissant mantequilla (1,80€)
  - Napolitana chocolate (2,00€)
  - Tarta de manzana (18,00€ entera)
  - Bizcocho casero (12,00€)
  - Rosca de anís (6,00€)
  - Palmera chocolate (1,50€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS and cash management for counter sales |
| customers | Customer database for orders, loyalty and wholesale clients |
| inventory | Ingredient stock control with expiry date tracking |
| invoicing | Issue invoices for wholesale clients and special orders |
| sales | Record daily retail sales at the counter |
| tax | Multiple tax rates — 4% basic bread, 10% pastries |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Baker | manufacturing orders, full inventory management |

---

## Typical use cases

- Planificar la producción diaria de pan y bollería según estimaciones de venta
- Gestionar encargos de tartas y pasteles personalizados con fecha de entrega
- Controlar el stock de ingredientes y fechas de caducidad
- Llevar la caja diaria con diferentes tipos de IVA por producto

---

## Notes

Sector alimentación — tipos de IVA múltiples: pan y productos de panadería básica al 4% (IVA superreducido), bollería y pastelería al 10% (IVA reducido). Es importante configurar correctamente cada producto con su tipo impositivo. Los pedidos por encargo (tartas personalizadas) deben registrarse con anticipación para planificar la producción. El módulo de inventario permite rastrear lotes de ingredientes y sus fechas de caducidad.
