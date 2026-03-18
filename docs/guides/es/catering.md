# Guía de configuración: Catering

> Configura tu Catering desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una empresa de catering en Madrid. Se llama "Catering Eventos Gourmet S.L.". Organizamos banquetes, bodas, eventos de empresa y cócteles. Tenemos cocina propia y personal de servicio. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Catering Eventos Gourmet S.L.", dirección "Calle Alcalá 234, 28027 Madrid", CIF B28567890, teléfono 914 567 890, email info@cateringgourmet.es
- IVA: 10% incluido en precios para catering. Clases: IVA reducido (10%) para servicio de comidas y bebidas
- Métodos de pago: transferencia bancaria, 30% señal + 70% antes del evento
- Empleados:
  - David Moreno (Event Coordinator, PIN 1234)
  - Sofía Ruiz (Chef, PIN 5678)
  - Alberto García (Sales Representative, PIN 9012)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Payments and deposits at the office |
| customers | Client database for corporate and private event clients |
| inventory | Ingredient, equipment, and supplies management per event |
| invoicing | Issue proforma invoices, advance billing, and final event invoices |
| orders | Order management for each event with menus and quantities |
| sales | Record event sales and extras |
| tax | Tax configuration — 10% for catering services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Event Coordinator | projects, tasks, customers, orders |
| Chef | kitchen, orders, view-only inventory |
| Sales Representative | quotes, customers, view-only invoicing |

---

## Typical use cases

- Crear presupuesto por evento con menú, número de comensales y extras de servicio
- Planificar la producción de cocina para cada evento con BOM de recetas
- Gestionar el personal temporal por evento (camareros, cocineros)
- Facturar anticipos y saldo final de cada evento

---

## Notes

Sector hostelería — IVA al 10% para servicio de catering y comidas. La gestión por evento es la unidad de trabajo principal. Cada evento tiene su propio presupuesto, producción de cocina y facturación. El 30% de señal al contratar y el resto antes del evento es la práctica habitual. Los presupuestos suelen desglosar: menú, bebidas, personal, alquiler de material y transporte.
