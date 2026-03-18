# Setup Guide: Electronics & IT

> Configure your Electronics & IT hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una tienda de electrónica e informática en Gijón. Se llama "TecnoPlaza Asturias". Vendemos móviles, portátiles, tablets y accesorios. También hacemos reparaciones técnicas y aceptamos dispositivos a cambio. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "TecnoPlaza Asturias", dirección "Calle Corrida 34, 33201 Gijón", CIF B33456789, teléfono 985 234 567, email info@tecnoplazaasturias.es
- IVA: 21% incluido en precios. Clases: IVA general (21%) para electrónica y servicios técnicos
- Métodos de pago: efectivo, tarjeta, financiación (Cofidis), bizum
- Empleados:
  - Rubén Álvarez (Sales Assistant, PIN 1234)
  - Iván García (Technician, PIN 5678)

- Productos:
  - Samsung Galaxy A55 (329€)
  - iPhone 15 (799€)
  - Portátil HP 15s (549€)
  - Tablet iPad 10ª gen (379€)
  - Funda universal (15€)
  - Cable USB-C (12€)
  - Auriculares inalámbricos (49€)
  - Powerbank 20000mAh (35€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with serial number capture at sale |
| customers | Customer database with purchase history and warranty records |
| inventory | Serial number tracking per device, warranty management |
| invoicing | Issue invoices with serial number detail for warranty |
| sales | Record product and repair service sales |
| tax | Tax configuration — 21% for electronics |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Sales Assistant | sales, cash register, view-only customers |
| Technician | maintenance/repairs, view-only inventory |

---

## Typical use cases

- Vender productos con registro automático del número de serie para garantía
- Gestionar reparaciones técnicas con diagnóstico, presupuesto y plazo de entrega
- Tramitar cambios y trade-ins con valoración del dispositivo usado
- Ofrecer financiación con gestión del contrato de crédito

---

## Notes

Sector retail — IVA al 21% para electrónica de consumo. El registro del número de serie es esencial para gestionar garantías (2 años legales en España). Los dispositivos de segunda mano pueden acogerse al REBU (Régimen Especial de Bienes Usados) para no cobrar IVA completo. Las reparaciones se facturan separando mano de obra y piezas. Es recomendable pedir firma del cliente antes de abrir un dispositivo para reparación.
