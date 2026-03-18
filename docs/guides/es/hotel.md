# Setup Guide: Hotel

> Configure your Hotel hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo un hotel en San Sebastián. Se llama "Hotel Perla Vasca". Tenemos 40 habitaciones, restaurante, bar y servicio de habitaciones. Gestionamos reservas, check-in/check-out, housekeeping y facturación. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Hotel Perla Vasca S.L.", dirección "Paseo de la Concha 12, 20007 San Sebastián", CIF B20234567, teléfono 943 234 567, email reservas@hotelperlavasca.es
- IVA: 10% incluido en precios para alojamiento. Restaurante 10% incluido. Clases: IVA reducido (10%)
- Métodos de pago: tarjeta, transferencia bancaria, OTA (Booking.com, Expedia)
- Empleados:
  - Amaia Zubieta (Receptionist, PIN 1234)
  - Maite Arregui (Housekeeper, PIN 5678)
  - Iñaki Etxeberria (Manager, PIN 9012)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Reception and restaurant payments |
| customers | Guest database with stay history and preferences |
| inventory | Hotel supplies, bar, restaurant, and amenities stock |
| invoicing | Comprehensive billing with all hotel charges per stay |
| reservations | Room reservation management and occupancy calendar |
| sales | Restaurant, bar, and extra services sales |
| staff | Housekeeping and reception staff management |
| tax | Tax configuration — 10% for accommodation and food |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Receptionist | reservations, customers, sales, cash register |
| Housekeeper | view-only reservations, tasks |
| Manager | reservations, customers, sales, view reports, view-only staff |

---

## Typical use cases

- Gestionar la disponibilidad de habitaciones con vista por tipo y fecha
- Registrar check-in con copia de DNI y asignación de habitación
- Acumular cargos de restaurante, bar y extras a la factura de la habitación
- Coordinar el plan de limpieza de habitaciones según check-outs del día

---

## Notes

Sector turismo — IVA al 10% para servicios de alojamiento y restauración en hotel. El registro de huéspedes con documento de identidad es obligatorio (comunicación a las autoridades). La Tasa Turística aplica en muchas ciudades y debe desglosarse en la factura. La integración con el channel manager permite sincronizar disponibilidad con Booking.com, Expedia y otras plataformas.
