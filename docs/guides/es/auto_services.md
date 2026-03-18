# Guía de configuración: Auto Services (ITV, Tires, Wash)

> Configura tu Auto Services desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo un centro de servicios de automoción en Zaragoza. Se llama "AutoRápid Zaragoza". Hacemos cambios de neumáticos, lavado de coches y servicios rápidos de mantenimiento con cita previa. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "AutoRápid Zaragoza", dirección "Avenida de Goya 112, 50005 Zaragoza", CIF B50123456, teléfono 976 345 678, email info@autorapidzaragoza.es
- IVA: 21% incluido en precios. Clases: IVA general (21%) para servicios y repuestos
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Pablo Moreno (Technician, PIN 1111)
  - Rosa García (Cashier, PIN 2222)

- Servicios: Cambio neumático (18€), Equilibrado ruedas (12€), Lavado exterior (8€), Lavado interior+exterior (18€), Cambio aceite (45€), Revisión preITV (29€), Cambio escobillas (15€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Appointment booking for services with vehicle and customer info |
| cash_register | POS cash drawer management and Z reports |
| customers | Customer database linked to vehicle records |
| inventory | Stock for tires, spare parts, oils, and cleaning products |
| invoicing | Issue invoices and simplified receipts |
| sales | Record sales transactions at the counter |
| tax | Tax configuration — IVA rates for services and parts |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Technician | appointments, tasks, view-only inventory |
| Cashier | sales, cash register, view-only appointments |

---

## Typical use cases

- Gestionar citas para cambio de neumáticos con recordatorio al cliente
- Registrar historial de vehículo por matrícula y cliente
- Cobrar servicios en mostrador con caja registradora
- Controlar el stock de neumáticos por talla y marca

---

## Notes

Sector automoción — IVA al 21% incluido en precios al consumidor final. Los servicios de ITV se facturan con el precio oficial regulado. Es recomendable registrar la matrícula del vehículo en cada venta para trazar el historial. Las notificaciones de cita se envían automáticamente si el módulo de citas tiene configurado el email del cliente.
