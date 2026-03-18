# Setup Guide: Car Repair / Garage

> Configure your Car Repair / Garage hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo un taller mecánico en Valladolid. Se llama "Taller García Motor". Hacemos reparaciones de coches, cambios de aceite, frenos, revisiones y tenemos stock de recambios. Enviamos avisos de ITV a los clientes. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Taller García Motor", dirección "Calle Industria 34, 47012 Valladolid", CIF B47234567, teléfono 983 456 789, email tallergarcia@gmail.com
- IVA: 21% incluido en precios. Clases: IVA general (21%) para servicios de taller y repuestos
- Métodos de pago: efectivo, tarjeta, transferencia bancaria
- Empleados:
  - Sergio García (Mechanic, PIN 1234)
  - Pilar Fernández (Receptionist, PIN 5678)

- Servicios:
  - Cambio de aceite + filtro (49€)
  - Revisión frenos (35€)
  - Diagnóstico electrónico (25€)
  - Cambio de pastillas (60€)
  - Revisión preITV (39€)
  - Sustitución correa de distribución (180€)
  - Cambio de neumáticos (20€/unidad)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS and cash management for counter payments |
| customers | Customer database linked to vehicle records |
| inventory | Parts and supplies stock management |
| invoicing | Issue repair invoices with breakdown of labor and parts |
| maintenance | Repair orders with vehicle history, assigned mechanic, and status |
| sales | Record service and parts sales |
| tax | Tax configuration — 21% for services and parts |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Mechanic | maintenance orders, view-only inventory, tasks |
| Receptionist | customers, sales, cash register, view-only maintenance |

---

## Typical use cases

- Abrir órdenes de reparación por vehículo con descripción de la avería y presupuesto
- Registrar el historial completo de intervenciones por matrícula
- Enviar avisos automáticos de ITV próxima al cliente
- Gestionar el almacén de recambios y hacer pedidos al distribuidor

---

## Notes

Sector automoción — IVA al 21% para servicios mecánicos y repuestos. Las órdenes de reparación deben desglosar mano de obra y materiales de forma separada. Es obligatorio entregar presupuesto firmado antes de realizar la reparación (Decreto regulador de talleres de reparación). Los recordatorios de ITV aumentan la fidelización del cliente.
