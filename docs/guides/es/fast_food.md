# Guía de configuración: Fast Food

> Configura tu Fast Food desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo un restaurante de comida rápida en Madrid. Se llama "Burger King del Barrio" — bueno, se llama "BurgerStop Madrid". Hacemos hamburguesas, patatas fritas, perritos y combos. Tenemos mostrador, cocina con pantalla y pedidos para llevar. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "BurgerStop Madrid", dirección "Calle Gran Vía 10, 28013 Madrid", CIF B28901234, teléfono 911 234 567, email burgerstopmadrid@gmail.com
- IVA: 10% incluido en precios. Clases: IVA reducido (10%) para comida preparada en restaurante
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Marcos Díaz (Cashier, PIN 1234)
  - Nadia Benali (Prep Cook, PIN 5678)
- Productos:
  - Hamburguesa Classic (6,50€)
  - Hamburguesa Doble (9,50€)
  - Perrito caliente (4,50€)
  - Patatas fritas M (2,50€)
  - Refresco M (2,00€)
  - Combo Classic (10,50€)
  - Combo Doble (13,50€)
  - Nuggets x6 (4,00€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Counter POS with order number display |
| customers | Customer database for loyalty program |
| inventory | Ingredient and packaging stock management |
| invoicing | Issue simplified receipts and invoices |
| kitchen | Kitchen Display System (KDS) for prep screen |
| orders | Order management with number assignment and status |
| sales | Counter and delivery sales recording |
| tax | Tax configuration — 10% reducido |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Cashier | sales, cash register, orders |
| Prep Cook | kitchen display, view-only orders |

---

## Typical use cases

- Aceptar pedidos en mostrador con asignación de número al cliente
- Mostrar los pedidos en la pantalla de cocina para preparación
- Gestionar pedidos para llevar y delivery con integración externa
- Configurar combos con descuento automático vs. productos individuales

---

## Notes

Sector hostelería — IVA al 10% para comida preparada en establecimientos de restauración. Los combos se configuran como productos compuestos con precio especial. La pantalla de cocina (KDS) permite al cocinero ver los pedidos en cola y marcarlos como completados. Los pedidos de delivery pueden integrarse con Glovo, Uber Eats o Just Eat según disponibilidad del módulo.
