# Setup Guide: Tour Operator

> Configure your Tour Operator hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una empresa de turismo activo en Granada. Se llama "Aventura Sierra Nevada Tours". Organizamos excursiones, senderismo, rutas en bici y actividades de aventura. Gestionamos reservas de grupos e individuales con guías propios. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Aventura Sierra Nevada Tours S.L.", dirección "Calle Recogidas 56, 18005 Granada", CIF B18012345, teléfono 958 012 345, email reservas@aventurasierranevada.es
- IVA: 10% incluido en precios. Clases: IVA reducido (10%) para servicios turísticos y de ocio
- Métodos de pago: tarjeta, transferencia bancaria, pago online
- Empleados:
  - Alberto Jiménez (Sales Representative, PIN 1234)
  - Laura García (Tour Guide, PIN 5678)

- Actividades:
  - Senderismo Sierra Nevada (día) (35€/persona)
  - Ruta en bicicleta de montaña (45€/persona)
  - Escalada principiantes (40€/persona)
  - Excursión Alhambra + guía (55€/persona)
  - Tour privado en 4x4 (120€/grupo)
  - Ruta fotografía naturaleza (38€/persona)
  - Kayak en Güéjar Sierra (42€/persona)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | On-site payments and deposits |
| customers | Client database with group booking history |
| inventory | Equipment and material inventory (bikes, harnesses, etc.) |
| invoicing | Issue vouchers, invoices, and group billing |
| online_booking | Online booking with activity calendar |
| reservations | Group and individual reservation management |
| sales | Activity booking sales |
| tax | Tax configuration — 10% for tourist activities |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Sales Representative | quotes, customers, reservations, view-only invoicing |
| Tour Guide | view-only reservations, view-only customers, tasks |

---

## Typical use cases

- Gestionar las reservas de actividades con calendario de disponibilidad por actividad
- Controlar el aforo máximo por actividad para no sobrevender plazas
- Asignar guías a cada excursión con información del grupo
- Gestionar el material de aventura (bicicletas, arneses) con estado de cada equipo

---

## Notes

Sector turismo — IVA al 10% para servicios turísticos y actividades de ocio. Las empresas de turismo activo deben estar inscritas en el Registro de Empresas de Turismo Activo de la Comunidad Autónoma. Los guías de naturaleza deben tener titulación oficial. El seguro de responsabilidad civil es obligatorio para cubrir accidentes durante las actividades. La cancelación por condiciones meteorológicas debe estar contemplada en la política de reservas.
