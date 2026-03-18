# Guía de configuración: Veterinary Clinic

> Configura tu Veterinary Clinic desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una clínica veterinaria en Valencia. Se llama "Clínica Veterinaria VetNova". Atendemos perros, gatos y pequeños animales. Hacemos consultas, vacunaciones, cirugías y vendemos productos veterinarios. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Clínica Veterinaria VetNova S.L.", dirección "Calle Jesús 34, 46007 Valencia", CIF B46234567, teléfono 963 234 567, email info@vetnova.es
- IVA: 21% incluido para servicios veterinarios. 10% para medicamentos veterinarios. 4% para piensos terapéuticos
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Dr. Antonio Soler (Veterinarian, PIN 1234)
  - Marta Pérez (Veterinary Assistant, PIN 5678)
  - Carmen López (Receptionist, PIN 9012)

- Servicios:
  - Consulta general (35€)
  - Vacuna antirrábica (25€)
  - Vacuna múltiple (30€)
  - Desparasitación interna (15€)
  - Análisis de sangre básico (45€)
  - Castración gato (120€)
  - Limpieza dental (85€)
  - Chip identificativo (25€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Multi-vet appointment scheduling with consultation room |
| cash_register | Patient payments at reception |
| customers | Owner database with pet profiles |
| inventory | Vaccines, medications, and supplies stock |
| invoicing | Issue invoices with detailed treatment breakdown |
| patient_records | Pet clinical history, vaccinations, and treatment plans |
| sales | Service and product sales at reception |
| tax | Multi-rate configuration — 21% services, 10% medications |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Veterinarian | full patient records, appointments, services, customers, view-only inventory, sales |
| Veterinary Assistant | view patient records, appointments, view-only customers and inventory, sales |
| Receptionist | appointments, customers, sales, cash register |

---

## Typical use cases

- Gestionar la historia clínica de cada paciente (mascota) por propietario
- Controlar el calendario de vacunaciones con avisos automáticos al propietario
- Gestionar el stock de vacunas con temperatura de conservación y caducidad
- Emitir la factura al propietario con el detalle de consulta, medicamentos y servicios

---

## Notes

Sector sanitario veterinario — IVA al 21% para servicios veterinarios (consultas, cirugías). IVA al 10% para medicamentos veterinarios. IVA al 4% para piensos dietéticos con prescripción. El chip de identificación es obligatorio para perros en toda España y para gatos en algunas CC.AA. El libro de registro de medicamentos psicotrópicos es obligatorio. La custodia y prescripción de antibióticos requiere receta veterinaria oficial.
