# Guía de configuración: Physiotherapy

> Configura tu Physiotherapy desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una clínica de fisioterapia en Bilbao. Se llama "FisioSalud Bilbao". Hacemos fisioterapia traumatológica, deportiva y rehabilitación. Tenemos varios fisioterapeutas y gestionamos bonos de sesiones. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "FisioSalud Bilbao S.L.", dirección "Calle Licenciado Poza 34, 48011 Bilbao", CIF B48678901, teléfono 944 678 901, email info@fisiosalud-bilbao.es
- IVA: exento de IVA para servicios de fisioterapia. Clases: exento Art. 20 LIVA
- Métodos de pago: efectivo, tarjeta, mutua laboral, seguro médico
- Empleados:
  - Lda. Amaia Gaztañaga (Manager, PIN 1234)

- Servicios:
  - Sesión fisioterapia 30min (35€)
  - Sesión fisioterapia 50min (50€)
  - Bono 10 sesiones 50min (430€)
  - Bono 5 sesiones 50min (225€)
  - Electroterapia (25€)
  - Punción seca (40€)
  - Valoración inicial (40€)
  - Masaje terapéutico 30min (35€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Therapist scheduling with room and equipment assignment |
| cash_register | Patient payments at reception |
| customers | Patient database with evolution history |
| inventory | Physiotherapy materials and consumables stock |
| invoicing | Issue invoices and insurance billing documents |
| sales | Record treatment charges and bono sales |
| services | Service catalog with duration and therapist assignment |
| tax | Tax configuration — exempt physiotherapy services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Gestionar la agenda de fisioterapeutas con cabina y equipo asignado
- Controlar los bonos de sesiones con seguimiento de sesiones consumidas
- Registrar la evolución del paciente por sesión (dolor, movilidad, ejercicios)
- Facturar a mutuas laborales y aseguradoras con los códigos de prestación

---

## Notes

Sector sanitario — los servicios de fisioterapia prestados por fisioterapeutas colegiados están **exentos de IVA** (Art. 20 LIVA). Los bonos de sesiones permiten fidelizar pacientes con pago anticipado y descuento. El registro de evolución por sesión es clave para justificar el tratamiento ante seguros y mutuas. El fisioterapeuta debe estar colegiado en el Colegio de Fisioterapeutas de su Comunidad Autónoma.
