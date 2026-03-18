# Setup Guide: Tattoo / Piercing

> Configure your Tattoo / Piercing hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo un estudio de tatuajes en Barcelona. Se llama "Black Needle Tattoo Studio". Hacemos tatuajes personalizados, piercing y microblading. Trabajamos con cita previa y señal obligatoria. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Black Needle Tattoo Studio S.L.", dirección "Carrer del Parlament 34, 08015 Barcelona", CIF B08890123, teléfono 934 890 123, email info@blackneedle.es
- IVA: 21% incluido en precios. Clases: IVA general (21%) para servicios de tatuaje y piercing
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Óscar Reyes (Manager, PIN 1234)

- Servicios:
  - Consulta/presupuesto tatuaje (gratuita)
  - Tatuaje pequeño (hasta 10cm²) (desde 80€)
  - Tatuaje mediano (desde 150€)
  - Tatuaje grande (sesión) (desde 200€)
  - Piercing oreja (25€)
  - Piercing nariz (30€)
  - Microblading cejas (180€)
  - Señal para reserva cita (50€, a cuenta del precio total)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Appointment scheduling with session duration and artist |
| cash_register | POS and payment management |
| customers | Client profiles with tattoo history and design portfolio |
| inventory | Needles, inks, and consumable stock |
| invoicing | Issue invoices with design description |
| sales | Service and product sales |
| services | Service catalog with artist and price |
| tax | Tax configuration — 21% for tattoo and piercing |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Gestionar la agenda del artista con citas de varias horas para tatuajes grandes
- Registrar el historial de tatuajes de cada cliente con fotos del trabajo realizado
- Cobrar la señal al reservar cita y el resto el día del trabajo
- Gestionar el consentimiento informado obligatorio antes de cada sesión

---

## Notes

Sector servicios personales — IVA al 21%. El consentimiento informado es **obligatorio por ley** antes de tatuar o realizar un piercing (Decreto 28/2002 y normativa autonómica equivalente). Los menores de 18 años necesitan consentimiento firmado del tutor legal. Las tintas y materiales deben cumplir la normativa UE de sustancias cosméticas. El portfolio digital del artista permite mostrar su estilo a los clientes antes de reservar.
