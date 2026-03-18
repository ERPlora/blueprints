# Guía de configuración: Vacation Rental Management

> Configura tu Vacation Rental Management desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una empresa de gestión de apartamentos turísticos en Málaga. Se llama "Costa del Sol Vacation Management". Gestionamos 30 apartamentos de propietarios privados en la Costa del Sol. Nos encargamos de las reservas, la limpieza, el mantenimiento y la liquidación a los propietarios. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Costa del Sol Vacation Management S.L.", dirección "Avenida de Andalucía 56, 29004 Málaga", CIF B29345678, teléfono 952 345 678, email info@cosavacation.es
- IVA: 21% no incluido en comisiones de gestión. Alojamiento turístico al 10% facturado al huésped
- Métodos de pago: tarjeta, transferencia bancaria
- Empleados:
  - Álvaro Moreno (Property Manager, PIN 1234)
  - Rocío Campos (Cleaner, PIN 5678)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Guest and property owner database |
| invoicing | Guest invoices and owner payout reports |
| online_booking | Multi-property online booking with channel manager |
| property_mgmt | Multi-property portfolio management for owners |
| reservations | Centralized reservation management across all properties |
| tax | Tax configuration — 21% management fees, 10% accommodation |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Property Manager | full property management, reservations, customers, invoicing |
| Cleaner | tasks, view-only reservations |

---

## Typical use cases

- Gestionar el calendario de todos los apartamentos desde un único panel
- Coordinar los turnos de limpieza según los check-outs del día
- Emitir la liquidación mensual a cada propietario con ingresos, gastos y comisión
- Gestionar incidencias de mantenimiento en cada propiedad con seguimiento

---

## Notes

Sector inmobiliario/turismo — la empresa de gestión cobra una comisión al propietario (generalmente 15-25% de los ingresos) que tributa al 21% IVA. El alojamiento al huésped tributa al 10%. El módulo `property_mgmt` permite gestionar múltiples propiedades de diferentes propietarios con liquidaciones independientes. La Tasa Turística recaudada del huésped debe ingresarse en la administración local correspondiente.
