# Guía de configuración: Law Firm

> Configura tu Law Firm desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo un despacho de abogados en Madrid. Se llama "Bufete Sánchez & Asociados". Nos especializamos en derecho laboral, civil y mercantil. Gestionamos expedientes de clientes, plazos procesales y facturación por horas. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Bufete Sánchez & Asociados S.L.P.", dirección "Calle Velázquez 23, 3ª planta, 28001 Madrid", CIF B28123456, teléfono 915 123 456, email contacto@bufetesanchez.es
- IVA: 21% no incluido en honorarios. Clases: IVA general (21%) para servicios jurídicos
- Métodos de pago: transferencia bancaria, domiciliación
- Empleados:
  - Licda. Carmen Sánchez (Lawyer, PIN 1234)
  - D. Pablo Medina (Partner, PIN 5678)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | Contracts of services and retainer agreements |
| customers | Client database with case assignments |
| doc_templates | Document templates for contracts, powers of attorney, letters |
| invoicing | Hourly and fixed-fee client billing |
| projects | Case management with phases and court deadlines |
| tasks | Task and deadline management per case |
| tax | Tax configuration — 21% for legal services |
| time_control | Legal timesheet for billable hours per case |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Lawyer | projects, tasks, time tracking, view-only customers, document templates |
| Partner | projects, customers, invoicing, contracts, view reports |

---

## Typical use cases

- Gestionar expedientes con plazos procesales y alertas de vencimiento
- Registrar horas de trabajo por expediente para facturación por tiempo
- Generar documentos jurídicos desde plantillas (poderes, contratos, escritos)
- Facturar honorarios con provisión de fondos anticipada

---

## Notes

Sector servicios profesionales — IVA al 21% para servicios jurídicos. La provisión de fondos anticipada es práctica habitual en abogacía. El control de plazos procesales es crítico — un plazo incumplido puede conllevar responsabilidad profesional. Los documentos del cliente tienen protección especial bajo el secreto profesional. El módulo `doc_templates` permite crear plantillas reutilizables para documentos frecuentes.
