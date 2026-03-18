# Setup Guide: Clinic / Medical Center

> Configure your Clinic / Medical Center hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una clínica médica privada en Zaragoza. Se llama "Clínica Salud Aragón". Ofrecemos consultas de medicina general, ginecología y traumatología. Tenemos historia clínica electrónica, gestión de citas y cobro a pacientes. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Clínica Salud Aragón", dirección "Calle Paseo de la Independencia 22, 50004 Zaragoza", CIF B50456789, teléfono 976 456 789, email info@clinicasaludaragon.es
- IVA: exento de IVA para servicios médicos. Para productos sanitarios de venta: 4% o 10% según producto
- Métodos de pago: efectivo, tarjeta, seguro médico (mutua)
- Empleados:
  - Dr. José Hernández (Doctor, PIN 1234)
  - María Blanco (Receptionist, PIN 5678)
  - Ana Jiménez (Nurse, PIN 9012)

- Servicios:
  - Consulta medicina general (50€)
  - Consulta ginecología (65€)
  - Consulta traumatología (60€)
  - Electrocardiograma (35€)
  - Analítica básica (45€)
  - Ecografía abdominal (55€)
  - Revisión médica completa (120€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Multi-doctor appointment scheduling with specialty and room |
| cash_register | Patient payments at reception |
| customers | Patient database with contact and insurance info |
| inventory | Medical supplies and consumables stock |
| invoicing | Issue invoices and insurance billing documents |
| online_booking | Online appointment booking for patients |
| patient_records | Electronic health records (EHR) with clinical history |
| sales | Record medical service charges |
| tax | Tax configuration — exempt medical services, reduced for supplies |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Doctor | full patient records, appointments, view-only patients |
| Receptionist | appointments, customers, sales, cash register |
| Nurse | view patient records, appointments, view-only inventory |

---

## Typical use cases

- Gestionar la agenda de citas por médico y especialidad con confirmación automática
- Registrar la historia clínica del paciente con evolución por visita
- Facturar a seguros médicos (mutuas) con los códigos de prestación correctos
- Gestionar el stock de material médico y consumibles

---

## Notes

Sector sanitario — los servicios médicos están **exentos de IVA** (Art. 20 LIVA, asistencia sanitaria). Los productos sanitarios de venta (tiritas, material ortopédico) tributan al 4% o 10%. La historia clínica electrónica debe cumplir la normativa de protección de datos sanitarios (LOPD y Ley 41/2002). El acceso a los registros del paciente está restringido por rol.
