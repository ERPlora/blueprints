# Setup Guide: Restaurant

> Configure your Restaurant hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo un restaurante en Madrid. Se llama "Restaurante La Taberna del Rey". Ofrecemos cocina española tradicional con menú del día y carta. Tenemos sala, barra, terraza y también aceptamos reservas. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Restaurante La Taberna del Rey S.L.", dirección "Calle Mayor 34, 28013 Madrid", CIF B28901234, teléfono 913 901 234, email reservas@tabernadelrey.es
- IVA: 10% incluido en precios. Clases: IVA reducido (10%) para restauración
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Pedro Sánchez (Chef, PIN 1234)
  - María González (Waiter, PIN 5678)
  - Luis Martín (Cashier, PIN 9012)
- Productos:
  - Menú del día (14€)
  - Gazpacho (5€)
  - Croquetas de jamón x3 (8€)
  - Cocido madrileño (14€)
  - Entrecot a la plancha (18€)
  - Flan casero (4€)
  - Agua 1L (2,50€)
  - Vino de la casa (copa) (3,50€)
- Zonas y mesas: Sala interior (12 mesas), Barra (sin número), Terraza (8 mesas)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with table billing and payment splitting |
| customers | Customer database for reservations and loyalty |
| inventory | Ingredient and beverage stock management |
| invoicing | Issue restaurant tickets and invoices |
| kitchen | Kitchen Display System (KDS) for chef screen |
| orders | Table order management with multi-course tracking |
| reservations | Table reservation management |
| sales | Table, bar, and takeaway sales |
| tables | Table map with zones and status management |
| tax | Tax configuration — 10% reducido |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Chef | kitchen display, view-only orders, view-only inventory |
| Waiter | sales, tables, orders, view-only reservations |
| Cashier | sales, cash register, view-only orders |

---

## Typical use cases

- Abrir comandas por mesa con los platos por pase (entrante, principal, postre)
- Enviar los pedidos automáticamente a la pantalla de cocina
- Gestionar las reservas de mesa con confirmación por email
- Cerrar la cuenta de la mesa con división de ticket si el cliente lo pide

---

## Notes

Sector hostelería — IVA al 10% para restaurantes. El menú del día a precio cerrado puede configurarse como producto compuesto. Las reservas online se sincronizan con la agenda de mesas para evitar sobreventas. Las comandas digitales eliminan los errores de lectura de los camareros. El módulo `kitchen` muestra los pedidos en tiempo real al chef con prioridad por hora de entrada.
