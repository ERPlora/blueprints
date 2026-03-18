# Setup Guide: Property Management

> Configure your Property Management hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una empresa de gestión de fincas en Madrid. Se llama "Gestión Inmobiliaria Capital". Administramos comunidades de propietarios, alquileres residenciales y locales comerciales. Gestionamos el cobro de rentas, incidencias y la relación con propietarios e inquilinos. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Gestión Inmobiliaria Capital S.L.", dirección "Calle José Abascal 45, 28003 Madrid", CIF B28456789, teléfono 914 456 789, email info@gestioncapital.es
- IVA: 21% no incluido para honorarios de gestión. Arrendamientos según tipo (exento residencial, 21% comercial)
- Métodos de pago: domiciliación bancaria, transferencia bancaria
- Empleados:
  - Susana Morales (Property Manager, PIN 1234)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| contracts | Lease contracts and property management agreements |
| customers | Tenant and owner database with property assignments |
| invoicing | Rent invoicing and management fee billing |
| maintenance | Maintenance incident tracking per property |
| property_mgmt | Multi-property portfolio management |
| tax | Tax configuration — 21% management fees, exempt residential rents |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Property Manager | full property management, reservations, customers, invoicing, maintenance, contracts |

---

## Typical use cases

- Gestionar el cobro mensual de rentas con aviso de morosidad automático
- Registrar y gestionar incidencias de mantenimiento por propiedad
- Emitir informes de liquidación a los propietarios con detalle de ingresos y gastos
- Gestionar contratos de arrendamiento con fechas de inicio, fin y prórrogas

---

## Notes

Sector inmobiliario — los honorarios de gestión tributan al 21%. El arrendamiento de vivienda habitual está **exento de IVA**; el arrendamiento de locales comerciales y plazas de garaje tributa al 21%. La retención del IRPF en alquileres (19%) debe gestionarse correctamente en las facturas. La Ley de Arrendamientos Urbanos (LAU) regula los contratos, duración mínima y actualización de renta según IPC.
