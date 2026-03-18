# Guía de configuración: Barbershop

> Configura tu Barbershop desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envían al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envía este mensaje como primero al Asistente IA:

```
Hola! Tengo una barbería en Madrid. Se llama "Barbería El Navalejo". Hacemos cortes de pelo, arreglo de barba y afeitado clásico. Aceptamos cita previa y walk-in. Necesito configurar todo el sistema.
```

El asistente detectará tu tipo de negocio e instalará los módulos adecuados. El hub se reiniciará (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envía este mensaje de configuración completo:

```
Perfecto, ya están los módulos. Configura todo esto:

- Datos del negocio: nombre "Barbería El Navalejo", dirección "Calle Fuencarral 67, 28004 Madrid", CIF B28345678, teléfono 913 456 789, email elnavalejo@gmail.com
- IVA: 21% incluido en precios. Clases: IVA general (21%) para servicios de peluquería
- Métodos de pago: efectivo, tarjeta, bizum
- Empleados:
  - Jesús Morales (Manager, PIN 1234)

- Servicios:
  - Corte de pelo (15€)
  - Arreglo de barba (10€)
  - Corte + barba (22€)
  - Afeitado clásico navaja (18€)
  - Degradado máquina (12€)
  - Tratamiento hidratante (8€)
  - Cejas (6€)

Ejecuta todo sin más preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| appointments | Appointment booking per barber with time slots |
| cash_register | POS and cash management |
| customers | Client profiles with haircut history and preferences |
| inventory | Stock for hair products, blades, and retail items |
| invoicing | Issue tickets and invoices |
| sales | Record service and product sales |
| services | Service catalog with duration and price |
| tax | Tax configuration — 21% for personal care services |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Manager | full access to all modules |

---

## Typical use cases

- Gestionar agenda de citas con cada barbero y franja horaria disponible
- Atender walk-ins con cola de espera cuando no hay cita disponible
- Registrar preferencias de corte de cada cliente para la próxima visita
- Vender productos de cuidado capilar junto al servicio

---

## Notes

Sector servicios personales — IVA al 21% (IVA general) para servicios de peluquería y barbería. Los servicios de barbería no tienen tipo reducido. La cola de walk-in permite atender clientes sin cita que llegan directamente. El historial de cliente permite recordar el estilo de corte preferido en cada visita.
