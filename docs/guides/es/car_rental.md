# Setup Guide: Car Rental

> Configure your Car Rental hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una empresa de alquiler de coches en Palma de Mallorca. Se llama "Mallorca Rent a Car S.L.". Alquilamos vehículos por días a turistas y empresas, con gestión de flota, seguros y reservas online. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Mallorca Rent a Car S.L.", dirección "Aeropuerto de Palma, Terminal A, 07611 Palma", CIF B07234567, teléfono 971 345 678, email info@mallorcarentacar.es
- IVA: 21% incluido en precios. Clases: IVA general (21%) para alquiler de vehículos
- Métodos de pago: tarjeta, transferencia bancaria, pago online
- Empleados:
  - Catalina Ramis (Rental Agent, PIN 1234)
  - Tomeu Ferrer (Fleet Manager, PIN 5678)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | Rental contracts with terms, damage policy, and insurance |
| customers | Customer database with driving license validation |
| fleet | Fleet management with vehicle status, maintenance, and availability |
| invoicing | Issue rental invoices and deposits |
| reservations | Reservation system with availability calendar and booking |
| tax | Tax configuration — 21% for vehicle rental |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Rental Agent | reservations, customers, sales, cash register, view-only fleet |
| Fleet Manager | full fleet management, maintenance |

---

## Typical use cases

- Gestionar reservas online y en mostrador con calendario de disponibilidad de flota
- Registrar daños pre y post alquiler con fotos adjuntas al contrato
- Controlar el mantenimiento preventivo de cada vehículo (ITV, revisiones)
- Gestionar los seguros incluidos y los extras opcionales (GPS, silla de bebé)

---

## Notes

Sector automoción — IVA al 21% para alquiler de vehículos. El contrato de alquiler debe incluir condiciones de seguro, franquicia de daños, y política de combustible. La toma y entrega del vehículo debe registrarse con fotos del estado para evitar disputas. Los extras (conductor adicional, GPS, seguro a todo riesgo) deben configurarse como opciones en las reservas.
