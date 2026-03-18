# Setup Guide: Vacation Rental

> Configure your Vacation Rental hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo un apartamento vacacional en Benidorm. Se llama "Apartamentos Sol y Mar". Alquilo mi piso a turistas por semanas y quincenas. Gestiono las reservas por Airbnb, Booking y directo. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Apartamentos Sol y Mar", dirección "Avenida Mediterráneo 23, 5ºB, 03502 Benidorm", CIF 21345678A, teléfono 965 345 678, email solymar@vacaciones.es
- IVA: 10% incluido para alojamiento turístico. IVA 21% para servicios extra (limpieza adicional, parking)
- Métodos de pago: tarjeta, Stripe, transferencia bancaria
- Empleados:
  - Consuelo Martínez (Property Manager, PIN 1234)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Guest database with stay history |
| invoicing | Issue accommodation invoices and deposit management |
| online_booking | Online booking page with availability calendar |
| reservations | Reservation calendar with channel management |
| tax | Tax configuration — 10% accommodation, 21% extras |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Property Manager | reservations, customers, invoicing, tasks |

---

## Typical use cases

- Gestionar el calendario de disponibilidad sincronizado entre plataformas (Airbnb, Booking)
- Coordinar la limpieza y preparación del apartamento entre check-outs y check-ins
- Emitir facturas a los huéspedes que las necesitan para gastos de empresa
- Gestionar la fianza y su devolución al final de cada estancia

---

## Notes

Sector turismo — IVA al 10% para el alojamiento vacacional cuando el propietario presta servicios similares a hostelería (limpieza periódica, cambio de ropa, etc.). Si el alquiler es puramente arrendamiento sin servicios, puede estar exento. La licencia de vivienda turística es obligatoria en la mayoría de Comunidades Autónomas. La Tasa Turística aplica en varias ciudades (Barcelona, Madrid, Baleares). El registro de viajeros (comunicación a la policía) es obligatorio.
