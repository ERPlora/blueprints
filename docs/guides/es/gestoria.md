# Guia de configuracion: Gestoria / Asesoria Fiscal

> Configura tu Gestoria desde cero con el Asistente IA de ERPlora.
> Todos los comandos se envian al Asistente en `/m/assistant/`.

---

## Paso 1 — Describe tu negocio

Envia este mensaje como primero al Asistente IA:

```
Hola! Tengo una gestoria administrativa y asesoria fiscal en Valencia. Se llama "Gestoria Navarro & Asociados". Ofrecemos servicios de contabilidad, fiscalidad, nominas, laboral y mercantil tanto a autonomos como a PYMES (SL, SA). Llevamos la contabilidad completa de nuestros clientes, presentamos sus impuestos trimestrales y anuales, gestionamos sus nominas y realizamos tramites ante la administracion (altas, bajas, certificados, escrituras). Necesito configurar todo el sistema.
```

El asistente detectara tu tipo de negocio e instalara los modulos adecuados. El hub se reiniciara (1-2 min).

---

## Paso 2 — Configura todo

Tras el reinicio, envia este mensaje de configuracion completo:

```
Perfecto, ya estan los modulos. Configura todo esto:

- Datos del negocio: nombre "Gestoria Navarro & Asociados S.L.", direccion "Calle Colon 42, 3o B, 46004 Valencia", CIF B96345678, telefono 963 456 789, email info@gestorianavarro.es
- IVA: 21% no incluido en precios. Clases: IVA general (21%) para servicios profesionales
- Metodos de pago: transferencia bancaria, domiciliacion bancaria, tarjeta
- Empleados:
  - Antonio Navarro (Gestor Senior, PIN 1234)
  - Elena Rodriguez (Gestor Junior, PIN 5678)
  - Carmen Ruiz (Administrativo, PIN 9012)
  - Pablo Garcia (Administrativo, PIN 3456)
- Servicios (categorias):
  - Asesoria fiscal basica autonomos: 65 EUR/mes
  - Asesoria fiscal empresa SL: 150 EUR/mes
  - Contabilidad completa PYME: 200 EUR/mes
  - Nominas (por trabajador): 12 EUR/nomina
  - Declaracion de la renta (IRPF): 60 EUR
  - Constitucion de SL: 400 EUR
  - Alta autonomo / cambio epigrafe: 50 EUR
  - Modelo 720 (declaracion bienes extranjero): 120 EUR
  - Impuesto de sociedades: 250 EUR
  - Certificados y gestiones puntuales: 40 EUR
- Categorias de clientes: Autonomos, PYMES (SL/SA), Comunidades de bienes, Particulares

Ejecuta todo sin mas preguntas.
```

---

## Modules installed

| Module | Purpose |
|--------|---------|
| customers | Base de datos de clientes con CIF/NIF, datos fiscales y categorias |
| invoicing | Emision de facturas mensuales a clientes por servicios de asesoria |
| accounting | Contabilidad de la propia gestoria y registro de asientos |
| tax | Configuracion de IVA, clases fiscales, modelos trimestrales y anuales |
| expenses | Control de gastos propios de la gestoria (suministros, seguros, software) |
| fiscal_es | Cumplimiento fiscal espanol: modelos 303, 111, 115, 347, 390, IS |
| calendar | Calendario fiscal con recordatorios de plazos de presentacion |
| documents | Gestion documental: archivos de clientes, escrituras, contratos |
| crm | Seguimiento comercial de prospectos y cartera de clientes |
| contracts | Contratos de servicio y acuerdos de asesoria con clientes |
| tasks | Gestion de tareas y seguimiento de pendientes por cliente |
| time_control | Registro de horas por cliente para control de rentabilidad |

---

## Roles

| Role | Key permissions |
|------|----------------|
| Gestor Senior | Acceso completo: clientes, facturacion, contabilidad, fiscal, configuracion, informes |
| Gestor Junior | Clientes, tareas, contabilidad, fiscal (sin configuracion), documentos |
| Administrativo | Tareas asignadas, documentos, calendario, registro de horas, vista de clientes |

---

## Typical use cases

### Alta de nuevo cliente
1. Registrar cliente en `customers` con sus datos fiscales (CIF/NIF, epigrafe, regimen IVA)
2. Crear contrato de servicio en `contracts` con las tarifas acordadas
3. Configurar tareas recurrentes en `tasks` (trimestrales, mensuales, anuales)

### Ciclo trimestral fiscal
1. Recibir documentacion del cliente (facturas emitidas y recibidas)
2. Contabilizar en `accounting` los movimientos del trimestre
3. Preparar y revisar los modelos fiscales en `fiscal_es` (303, 111, 115)
4. Presentar ante la AEAT antes de los plazos (20 de abril, julio, octubre, enero)
5. Archivar justificantes de presentacion en `documents`

### Facturacion mensual a clientes
1. Revisar servicios prestados del mes en `time_control` y `tasks`
2. Generar facturas en `invoicing` segun contrato (cuota fija + servicios extra)
3. Enviar facturas por email y registrar cobros

### Gestion de nominas
1. Recibir incidencias del mes (bajas, horas extra, nuevas altas)
2. Calcular nominas por trabajador
3. Facturar al cliente el servicio de nominas (12 EUR x trabajador)

### Preparacion de impuesto de sociedades
1. Cierre contable del ejercicio en `accounting`
2. Calcular resultado y base imponible
3. Preparar modelo 200 en `fiscal_es`
4. Presentar antes del 25 de julio

### Campana de renta (abril-junio)
1. Recopilar datos de clientes particulares
2. Preparar borrador y declaracion IRPF
3. Facturar servicio (60 EUR por declaracion)

---

## Notes

### Sector y marco regulatorio

Las gestorias y asesorias fiscales en Espana son despachos profesionales que actuan como intermediarios entre sus clientes y la administracion tributaria (AEAT). Requieren colegiacion en el caso de gestores administrativos. El sector se rige por la Ley 34/2006 de acceso a las profesiones de abogado y procurador, y la normativa de los Colegios de Gestores Administrativos.

### Modelo de precios tipico

- **Cuota fija mensual**: la mayoria de gestorias trabajan con tarifas fijas por cliente segun su complejidad (autonomo: 50-80 EUR/mes, SL: 100-200 EUR/mes, SA: 200-500 EUR/mes)
- **Servicios puntuales**: tramites concretos se facturan por unidad (constituciones, altas, declaraciones de renta)
- **Nominas**: se cobra un fijo por trabajador y mes (8-15 EUR/nomina)
- **IVA al 21%**: al ser servicios B2B, los precios siempre se expresan sin IVA

### Como ERPlora ayuda

- **Calendario fiscal automatizado**: el modulo `calendar` + `fiscal_es` avisa de los plazos de presentacion, evitando sanciones por retraso
- **Control de rentabilidad por cliente**: `time_control` permite saber cuanto tiempo real se dedica a cada cliente vs. lo que se factura
- **Facturacion automatica**: `invoicing` + `contracts` permite generar las facturas mensuales de forma recurrente
- **Archivo digital**: `documents` centraliza toda la documentacion de cada cliente, facilitando auditorias y consultas
- **CRM para captacion**: `crm` permite hacer seguimiento de potenciales clientes y gestionar la cartera comercial
