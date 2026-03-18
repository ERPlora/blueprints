# Guía de configuración: Psychology / Coaching

> Configura tu Psychology / Coaching desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una consulta de psicología en Barcelona. Se llama "Centro de Psicología Equilibrio". Ofrecemos terapia individual, de pareja y familiar. Trabajamos en consulta presencial y también online por videollamada. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Centro de Psicología Equilibrio", dirección "Carrer de Provença 234, piso 3, 08008 Barcelona", CIF B08567890, teléfono 931 567 890, email cita@psicologiaequilibrio.es
- IVA: exento de IVA para servicios de psicología. Clases: exento Art. 20 LIVA
- Métodos de pago: efectivo, tarjeta, bizum, transferencia bancaria
- Empleados:
  - Dra. Marta Soldevila (Psychologist, PIN 1234)

- Servicios:
  - Primera consulta (60€)
  - Sesión terapia individual 50min (70€)
  - Sesión terapia de pareja 60min (90€)
  - Sesión online 50min (65€)
  - Bono 10 sesiones individual (600€)
  - Bono 5 sesiones individual (320€)
  - Informe psicológico (150€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Therapist scheduling with session type (presential/online) |
| customers | Patient database with encrypted session notes |
| invoicing | Issue invoices with confidentiality |
| online_booking | Online appointment booking for patients |
| patient_records | Encrypted session notes and progress tracking |
| tax | Tax configuration — exempt psychological services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Psychologist | full patient records, appointments, view-only customers, view-only invoicing |

---

## Typical use cases

- Gestionar la agenda de sesiones presenciales y online por terapeuta
- Registrar notas de sesión con cifrado para proteger la confidencialidad del paciente
- Vender bonos de sesiones anticipadas con seguimiento de sesiones consumidas
- Ofrecer reserva online directa para reducir la fricción de los nuevos pacientes

---

## Notes

Sector sanitario — los servicios de psicología prestados por psicólogos colegiados están **exentos de IVA** (Art. 20 LIVA). Las notas de sesión son datos sanitarios especialmente sensibles bajo RGPD — deben cifrarse y acceder solo el terapeuta responsable. Los pacientes tienen derecho a la cancelación gratuita con 24h de antelación según la política habitual. El psicólogo debe estar colegiado en el Colegio Oficial de Psicólogos.
