# Guía de configuración: Sushi Restaurant

> Configura tu Sushi Restaurant desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo un restaurante japonés de sushi en Barcelona. Se llama "Sakura Sushi Bar". Ofrecemos sushi bar, rolls, sashimi, tempura y cocina japonesa. Tenemos barra de sushi, mesas y también hacemos delivery. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Sakura Sushi Bar S.L.", dirección "Carrer de la Marina 45, 08005 Barcelona", CIF B08789012, teléfono 932 789 012, email sakurasushibar@gmail.es
- IVA: 10% incluido en precios. Clases: IVA reducido (10%) para restauración
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Yuki Tanaka (Sushi Chef, PIN 1234)
  - Ana Torres (Waiter, PIN 5678)
- Productos:
  - Nigiri salmón x2 (4,50€)
  - California roll x8 (9,50€)
  - Spicy tuna roll x8 (10,50€)
  - Sashimi salmón x5 (11,00€)
  - Tempura gambas x4 (9,00€)
  - Edamame (4,00€)
  - Sake (copa) (5,50€)
  - Menú omakase (35€)
- Zonas y mesas: Barra sushi (6 taburetes), Sala (8 mesas), Terraza (4 mesas)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with table billing |
| customers | Customer database for reservations and delivery |
| inventory | Fresh fish, ingredients, and rice stock with expiry tracking |
| invoicing | Issue restaurant tickets and invoices |
| kitchen | Sushi chef display and kitchen order management |
| orders | Table and counter order management |
| reservations | Reservation management for bar seating and tables |
| sales | Table, bar, and delivery sales |
| tables | Table map with bar, room, and terrace |
| tax | Tax configuration — 10% reducido |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Sushi Chef | kitchen display, view-only orders, view-only inventory |
| Waiter | sales, tables, orders, view-only reservations |

---

## Typical use cases

- Gestionar los pedidos de la barra de sushi con pantalla del chef
- Controlar el stock de pescado fresco con fechas de caducidad estrictas
- Gestionar reservas para la barra de sushi y las mesas de sala
- Ofrecer delivery con packaging especializado para sushi

---

## Notes

Sector hostelería — IVA al 10% para restauración japonesa. El control de temperatura y frescura del pescado es crítico por normativa sanitaria. El salmón y otros pescados crudos deben estar congelados previamente a -20°C durante al menos 24h (normativa de anisakis). El menú omakase (el chef decide) se cobra a precio cerrado y debe comunicarse al cliente antes. La barra de sushi permite una experiencia diferencial con el chef trabajando a la vista del cliente.
