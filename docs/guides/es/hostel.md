# Guía de configuración: Hostel

> Configura tu Hostel desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo un hostel en Barcelona. Se llama "Rambla Youth Hostel". Tenemos habitaciones compartidas con literas y habitaciones privadas. Recibimos viajeros jóvenes y mochileros de todo el mundo. Gestionamos reservas online y en mostrador. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Rambla Youth Hostel S.L.", dirección "Carrer Nou de la Rambla 12, 08001 Barcelona", CIF B08901234, teléfono 933 901 234, email info@ramblahostel.es
- IVA: 10% incluido en precios para alojamiento. Clases: IVA reducido (10%) hostelería
- Métodos de pago: tarjeta, efectivo, pago online
- Empleados:
  - Sarah Johnson (Receptionist, PIN 1234)

- Tipos de habitación:
  - Cama en dormitorio mixto 8 camas (18€/noche)
  - Cama en dormitorio femenino 6 camas (20€/noche)
  - Habitación privada individual (45€/noche)
  - Habitación privada doble (65€/noche)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Reception payments and deposits |
| customers | Guest database with ID verification |
| inventory | Bar, vending, and hostel supplies stock |
| invoicing | Issue accommodation invoices per stay |
| online_booking | Online booking with channel manager connectivity |
| reservations | Reservation management with bed/room availability calendar |
| sales | Bar sales, lockers, and extra services |
| tax | Tax configuration — 10% for accommodation |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Receptionist | reservations, customers, sales, cash register |

---

## Typical use cases

- Gestionar la disponibilidad de camas individuales en dormitorios compartidos
- Registrar check-in y check-out con copia del documento de identidad (obligatorio)
- Vender extras en recepción: desayuno, alquiler de toalla, casilleros
- Gestionar las reservas de Booking.com, Hostelworld y otros canales online

---

## Notes

Sector turismo — IVA al 10% para servicios de alojamiento. El registro de huéspedes con DNI/pasaporte es **obligatorio por ley** (comunicación a la Policía Nacional/Guardia Civil). En Barcelona y otras ciudades se aplica la Tasa Turística municipal que debe añadirse a la factura. Los hostels suelen tener políticas de cancelación flexibles para atraer mochileros.
