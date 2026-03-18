# Guía de configuración: Dental Clinic

> Configura tu Dental Clinic desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una clínica dental en Valencia. Se llama "Clínica Dental Sonrisa Perfecta". Ofrecemos odontología general, ortodoncia, implantes y estética dental. Tenemos odontograma digital, planes de tratamiento y gestión de citas online. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Clínica Dental Sonrisa Perfecta", dirección "Avenida Blasco Ibáñez 34, 46021 Valencia", CIF B46567890, teléfono 963 567 890, email info@sonrisaperfecta.es
- IVA: exento de IVA para servicios odontológicos. Para productos (blanqueamientos, prótesis no colocadas): 21%
- Métodos de pago: efectivo, tarjeta, financiación interna
- Empleados:
  - Dra. Ana Romero (Dentist, PIN 1234)
  - Carlos Vega (Hygienist, PIN 5678)
  - Laura Mora (Receptionist, PIN 9012)

- Servicios:
  - Consulta inicial (gratuita / 0€)
  - Empaste (80€)
  - Limpieza dental (60€)
  - Extracción simple (70€)
  - Ortodoncia invisible (mes) (120€)
  - Implante (800€)
  - Blanqueamiento (250€)
  - Revisión y radiografías (50€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Multi-dentist agenda with chair/room assignment |
| cash_register | Patient payment management at reception |
| customers | Patient database with insurance and billing info |
| inventory | Dental materials and consumables stock |
| invoicing | Patient invoicing and insurance billing |
| online_booking | Online appointment booking for patients |
| patient_records | Odontogram, clinical history, and treatment plans |
| sales | Record treatment charges per session |
| tax | Tax configuration — exempt dental services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Dentist | full patient records, appointments, view-only patients |
| Hygienist | appointments, view patient records |
| Receptionist | appointments, customers, sales, cash register |

---

## Typical use cases

- Gestionar el odontograma digital con estado de cada pieza dental por paciente
- Crear planes de tratamiento con fases, costes y presupuesto firmado
- Controlar el historial de tratamientos y radiografías por paciente
- Gestionar la agenda de múltiples dentistas con sillones asignados

---

## Notes

Sector sanitario — los servicios odontológicos están **exentos de IVA** (Art. 20 LIVA). Los productos de venta no colocados (blanqueadores domésticos, etc.) tributan al 21%. El consentimiento informado es obligatorio para cada tratamiento invasivo. Los planes de tratamiento deben entregarse por escrito con el presupuesto antes de iniciar. La financiación interna requiere cumplimiento de normativa de crédito al consumo.
