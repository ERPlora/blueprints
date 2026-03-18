# Setup Guide: Gym / Sports Center

> Configure your Gym / Sports Center hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo un gimnasio en Alicante. Se llama "FitZone Sport Center". Ofrecemos sala de musculación, clases colectivas y entrenamiento personal. Los socios pagan cuota mensual y pueden reservar clases. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "FitZone Sport Center", dirección "Calle Médico Pascual Pérez 14, 03007 Alicante", CIF B03678901, teléfono 965 678 901, email info@fitzonealicante.es
- IVA: 21% incluido en precios. Clases: IVA general (21%) para servicios de gimnasio
- Métodos de pago: domiciliación bancaria (cuotas), tarjeta, efectivo
- Empleados:
  - Rodrigo Navarro (Trainer, PIN 1234)

- Servicios:
  - Cuota mensual básica (29,90€/mes)
  - Cuota mensual premium (49,90€/mes)
  - Entrenamiento personal 1h (40€)
  - Pack 10 sesiones PT (350€)
  - Matrícula (20€)
  - Día de acceso (8€)
  - Clase de Yoga (8€)
  - Clase de Spinning (8€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Counter payments for daily passes and extras |
| customers | Member database with subscription and access control |
| inventory | Gym retail (supplements, merchandise) stock |
| invoicing | Monthly subscription invoicing and individual sales |
| sales | Retail and one-time service sales |
| services | Class catalog with schedule and capacity |
| staff | Trainer management with class assignments |
| subscriptions | Recurring membership management and billing |
| tax | Tax configuration — 21% for fitness services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Trainer | appointments, view-only customers |

---

## Typical use cases

- Gestionar las cuotas de socios con cobro automático por domiciliación mensual
- Reservar clases colectivas con control de aforo y lista de espera
- Controlar el acceso de socios activos y suspender acceso si hay impago
- Vender entrenamiento personal y packs de sesiones con control de uso

---

## Notes

Sector servicios personales — IVA al 21% para servicios de gimnasio. Las cuotas de membresía recurrentes se gestionan con el módulo `subscriptions` que genera facturas automáticas cada mes. El módulo `subscriptions` también gestiona la suspensión automática de acceso en caso de impago. Los bonos de clases tienen fecha de caducidad para evitar acumulaciones indefinidas.
