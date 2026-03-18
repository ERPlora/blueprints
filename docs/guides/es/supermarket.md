# Guía de configuración: Supermarket

> Configura tu Supermarket desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo un supermercado de barrio en Valencia. Se llama "Súper La Huerta". Vendemos alimentación fresca, congelados, droguería y bebidas. Tenemos báscula, lector de código de barras y programa de fidelización. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Súper La Huerta S.L.", dirección "Calle de la Paz 56, 46003 Valencia", CIF B46345678, teléfono 963 345 678, email superlahuerta@gmail.com
- IVA: múltiples tipos. Frutas/verduras 4%, alimentación básica 4%, alimentación elaborada 10%, droguería/higiene 21%
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - María José Martín (Cashier, PIN 1234)
  - Tomás García (Stock Clerk, PIN 5678)
  - Rosa Navarro (Manager, PIN 9012)

- Productos:
  - Leche entera 1L (0,99€)
  - Pan de molde (1,45€)
  - Arroz 1kg (1,20€)
  - Aceite de oliva 1L (4,90€)
  - Tomates frescos (€/kg — 2,20€/kg)
  - Detergente lavadora (5,50€)
  - Cerveza pack 6 (4,80€)
  - Yogur pack 4 (1,60€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Multi-register POS with barcode scanner and scale |
| customers | Loyalty program management |
| inventory | Large catalog with expiry date tracking and reorder points |
| invoicing | Issue tickets and invoices for businesses |
| sales | High-volume retail sales management |
| tax | Multi-rate tax — 4%, 10%, 21% by product category |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Cashier | sales, cash register |
| Stock Clerk | inventory, view-only purchase orders |
| Manager | sales, inventory, cash register, view reports |

---

## Typical use cases

- Escanear productos con código de barras y cobrar rápidamente en caja
- Controlar las fechas de caducidad y hacer rotación FIFO de los productos
- Gestionar el programa de puntos de fidelización con tarjeta de cliente
- Hacer inventario periódico con escáner de mano

---

## Notes

Sector retail alimentario — múltiples tipos de IVA que deben asignarse correctamente por producto: 4% (pan, leche, frutas, verduras, huevos), 10% (alimentos elaborados, pastelería, conservas, bebidas no alcohólicas), 21% (bebidas alcohólicas, tabaco, artículos de droguería, higiene personal). La báscula debe estar homologada. Los productos con fecha de caducidad próxima deben retirarse antes de expirar.
