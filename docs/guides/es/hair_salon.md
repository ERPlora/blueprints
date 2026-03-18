# Setup Guide: Hair Salon

> Configure your Hair Salon hub from scratch using the ERPlora AI Assistant.
> All commands below are sent to the Assistant at `/m/assistant/`.

---

## Step 1 — Describe your business

Send this as your first message to the AI Assistant:

```
Hola! Tengo una peluquería en Tarragona. Se llama "Salón de Belleza Helena". Hacemos cortes, coloración, tratamientos capilares y también vendemos productos de peluquería. Gestionamos citas y comisiones del personal. Necesito configurar todo el sistema.
```

The assistant will detect your business type and install the right modules. The hub will restart (1-2 min).

---

## Step 2 — Configure everything

After restart, send this complete configuration message:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Salón de Belleza Helena", dirección "Calle Rambla Nova 56, 43003 Tarragona", CIF B43234567, teléfono 977 345 678, email helena@salonbelleza.es
- IVA: 21% incluido en precios. Clases: IVA general (21%) para servicios de peluquería y venta de productos
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Helena Soler (Stylist, PIN 1234)

- Servicios:
  - Corte mujer (25€)
  - Corte hombre (18€)
  - Coloración completa (65€)
  - Mechas (80€)
  - Tratamiento keratina (90€)
  - Brushing (20€)
  - Tinte raíces (40€)
  - Manicura (20€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Appointment scheduling per stylist with duration |
| cash_register | POS and cash management |
| commissions | Staff commission calculation per service and product sale |
| customers | Client profiles with color formula and treatment history |
| inventory | Stock for colorants, treatments, and retail products |
| invoicing | Issue tickets and invoices |
| sales | Record service and product sales |
| services | Service catalog with duration, price, and stylist assignment |
| staff | Staff management with availability and commission rates |
| tax | Tax configuration — 21% for hairdressing services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Stylist | sales, appointments, view-only customers |

---

## Typical use cases

- Gestionar la agenda por estilista con duración de cada servicio
- Guardar la fórmula de coloración exacta de cada clienta para reproducirla
- Calcular las comisiones del personal por servicio prestado y productos vendidos
- Vender productos de peluquería profesional al detalle

---

## Notes

Sector servicios personales — IVA al 21% para servicios de peluquería. La ficha técnica de coloración por cliente es esencial para reproducir resultados exactos y evitar errores costosos. Las comisiones sobre ventas de productos incentivan al personal a recomendar productos en cabina. El módulo `commissions` calcula automáticamente las comisiones al cerrar cada venta.
