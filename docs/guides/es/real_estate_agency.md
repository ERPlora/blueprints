# Setup Guide: Real Estate Agency

> Configure your Real Estate Agency hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una inmobiliaria en Sevilla. Se llama "Inmobiliaria Giralda". Compramos y vendemos pisos, locales y viviendas de segunda mano. Gestionamos el CRM de clientes, las visitas y el seguimiento hasta la firma. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

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
