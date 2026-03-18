# Guía de configuración: Kebab Shop

> Configura tu Kebab Shop desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo un kebab en Alicante. Se llama "Istanbul Kebab Alicante". Hacemos döner kebab, durum, platos combinados y menú del mediodía. También hacemos delivery. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Istanbul Kebab Alicante", dirección "Avenida de la Constitución 45, 03006 Alicante", CIF B03890123, teléfono 965 890 123, email istanbulkebab@gmail.com
- IVA: 10% incluido en precios. Clases: IVA reducido (10%) para comida preparada
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Mehmet Yilmaz (Kebab Cook, PIN 1234)
- Productos:
  - Kebab en pan grande (5,50€)
  - Kebab en pan pequeño (4,00€)
  - Durum pollo (5,00€)
  - Durum mixto (5,50€)
  - Plato kebab con patatas (8,50€)
  - Menú kebab + bebida (7,50€)
  - Falafel (4,50€)
  - Bebida lata (1,50€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Counter POS for quick service |
| inventory | Meat, bread, vegetables, and sauce stock management |
| invoicing | Issue simplified receipts |
| kitchen | Kitchen display for order preparation |
| orders | Order management for counter and delivery |
| sales | Counter and delivery sales |
| tax | Tax configuration — 10% reducido |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Kebab Cook | kitchen display, view-only orders, sales, cash register |

---

## Typical use cases

- Gestionar pedidos de mostrador con pantalla de cocina para el cocinero
- Integrar pedidos de delivery (Glovo, Uber Eats) en la pantalla de cocina
- Controlar el stock de carne en espeto y pan para evitar quedar sin producto
- Gestionar el menú del mediodía con precio especial hasta las 16:00

---

## Notes

Sector hostelería — IVA al 10% para comida preparada. Los kebabs operan frecuentemente en horario de tarde-noche, con pico de ventas a partir de las 22:00. El control de stock del espeto (carne) es crítico para no quedarse sin producto en las horas punta. El delivery es una parte importante del negocio, especialmente los fines de semana.
