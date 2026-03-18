# Guía de configuración: Vacation Rental

> Configura tu Vacation Rental desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo un apartamento vacacional en Benidorm. Se llama "Apartamentos Sol y Mar". Alquilo mi piso a turistas por semanas y quincenas. Gestiono las reservas por Airbnb, Booking y directo. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

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
