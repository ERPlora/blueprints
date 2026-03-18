# Setup Guide: Delivery Services

> Configure your Delivery Services hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una empresa de mensajería y reparto de última milla en Barcelona. Se llama "Sprint Envíos S.L.". Hacemos entregas de paquetes para tiendas online y empresas, con seguimiento en tiempo real y comprobante de entrega. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Sprint Envíos S.L.", dirección "Zona Franca, Carrer del Foc 45, 08038 Barcelona", CIF B08567890, teléfono 932 567 890, email operaciones@sprintenvios.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%) para servicios de transporte
- Métodos de pago: transferencia bancaria, domiciliación mensual para clientes habituales
- Empleados:
  - Jordi Puig (Courier, PIN 1234)
  - Sandra Molina (Dispatcher, PIN 5678)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database for online shops and business clients |
| invoicing | Monthly or per-shipment invoicing to clients |
| orders | Shipment order management with tracking and status |
| shipping | Route and delivery management with proof of delivery |
| tax | Tax configuration — 21% for transport services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Courier | view-only shipping, view-only orders, tasks |
| Dispatcher | full shipping, orders, view-only customers |

---

## Typical use cases

- Asignar repartos diarios a repartidores con rutas optimizadas
- Registrar la firma o foto del receptor como comprobante de entrega
- Gestionar devoluciones y paquetes no entregados con motivo
- Facturar mensualmente a clientes con listado consolidado de envíos

---

## Notes

Sector logística — IVA al 21% para servicios de mensajería y transporte. El comprobante de entrega (firma o foto) es imprescindible para resolver disputas con clientes. Las devoluciones deben registrarse con motivo (ausente, dirección incorrecta, rehusado) para informar al cliente. La facturación mensual consolidada facilita la gestión con clientes de alto volumen.
