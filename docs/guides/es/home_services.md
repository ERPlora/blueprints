# Setup Guide: Home Services

> Configure your Home Services hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una empresa de servicios del hogar en Málaga. Se llama "ServiHogar Málaga". Hacemos fontanería, electricidad y pintura en domicilios particulares. Nuestros técnicos trabajan en campo con furgoneta propia. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "ServiHogar Málaga S.L.", dirección "Calle Victoria 23, 29012 Málaga", CIF B29678901, teléfono 952 678 901, email info@servihogarmalaga.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%) para servicios y materiales
- Métodos de pago: transferencia bancaria, efectivo, bizum
- Empleados:
  - Antonio Ruiz (Technician, PIN 1234)
  - Carmen López (Dispatcher, PIN 5678)

- Servicios:
  - Revisión fontanería (45€)
  - Reparación de avería (desde 60€)
  - Instalación eléctrica (desde 80€)
  - Pintura habitación (desde 120€)
  - Desatasco (55€)
  - Presupuesto gratuito (0€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Customer database with address and service history |
| invoicing | Issue invoices on site or at office |
| quotes | Create and send quotes with labor and materials breakdown |
| schedules | Field technician scheduling with geographic zones |
| staff | Technician management and assignment |
| tasks | Work order management with status tracking |
| tax | Tax configuration — 21% for services and materials |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Technician | tasks, field service, view-only inventory |
| Dispatcher | tasks, schedules, customers, quotes |

---

## Typical use cases

- Asignar urgencias a técnicos en campo con vista del calendario disponible
- Emitir presupuesto desde el móvil del técnico y convertirlo a factura al cobrar
- Gestionar el stock de materiales en la furgoneta de cada técnico
- Registrar el historial de intervenciones en cada domicilio

---

## Notes

Sector servicios — IVA al 21% para servicios del hogar. Los trabajos en vivienda habitual pueden acogerse al IVA reducido del 10% si cumplen los requisitos (rehabilitación, ocupante persona física, menos del 40% del valor material/total). Es obligatorio entregar presupuesto escrito antes de iniciar el trabajo. La factura debe desglosar mano de obra y materiales.
