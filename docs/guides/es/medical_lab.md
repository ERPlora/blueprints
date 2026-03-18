# Guía de configuración: Medical Laboratory

> Configura tu Medical Laboratory desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo un laboratorio de análisis clínicos en Madrid. Se llama "Laboratorio BioMed Salud". Realizamos análisis de sangre, orina, microbiología y PCR. Atendemos a pacientes particulares y remitidos por médicos. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Laboratorio BioMed Salud S.L.", dirección "Calle Alberto Aguilera 34, 28015 Madrid", CIF B28345678, teléfono 915 345 678, email info@biomedsalud.es
- IVA: exento de IVA para análisis clínicos. Para productos sanitarios de venta: 4%
- Métodos de pago: efectivo, tarjeta, mutua médica
- Empleados:
  - Dr. Ignacio Blanco (Lab Technician, PIN 1234)
  - Carmen Vega (Receptionist, PIN 5678)

- Servicios:
  - Analítica básica (35€)
  - Hemograma completo (25€)
  - Bioquímica completa (45€)
  - Perfil lipídico (20€)
  - PSA (15€)
  - Cultivo de orina (30€)
  - PCR Covid/Flu (40€)
  - Análisis de heces (25€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Patient payments at reception |
| customers | Patient database with ID and insurance info |
| inventory | Reagents, consumables, and sample tubes stock |
| invoicing | Issue invoices and insurance billing |
| patient_records | Sample tracking, test requests, and results management |
| sales | Record analysis charges per patient |
| tax | Tax configuration — exempt analysis services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Lab Technician | full patient records, full inventory |
| Receptionist | customers, sales, cash register |

---

## Typical use cases

- Registrar la entrada de muestras con código de barras y paciente asignado
- Controlar el estado de cada analítica (recibida, en proceso, resultado disponible)
- Notificar al paciente por email/SMS cuando los resultados están listos
- Facturar a mutuas médicas con los códigos de prestación del catálogo

---

## Notes

Sector sanitario — los servicios de análisis clínicos están **exentos de IVA** (Art. 20 LIVA). Los productos sanitarios de venta directa (tiras reactivas, etc.) tributan al 4%. La custodia de muestras y resultados debe respetar los plazos mínimos legales. Los resultados de analíticas son datos sanitarios especialmente protegidos bajo LOPD. El laboratorio debe estar autorizado por la Comunidad Autónoma correspondiente.
