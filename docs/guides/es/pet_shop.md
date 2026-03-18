# Guía de configuración: Pet Store

> Configura tu Pet Store desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una tienda de animales en Zaragoza. Se llama "Mundo Animal Zaragoza". Vendemos pienso, accesorios y productos para mascotas. También ofrecemos servicio de peluquería canina. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Mundo Animal Zaragoza", dirección "Calle Delicias 78, 50010 Zaragoza", CIF B50123456, teléfono 976 123 456, email mundoanimalzgz@gmail.com
- IVA: 10% incluido para piensos y alimentos animales (IVA reducido). 21% para accesorios y servicios de peluquería
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Silvia Moreno (Manager, PIN 1234)

- Productos:
  - Pienso perro adulto 10kg (28€)
  - Pienso gato esterilizado 3kg (18€)
  - Lecho para gatos 8L (9€)
  - Collar ajustable perro (8€)
  - Rascador para gato (25€)
  - Correa extensible (15€)
  - Snacks dental perro (6€)
  - Peluquería canina talla S (25€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS for counter sales |
| customers | Customer profiles with pet information |
| inventory | Product stock with expiry tracking for food |
| invoicing | Issue invoices and tickets |
| sales | Record product and grooming service sales |
| tax | Tax configuration — 10% food, 21% accessories and services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Gestionar el stock de piensos con control de caducidad y rotación FIFO
- Crear fichas de mascotas con raza, peso y condición médica para la peluquería
- Gestionar suscripciones de pienso con entrega periódica para clientes habituales
- Vender accesorios y productos de higiene en tienda con TPV

---

## Notes

Sector retail — IVA al 10% para piensos y alimentos para animales (IVA reducido alimentación). IVA al 21% para accesorios, juguetes, medicamentos veterinarios sin prescripción y servicios de peluquería. La venta de animales vivos requiere registro de establecimiento de cría y documentación de bienestar animal. Los piensos con fecha de caducidad próxima deben gestionarse con rotación FIFO.
