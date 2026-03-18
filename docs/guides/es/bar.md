# Guía de configuración: Bar

> Configura tu Bar desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo un bar en Valencia. Se llama "Bar El Rincón". Servimos bebidas, tapas y pinchos, con barra y mesas. Abrimos de mañana a noche. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Bar El Rincón", dirección "Calle del Mercado 8, 46001 Valencia", CIF B46123456, teléfono 963 123 456, email barelrincon@gmail.com
- IVA: 10% incluido en precios. Clases: IVA reducido (10%) bebidas y alimentos preparados
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Miguel Torres (Bartender, PIN 1234)
  - Carmen Vidal (Waiter, PIN 5678)
- Productos:
  - Caña (1,50€)
  - Refresco (2,00€)
  - Agua (1,20€)
  - Café solo (1,20€)
  - Combinado (5,50€)
  - Tapa de patatas bravas (2,50€)
  - Pincho de tortilla (2,00€)
  - Bocadillo de jamón (4,50€)
- Zonas y mesas: Terraza (8 mesas), Interior (6 mesas), Barra (sin número)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS cash drawer management and daily Z closing |
| customers | Customer database for loyalty and regular clients |
| inventory | Stock control for drinks, ingredients, and bar supplies |
| invoicing | Issue invoices and simplified receipts (tickets) |
| orders | Order management per table and bar counter |
| sales | Record transactions and manage open tabs |
| tables | Table map with zones, status tracking (free/occupied) |
| tax | Tax configuration — 10% IVA reducido for food and drinks |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Bartender | sales, cash register, tables, view-only inventory |
| Waiter | sales, tables, orders |

---

## Typical use cases

- Abrir comandas por mesa y añadir consumiciones durante el servicio
- Cerrar cuentas por mesa con cobro en efectivo o tarjeta
- Gestionar la barra con cobro inmediato por consumición
- Controlar el stock de bebidas y hacer pedidos al proveedor

---

## Notes

Sector hostelería — IVA al 10% (IVA reducido) para bebidas y alimentos preparados servidos en bar. El alcohol destilado (combinados) también aplica el 10% al ser consumo en hostelería. Las comandas de barra y mesa son independientes. Se recomienda configurar la impresora de cocina si se sirven tapas calientes para que lleguen los pedidos directamente.
