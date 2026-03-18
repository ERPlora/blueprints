# Guía de configuración: Cafeteria

> Configura tu Cafeteria desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una cafetería en Bilbao. Se llama "Café La Ría". Servimos cafés de especialidad, zumos naturales, bollería y comida ligera. Tenemos mesas interiores y barra. También servimos para llevar. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Café La Ría", dirección "Gran Vía 45, 48001 Bilbao", CIF B48123456, teléfono 944 234 567, email cafeterialaría@gmail.com
- IVA: 10% incluido en precios. Clases: IVA reducido (10%) para consumo en establecimiento y para llevar
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Nerea Etxebarria (Barista, PIN 1234)
  - Iker Zubiaga (Waiter, PIN 5678)
- Productos:
  - Café solo (1,30€)
  - Café con leche (1,60€)
  - Capuccino (2,50€)
  - Zumo natural naranja (2,80€)
  - Tostada con tomate (2,50€)
  - Croissant (1,80€)
  - Bocadillo (4,50€)
  - Menú mediodía (11,00€)
- Zonas y mesas: Interior (8 mesas), Terraza (6 mesas)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS and cash management, daily closing |
| customers | Customer database for regular clients and loyalty |
| inventory | Stock for coffee beans, milk, ingredients, and packaging |
| invoicing | Issue invoices and tickets |
| kitchen | Kitchen display for food preparation orders |
| orders | Order management per table and takeaway |
| sales | Counter sales and table billing |
| tables | Table map with interior and terrace zones |
| tax | Tax configuration — 10% IVA reducido |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Barista | sales, cash register, view-only inventory |
| Waiter | sales, tables, orders |

---

## Typical use cases

- Preparar pedidos de barra con pantalla de visualización para el barista
- Gestionar mesas de terraza e interior con comandas digitales
- Ofrecer menú del día con precio cerrado incluidas bebida y postre
- Registrar ventas para llevar con packaging adecuado

---

## Notes

Sector hostelería — IVA al 10% (IVA reducido) tanto para consumo en local como para llevar (desde 2023). El menú del día puede configurarse como producto compuesto. La cafetería con cocina puede enviar los pedidos de comida a la pantalla de cocina mientras el barista prepara las bebidas directamente.
