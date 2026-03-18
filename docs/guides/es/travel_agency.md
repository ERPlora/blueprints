# Guía de configuración: Travel Agency

> Configura tu Travel Agency desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una agencia de viajes en Madrid. Se llama "Viajes Horizonte". Vendemos paquetes vacacionales, vuelos, hoteles y cruceros. Trabajamos con IATA y ATOL. Gestionamos presupuestos de viaje personalizados y comisiones de proveedores. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Viajes Horizonte S.L.", dirección "Calle Preciados 34, 28013 Madrid", CIF B28234567, teléfono 915 234 567, email info@viajeshorizonte.es
- IVA: 21% no incluido en honorarios de agencia. Paquetes turísticos: Régimen Especial Agencias de Viajes (REAV)
- Métodos de pago: tarjeta, transferencia bancaria, financiación
- Empleados:
  - Isabel Cano (Travel Agent, PIN 1234)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Deposits and on-site payments |
| customers | Client database with travel history and preferences |
| inventory | Travel package catalog and availability |
| invoicing | Issue travel invoices under REAV regime |
| quotes | Custom travel quote creation with itineraries |
| sales | Package and component sales |
| tax | Tax configuration — REAV regime for travel packages |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Travel Agent | customers, quotes, invoicing, view-only contracts |

---

## Typical use cases

- Crear presupuestos de viaje personalizados con vuelo, hotel y actividades
- Gestionar el seguimiento de visados y documentación del cliente
- Controlar las comisiones recibidas de proveedores por cada venta
- Facturar bajo el Régimen Especial de Agencias de Viajes (REAV)

---

## Notes

Sector turismo — las agencias de viajes tributan bajo el **Régimen Especial de Agencias de Viajes (REAV)** donde el IVA se calcula sobre el margen de la agencia (precio de venta menos coste del viaje), no sobre el precio total. Los paquetes turísticos están sujetos a la Directiva UE de viajes combinados, con derecho del cliente a cancelar con reembolso íntegro si hay cambios sustanciales. Las agencias minoristas deben estar registradas en el registro de agencias de viajes de su Comunidad Autónoma y constituir el seguro de caución obligatorio.
