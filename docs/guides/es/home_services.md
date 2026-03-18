# Guía de configuración: Home Services

> Configura tu Home Services desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una empresa de servicios del hogar en Málaga. Se llama "ServiHogar Málaga". Hacemos fontanería, electricidad y pintura en domicilios particulares. Nuestros técnicos trabajan en campo con furgoneta propia. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

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
