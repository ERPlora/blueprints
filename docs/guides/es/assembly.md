# Guía de configuración: Assembly Line

> Configura tu Assembly Line desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una línea de montaje en Vitoria. Se llama "Montajes Industriales Álava S.L.". Ensamblamos componentes electrónicos para equipos industriales, con control de números de serie, órdenes de trabajo y control de calidad en cada fase. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Montajes Industriales Álava S.L.", dirección "Polígono Industrial Júndiz, Calle C 14, 01015 Vitoria-Gasteiz", CIF B01234567, teléfono 945 123 456, email produccion@miaalava.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%), operaciones intracomunitarias
- Métodos de pago: transferencia bancaria, confirming
- Empleados:
  - Javier Ruiz (Production Manager, PIN 1234)
  - Aitor Fernández (Warehouse Worker, PIN 5678)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| inventory | Stock control for components, raw materials, and finished goods |
| invoicing | Issue invoices for assembled products to B2B customers |
| manufacturing | Work orders, BOM management, and production scheduling |
| purchase_orders | Order raw materials and components from suppliers |
| quality | Quality inspections and control at each production stage |
| tax | Tax configuration — IVA rates and intracomunitario |
| warehouse | Warehouse location management for inbound/outbound operations |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Production Manager | manufacturing, quality, full inventory management |
| Warehouse Worker | full inventory, warehouse operations |

---

## Typical use cases

- Gestionar órdenes de trabajo con lista de materiales (BOM) multinivel
- Registrar números de serie de componentes y productos terminados
- Controlar inspecciones de calidad en cada fase del montaje
- Planificar producción según pedidos y stock disponible

---

## Notes

Sector manufacturero — IVA al 21% no incluido (B2B). El seguimiento de números de serie es obligatorio para garantías y trazabilidad. Las órdenes de trabajo deben referenciar el BOM de cada producto antes de iniciar el montaje. El módulo `quality` permite registrar inspecciones y no-conformidades en cada etapa de la línea.
