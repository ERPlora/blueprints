# Guía de configuración: Fashion Retail

> Configura tu Fashion Retail desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una tienda de ropa y moda en Salamanca. Se llama "Boutique Estilo Propio". Vendemos ropa de mujer, hombre y accesorios. Manejamos tallas, colores, temporadas y tenemos programa de fidelización. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Boutique Estilo Propio", dirección "Calle Zamora 24, 37002 Salamanca", CIF B37234567, teléfono 923 234 567, email estilopr@boutique.es
- IVA: 21% incluido en precios. Clases: IVA general (21%) para ropa y accesorios
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Beatriz Ramos (Sales Assistant, PIN 1234)
  - Elena Cruz (Stock Clerk, PIN 5678)

- Productos:
  - Camiseta básica mujer (19,99€)
  - Jeans skinny mujer (49,99€)
  - Vestido casual (59,99€)
  - Camiseta hombre (22,99€)
  - Pantalón chino hombre (44,99€)
  - Bolso de mano (39,99€)
  - Cinturón de piel (25,99€)
  - Bufanda (18,99€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with barcode scanning for tagged items |
| customers | Customer database with purchase history and loyalty program |
| inventory | Size/color variant management, season collections, stock per SKU |
| invoicing | Issue invoices and simplified receipts |
| sales | Record sales with variant selection and discount management |
| tax | Tax configuration — 21% for clothing and accessories |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Sales Assistant | sales, cash register, view-only customers |
| Stock Clerk | full inventory management |

---

## Typical use cases

- Gestionar el stock por talla y color con alertas de ruptura por SKU
- Aplicar descuentos masivos de temporada (rebajas) a colecciones completas
- Gestionar el programa de fidelización con puntos o descuentos acumulados
- Controlar las devoluciones y cambios con política clara por temporada

---

## Notes

Sector retail moda — IVA al 21% para ropa y accesorios. Las rebajas de temporada pueden aplicarse como descuento porcentual sobre colecciones enteras. La gestión de variantes (talla/color) es clave para evitar rupturas de stock en las tallas más demandadas. Las devoluciones e intercambios son frecuentes y deben registrarse correctamente para ajustar el inventario.
