# Setup Guide: Beauty Center

> Configure your Beauty Center hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo un centro de belleza en Málaga. Se llama "Centro Belleza Sublime". Ofrecemos tratamientos faciales, depilación láser, manicura, pedicura y masajes estéticos. Tenemos cabinas y agenda por especialista. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Centro Belleza Sublime", dirección "Calle Larios 22, 29005 Málaga", CIF B29456789, teléfono 952 456 789, email sublime@centrobeauty.es
- IVA: 21% incluido en precios. Clases: IVA general (21%) para servicios de estética
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Cristina Navarro (Manager, PIN 1234)

- Servicios:
  - Limpieza facial (45€)
  - Depilación láser zona pequeña (35€)
  - Depilación láser zona grande (65€)
  - Manicura (25€)
  - Pedicura (30€)
  - Manicura + pedicura (50€)
  - Masaje facial (40€)
  - Tratamiento antiedad (75€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Cabin scheduling per specialist with time slot management |
| cash_register | POS and cash management |
| commissions | Track and calculate staff commissions per service |
| customers | Client profiles with treatment history and consent forms |
| inventory | Stock for cosmetic products and materials used in treatments |
| invoicing | Issue invoices and session vouchers |
| sales | Record service and product sales |
| services | Service catalog with cabin, duration, and price |
| staff | Staff management with schedules and commission rates |
| tax | Tax configuration — 21% general for aesthetic services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Gestionar citas por cabina y especialista con vista semanal de agenda
- Vender bonos de sesiones (ej. 10 sesiones de láser) con descuento
- Registrar las fórmulas y preferencias de tratamiento de cada clienta
- Calcular comisiones de las especialistas por servicio prestado

---

## Notes

Sector servicios personales — IVA al 21% (IVA general) para tratamientos estéticos. Los bonos de sesiones permiten fidelizar clientes con pago anticipado. Los formularios de consentimiento informado son obligatorios para tratamientos invasivos como láser o mesoterapia. El módulo `commissions` permite calcular automáticamente las comisiones del personal sobre cada servicio.
