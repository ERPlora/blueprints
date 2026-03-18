# Guía de configuración: Real Estate Agency

> Configura tu Real Estate Agency desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una inmobiliaria en Sevilla. Se llama "Inmobiliaria Giralda". Compramos y vendemos pisos, locales y viviendas de segunda mano. Gestionamos el CRM de clientes, las visitas y el seguimiento hasta la firma. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Inmobiliaria Giralda S.L.", dirección "Avenida de la Constitución 23, 41001 Sevilla", CIF B41012345, teléfono 954 012 345, email info@inmobiliariagiralda.es
- IVA: 21% no incluido en honorarios. Clases: IVA general (21%) para servicios de intermediación inmobiliaria
- Métodos de pago: transferencia bancaria, cheque bancario
- Empleados:
  - Ana Serrano (Real Estate Agent, PIN 1234)
  - Daniel Ruiz (Manager, PIN 5678)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | Mandate contracts and sales agreements |
| customers | Client database — buyers, sellers, and landlords |
| invoicing | Commission invoicing on successful transactions |
| leads | Lead management and prospect pipeline |
| tax | Tax configuration — 21% for intermediation fees |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Real Estate Agent | leads, customers, view-only contracts |
| Manager | leads, customers, full contracts, invoicing, view reports |

---

## Typical use cases

- Gestionar el pipeline de leads desde el primer contacto hasta la firma de escritura
- Programar visitas a propiedades con confirmación al comprador y vendedor
- Hacer el seguimiento de las propiedades captadas con estado y precio
- Calcular y emitir la factura de honorarios al cerrar una operación

---

## Notes

Sector inmobiliario — los honorarios de intermediación inmobiliaria tributan al 21%. La venta de vivienda de segunda mano entre particulares no lleva IVA (se paga ITP por el comprador). Las inmobiliarias deben registrarse en el IPREM/RAIT (Registro de Agentes Inmobiliarios) en las comunidades que lo exigen. Las operaciones de alquiler tienen retención IRPF del 19% en los honorarios pagados por empresas.
