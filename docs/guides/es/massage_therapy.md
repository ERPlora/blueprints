# Guía de configuración: Massage Therapy

> Configura tu Massage Therapy desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo un centro de masajes en Sevilla. Se llama "Oasis Terapéutico". Ofrecemos masajes terapéuticos, relajantes y deportivos. Tenemos reservas online y paquetes de sesiones. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Oasis Terapéutico", dirección "Calle Sierpes 45, 41001 Sevilla", CIF B41890123, teléfono 954 890 123, email reservas@oasisterapeutico.es
- IVA: 21% incluido en precios. Clases: IVA general (21%) para masajes no médicos
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Rosa Jiménez (Therapist, PIN 1234)
  - Pablo Torres (Receptionist, PIN 5678)

- Servicios:
  - Masaje relajante 60min (50€)
  - Masaje relajante 90min (70€)
  - Masaje deportivo 60min (55€)
  - Masaje terapéutico 60min (60€)
  - Masaje de pies (30€)
  - Bono 5 sesiones relajante (225€)
  - Masaje en pareja 60min (95€)
  - Aromaterapia 75min (65€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Session scheduling per therapist with room assignment |
| cash_register | POS and payment management |
| customers | Client profiles with health records and treatment preferences |
| inventory | Oils, towels, and supplies stock |
| invoicing | Issue invoices and session vouchers |
| online_booking | Online booking via website or link |
| sales | Service and product sales |
| services | Service catalog with duration and pricing |
| tax | Tax configuration — 21% for non-medical massage |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Therapist | appointments, view-only customers, view-only sales |
| Receptionist | appointments, customers, sales, cash register |

---

## Typical use cases

- Gestionar la agenda de terapeutas con disponibilidad y sala asignada
- Vender bonos de sesiones con seguimiento de sesiones consumidas
- Recoger información de salud relevante del cliente antes del primer masaje
- Ofrecer reserva online directa para reducir llamadas al centro

---

## Notes

Sector servicios personales — IVA al 21% para masajes estéticos y relajantes. Los masajes con fin terapéutico-médico pueden estar exentos si los presta un profesional sanitario acreditado, pero en la mayoría de centros de masajes aplica el 21%. La ficha del cliente debe incluir contraindicaciones y condiciones de salud relevantes para adaptar el tratamiento. Los bonos no caducan en menos de un año desde su compra (Ley de Comercio).
