# Setup Guide: Transportation Company

> Configure your Transportation Company hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una empresa de transporte por carretera en Burgos. Se llama "Transportes Meseta S.L.". Hacemos transporte de mercancías a nivel nacional con flota propia de camiones. Gestionamos la flota, los conductores y la facturación a clientes. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Transportes Meseta S.L.", dirección "Polígono Industrial Gamonal, Calle Industria 23, 09007 Burgos", CIF B09678901, teléfono 947 678 901, email info@transportesmeseta.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%) para transporte de mercancías
- Métodos de pago: transferencia bancaria, confirming
- Empleados:
  - Miguel Sanz (Driver, PIN 1234)
  - Carlos Herrera (Fleet Manager, PIN 5678)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database with rate cards and contracts |
| expenses | Fuel, tolls, and vehicle maintenance cost tracking |
| fleet | Vehicle fleet management with ITV, maintenance, and driver assignment |
| invoicing | Per-trip and consolidated monthly client invoicing |
| tax | Tax configuration — 21% for freight transport |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Driver | view-only schedules, tasks |
| Fleet Manager | full fleet, schedules, view-only staff |

---

## Typical use cases

- Gestionar la flota de vehículos con fechas de ITV, revisión y documentación
- Asignar conductores a rutas con información del cargamento
- Controlar el gasto de combustible y peajes por vehículo
- Facturar a clientes por viaje o con tarifa plana mensual consolidada

---

## Notes

Sector transporte — IVA al 21% para transporte de mercancías por carretera. Las empresas de transporte necesitan la autorización de transporte (tarjeta de transporte) para cada vehículo de más de 3,5t. El Tacógrafo digital es obligatorio y sus registros deben conservarse 1 año a bordo. Los conductores de camión necesitan el Certificado de Aptitud Profesional (CAP) vigente. El Seguro de Responsabilidad Civil del transportista cubre las mercancías en tránsito.
