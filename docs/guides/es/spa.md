# Guía de configuración: Spa / Massage

> Configura tu Spa / Massage desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo un spa en Marbella. Se llama "Spa Aqua Marbella". Ofrecemos circuito de aguas, masajes, tratamientos corporales y paquetes combinados. Gestionamos reservas online y presenciales. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Spa Aqua Marbella S.L.", dirección "Avenida del Mar 45, 29601 Marbella", CIF B29234567, teléfono 952 234 567, email reservas@aquamarbella.es
- IVA: 21% incluido en precios. Clases: IVA general (21%) para servicios de spa
- Métodos de pago: tarjeta, efectivo, bizum
- Empleados:
  - Carolina Vega (Manager, PIN 1234)

- Servicios:
  - Circuito de aguas 2h (35€)
  - Circuito de aguas + masaje 60min (75€)
  - Masaje relajante 60min (55€)
  - Masaje con piedras calientes (70€)
  - Tratamiento facial (60€)
  - Exfoliación corporal (50€)
  - Paquete spa día completo (120€)
  - Bono regalo spa (desde 50€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Circuit and cabin scheduling with capacity control |
| cash_register | Reception payments and gift voucher redemption |
| customers | Client profiles with treatment preferences |
| inventory | Towels, oils, and product stock |
| invoicing | Issue invoices and gift vouchers |
| online_booking | Online reservation for circuits and treatments |
| sales | Service and retail product sales |
| services | Service catalog with circuits, treatments, and packages |
| tax | Tax configuration — 21% for spa services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Gestionar la capacidad del circuito de aguas con control de aforo por franja horaria
- Vender paquetes combinados (circuito + masaje) con precio especial
- Comercializar bonos regalo para cumpleaños y aniversarios
- Ofrecer reserva online con selección de servicio, terapeuta y hora

---

## Notes

Sector servicios personales — IVA al 21% para servicios de spa. El circuito de aguas tiene capacidad limitada y debe gestionarse con reserva obligatoria para evitar saturación. Los bonos regalo son un producto de alta demanda en épocas navideñas y San Valentín. Las packages combinadas (circuito + tratamiento) se configuran con un precio especial inferior a la suma de componentes para incentivar la compra.
