# Setup Guide: Logistics & Distribution

> Configure your Logistics & Distribution hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una empresa de logística y distribución en Zaragoza. Se llama "Trans Ebro Logística S.L.". Hacemos distribución regional con flota propia, almacén y gestión de envíos para empresas. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Trans Ebro Logística S.L.", dirección "Polígono PLAZA, Avenida Edigrafos 3, 50197 Zaragoza", CIF B50789012, teléfono 976 789 012, email operaciones@transebro.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%) para transporte y almacenaje
- Métodos de pago: transferencia bancaria, domiciliación
- Empleados:
  - Víctor Lozano (Dispatcher, PIN 1234)
  - Félix García (Delivery Driver, PIN 5678)
  - Carmen Ruiz (Warehouse Worker, PIN 9012)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database for shippers and consignees |
| fleet | Vehicle fleet management with maintenance and assignment |
| inventory | Warehouse inventory and pallet tracking |
| invoicing | B2B invoicing per shipment or consolidated monthly |
| shipping | Shipment management with tracking and delivery confirmation |
| tax | Tax configuration — 21% for logistics |
| warehouse | Warehouse location and stock management |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Dispatcher | shipping, view-only fleet, tasks |
| Delivery Driver | view-only shipping, tasks |
| Warehouse Worker | full warehouse, full inventory |

---

## Typical use cases

- Gestionar expediciones con asignación de vehículo y conductor por ruta
- Controlar el estado de los envíos con tracking en tiempo real
- Administrar el almacén con ubicaciones, entradas y salidas
- Facturar a clientes por volumen de envíos o tarifa plana mensual

---

## Notes

Sector logística — IVA al 21% para transporte de mercancías. Las empresas de transporte necesitan la Tarjeta de Transporte de la DGT para cada vehículo. El CMR (Carta de Porte Internacional) es obligatorio para transportes transfronterizos. La trazabilidad de la cadena de custodia es clave para resolver incidencias de pérdida o daño. El módulo `fleet` gestiona los mantenimientos periódicos y el ITV de los vehículos.
