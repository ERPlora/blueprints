# Setup Guide: Warehousing & Storage

> Configure your Warehousing & Storage hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo un almacén y centro de distribución en Getafe. Se llama "Almacenes Centro S.L.". Ofrecemos servicio de almacenaje, gestión de inventario y distribución para empresas de comercio electrónico y manufactura. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Almacenes Centro S.L.", dirección "Polígono Industrial Los Olivos, Calle D 34, 28906 Getafe", CIF B28345678, teléfono 916 345 678, email info@almacenescentro.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%) para servicios de almacenaje y logística
- Métodos de pago: transferencia bancaria, confirming
- Empleados:
  - Emilio Castro (Warehouse Manager, PIN 1234)
  - Jesús Pardo (Warehouse Worker, PIN 5678)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database with storage agreements |
| inventory | Multi-client inventory with location tracking |
| invoicing | Storage and handling fee billing |
| purchase_orders | Supplier and inbound shipment management |
| tax | Tax configuration — 21% for warehousing |
| warehouse | Location management (aisles, racks, bins) and operations |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Warehouse Manager | full warehouse, full inventory, purchase orders |
| Warehouse Worker | full warehouse, view-only inventory |

---

## Typical use cases

- Gestionar las ubicaciones del almacén (pasillos, estanterías, posiciones) con stock por ubicación
- Registrar entradas y salidas con albaranes y documentación
- Controlar el inventario de varios clientes de forma separada en el mismo almacén
- Facturar a clientes por metros cúbicos almacenados y por operaciones de manipulación

---

## Notes

Sector logística — IVA al 21% para servicios de almacenaje y manipulación. El almacén puede operar como almacén propio o como almacén logístico para terceros (3PL). La gestión de ubicaciones permite optimizar el espacio y reducir los tiempos de picking. Los inventarios periódicos con pistola lectora de códigos de barras son esenciales para detectar diferencias. Los seguros de almacén deben cubrir el valor de las mercancías almacenadas de los clientes.
