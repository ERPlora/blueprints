# Guía de configuración: Carpentry / Workshop

> Configura tu Carpentry / Workshop desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo un taller de carpintería en Pamplona. Se llama "Carpintería Artesana Iruña". Fabricamos muebles a medida, cocinas, puertas y escaleras. Trabajamos con presupuestos personalizados, lista de materiales y hacemos la instalación. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Carpintería Artesana Iruña", dirección "Polígono San Miguel, Calle B 8, 31191 Tajonar, Navarra", CIF B31234567, teléfono 948 345 678, email iruña@carpinteria.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%) para fabricación y montaje
- Métodos de pago: transferencia bancaria, 50% señal + 50% entrega
- Empleados:
  - Juan Iriarte (Master Craftsman, PIN 1234)
  - Elena Goñi (Sales Representative, PIN 5678)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Client database for residential and commercial clients |
| inventory | Wood, hardware, and materials stock management |
| invoicing | Issue invoices with advance payment and final billing |
| manufacturing | Production orders with cutting lists and work phases |
| purchase_orders | Order wood, hardware, and supplies from suppliers |
| quotes | Custom quotes with BOM and installation breakdown |
| tax | Tax configuration — 21% for custom manufacturing |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Master Craftsman | manufacturing, projects, full inventory |
| Sales Representative | quotes, customers, view-only invoicing |

---

## Typical use cases

- Crear presupuestos detallados con lista de materiales (lista de corte) por proyecto
- Gestionar órdenes de producción con fases de trabajo (corte, lijado, barnizado, montaje)
- Controlar el stock de madera y herrajes con reposición automática
- Coordinar la entrega e instalación con el cliente

---

## Notes

Sector fabricación — IVA al 21% no incluido en presupuestos a cliente final. Los presupuestos suelen incluir materiales + mano de obra desglosados. La señal del 50% al firmar el pedido se factura como pago anticipado. El módulo `manufacturing` permite crear la lista de corte exacta de materiales antes de empezar la producción.
