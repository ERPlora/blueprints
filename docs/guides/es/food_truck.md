# Setup Guide: Food Truck

> Configure your Food Truck hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo un food truck en Granada. Se llama "Ruta del Sabor Food Truck". Vendemos bocadillos gourmet, tapas y refrescos en mercadillos, eventos y ubicaciones rotativas. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Ruta del Sabor Food Truck", dirección "Calle Recogidas 45, 18005 Granada", CIF B18234567, teléfono 958 234 567, email rutadelsabor@foodtruck.es
- IVA: 10% incluido en precios. Clases: IVA reducido (10%) para comida y bebidas
- Métodos de pago: efectivo, tarjeta (datáfono portátil), bizum
- Productos:
  - Bocadillo ibérico (6,50€)
  - Bocadillo pollo crujiente (5,50€)
  - Tapa de croquetas x3 (3,50€)
  - Refresco lata (2,00€)
  - Agua (1,50€)
  - Cerveza (2,50€)
  - Tapa de patatas bravas (3,00€)
  - Combo bocadillo + refresco (7,50€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | Mobile POS with card reader and cash management |
| inventory | Stock loaded per service day — ingredient management |
| invoicing | Issue simplified receipts on the go |
| sales | Quick sales registration with minimal steps |
| tax | Tax configuration — 10% reducido |

---

## Roles

No defined roles — the food truck owner typically operates alone or with one helper.

---

## Typical use cases

- Cargar el inventario diario antes de cada servicio según previsión de demanda
- Cobrar rápidamente con datáfono portátil y bizum
- Gestionar el cierre de caja al final de cada servicio
- Controlar los productos más vendidos en cada ubicación

---

## Notes

Sector hostelería — IVA al 10% para comida y bebidas preparadas. Los food trucks operan frecuentemente en mercadillos, festivales y eventos. El menú reducido facilita la gestión del stock: cargar solo lo necesario para cada servicio. El datáfono portátil es esencial ya que los clientes suelen pagar con tarjeta o bizum. Verificar que la licencia municipal permite operar en cada ubicación.
