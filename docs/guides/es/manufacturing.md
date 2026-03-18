# Guía de configuración: Manufacturing / Factory

> Configura tu Manufacturing / Factory desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una fábrica de componentes plásticos en Tarragona. Se llama "Plásti-Tec S.A.". Fabricamos piezas de plástico por inyección para el sector del automóvil. Tenemos BOM, órdenes de fabricación, control de calidad y almacén. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Plásti-Tec S.A.", dirección "Polígono Industrial La Canonja, Carrer A 12, 43110 La Canonja, Tarragona", CIF A43234567, teléfono 977 456 789, email produccion@plastictec.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%), operaciones intracomunitarias
- Métodos de pago: transferencia bancaria, confirming
- Empleados:
  - Rafael Torres (Production Manager, PIN 1234)
  - Miriam Costa (Warehouse Worker, PIN 5678)
  - Diego Roca (Sales Representative, PIN 9012)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | B2B client database with pricing contracts |
| inventory | Raw material and finished product stock management |
| invoicing | B2B invoicing and delivery note management |
| manufacturing | Work orders, BOM, MRP planning, and cost tracking |
| purchase_orders | Raw material procurement orders |
| quality | Quality inspections, non-conformities, and certifications |
| tax | Tax configuration — 21% and intracomunitario |
| warehouse | Warehouse management with location tracking |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Production Manager | manufacturing, quality, inventory, view-only purchase orders |
| Warehouse Worker | full inventory, warehouse |
| Sales Representative | quotes, customers, invoicing |

---

## Typical use cases

- Planificar la producción con MRP según pedidos de clientes y stock mínimo
- Gestionar órdenes de fabricación con BOM y seguimiento de cada fase
- Controlar la calidad con inspecciones en recepción de materiales y producto terminado
- Gestionar el almacén de producto terminado con ubicaciones y lotes

---

## Notes

Sector fabricación — IVA al 21% para ventas B2B. La planificación MRP calcula las necesidades de materiales según los pedidos de venta y el stock disponible. El control de calidad puede incluir certificaciones ISO 9001 que requieren documentar todas las no-conformidades. Las operaciones intracomunitarias (ventas a empresas de la UE) van sin IVA con declaración intrastat cuando superan los umbrales.
