# Guía de configuración: Tobacconist

> Configura tu Tobacconist desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo un estanco en Zaragoza. Se llama "Estanco Número 34". Vendemos tabaco, sellos, lotería y artículos de papelería. Los precios del tabaco son regulados y tenemos sincronización con el BOE. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Estanco Nº 34 - María Dolores Puértolas", dirección "Calle Alfonso I 45, 50003 Zaragoza", CIF 25123456B, teléfono 976 456 789, email estanco34zaragoza@gmail.com
- IVA: 21% incluido para artículos no regulados. El tabaco tiene recargo de equivalencia y precios fijos de venta al público
- Métodos de pago: efectivo, tarjeta
- Empleados:
  - María Dolores Puértolas (Manager, PIN 1234)

- Productos:
  - Marlboro rojo (5,40€)
  - Camel azul (5,20€)
  - Cigarros puro (desde 3,50€)
  - Tabaco de liar (3,80€)
  - Sello carta nacional (0,75€)
  - Sello Europa (0,90€)
  - Mechero Bic (1,50€)
  - Bolígrafo (0,80€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with regulated price management |
| inventory | Tobacco and non-tobacco product stock |
| invoicing | Issue receipts and invoices |
| sales | Counter sales with regulated price enforcement |
| tax | Tax configuration — tobacco regulated prices |
| tobacco | BOE price sync and tobacco-specific management |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Vender tabaco con los precios fijos regulados actualizados desde el BOE
- Gestionar el stock de tabaco y artículos de papelería
- Vender sellos y servicios de Correos como punto de atención
- Gestionar la comisión de lotería de Navidad y primitiva

---

## Notes

Sector retail regulado — los estancos son concesiones del Estado con exclusividad para vender tabaco. Los precios del tabaco son **precios fijos regulados** que actualiza el Comisionado para el Mercado de Tabacos y se publican en el BOE. El módulo `tobacco` sincroniza automáticamente los precios con el BOE para mantenerlos siempre actualizados. La venta de tabaco a menores de 18 años está prohibida y sancionada. Los estanqueros trabajan con recargo de equivalencia en IVA, lo que simplifica la gestión fiscal.
