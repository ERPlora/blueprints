# Guía de configuración: Pharmacy / Parapharmacy

> Configura tu Pharmacy / Parapharmacy desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una farmacia en Córdoba. Se llama "Farmacia del Centro". Dispensamos medicamentos con y sin receta, tenemos parafarmacia, productos de ortopedia y cosmética. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Farmacia del Centro", dirección "Plaza de las Tendillas 8, 14001 Córdoba", CIF B14678901, teléfono 957 678 901, email farmaciadelcentro@gmail.com
- IVA: 4% para medicamentos con receta (IVA superreducido). 10% para productos sanitarios y parafarmacia. 21% para cosmética y perfumería
- Métodos de pago: efectivo, tarjeta, receta electrónica
- Empleados:
  - Dra. María Fernández (Pharmacist, PIN 1234)
  - Javier López (Sales Assistant, PIN 5678)

- Productos:
  - Ibuprofeno 600mg (caja) (3,50€)
  - Paracetamol 1g (caja) (2,80€)
  - Vitamina C 1g (10,50€)
  - Crema hidratante corporal (12,00€)
  - Protector solar SPF50 (18,00€)
  - Termómetro digital (8,50€)
  - Mascarilla FFP2 (1,20€)
  - Alcohol gel 500ml (5,00€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| cash_register | POS with barcode scanning for medication dispensing |
| customers | Patient database with purchase history and loyalty |
| inventory | Stock with batch/lot tracking and expiry date control |
| invoicing | Issue invoices and receipts |
| sales | Dispensing and product sales at the counter |
| tax | Tax configuration — multiple rates (4%, 10%, 21%) |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Pharmacist | sales, cash register, inventory, customers |
| Sales Assistant | sales, cash register |

---

## Typical use cases

- Gestionar el stock de medicamentos con control de lotes y fechas de caducidad
- Dispensar medicamentos con receta registrando el número de receta
- Controlar las alertas de stock mínimo para realizar pedidos a mayoristas
- Gestionar el programa de fidelización con puntos por compra

---

## Notes

Sector farmacia — múltiples tipos de IVA: 4% medicamentos con y sin receta incluidos en el sistema del SNS, 10% productos sanitarios y parafarmacia, 21% cosmética y perfumería. Las farmacias deben estar dirigidas por un farmacéutico colegiado. La dispensación de medicamentos de control especial (estupefacientes) requiere registro adicional. El control de lotes permite retirar con agilidad productos afectados por alertas sanitarias.
