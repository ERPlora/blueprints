# Flujo Fiscal Espana — Guia Completa

> Guia completa del flujo fiscal para negocios en Espana que usan ERPlora.
> No es una guia de configuracion — explica como funciona el ciclo fiscal completo, desde la venta diaria hasta la presentacion anual.

---

## 1. Introduccion

Si tienes un negocio en Espana, tienes obligaciones fiscales. No importa si eres autonomo con un salon de peluqueria o una sociedad con un restaurante: Hacienda espera que registres cada operacion, liquides el IVA trimestralmente y presentes declaraciones anuales.

### Que obligaciones fiscales tiene tu negocio

| Obligacion | Frecuencia | Quien |
|------------|------------|-------|
| Emitir factura por cada venta | Cada operacion | Todos |
| Llevar libros de IVA (emitidas y recibidas) | Continuo | Todos |
| Presentar Modelo 303 (IVA trimestral) | Trimestral | Todos (excepto recargo equivalencia) |
| Presentar Modelo 130 (IRPF) | Trimestral | Solo autonomos en estimacion directa |
| Presentar Modelo 390 (resumen anual IVA) | Anual | Todos |
| VERI*FACTU (cadena de facturas) | Cada factura | Todos (obligatorio desde 1 julio 2026) |
| Contabilidad segun PGC | Continuo | Sociedades obligatorio, autonomos recomendado |

### Autonomo vs. Sociedad (SL/SA)

| Aspecto | Autonomo | Sociedad (SL/SA) |
|---------|----------|------------------|
| IRPF trimestral (Modelo 130) | Si, 20% del rendimiento neto | No — paga Impuesto de Sociedades (lo hace la gestoria) |
| IVA trimestral (Modelo 303) | Si | Si |
| Contabilidad PGC | Recomendado | Obligatorio |
| Responsabilidad | Personal, ilimitada | Limitada al capital social |

### Que modulos de ERPlora cubren cada obligacion

```
invoicing       → Emision de facturas (base, obligatorio)
expenses        → Registro de compras y gastos
accounting      → Contabilidad PGC (asientos, balance, PyG)
tax             → Configuracion de tipos de IVA
verifactu       → VERI*FACTU: hash, QR, envio AEAT en tiempo real
fiscal_es       → Libros IVA, modelos 303/390/130, exports gestoria
gestoria_es     → Portal para tu gestor (opcional, de pago)
```

Todos estos modulos son **gratuitos** excepto `gestoria_es` (14,99 EUR/mes), que es opcional.

---

## 2. Flujo Diario — Operaciones

Cada dia, tu negocio genera ventas y tiene gastos. ERPlora registra todo automaticamente.

### Cuando vendes

1. **Cobras al cliente** en el TPV (caja registradora)
2. ERPlora **genera una factura** automaticamente (modulo `invoicing`)
3. **VERI*FACTU** sella la factura: calcula el hash SHA-256, genera el codigo QR y envia los datos a la AEAT (modulo `verifactu`)
4. La factura se registra en el **libro de facturas emitidas** (modulo `fiscal_es`)
5. Se crea un **asiento contable** automatico en el PGC (modulo `fiscal_es` + `accounting`)

### Cuando compras o tienes un gasto

1. **Registras la factura del proveedor** (modulo `expenses`)
2. Se registra en el **libro de facturas recibidas** (modulo `fiscal_es`)
3. Se crea un **asiento contable** automatico

### Ejemplo concreto: vendes un menu a 12 EUR

```
Menu del dia:  12,00 EUR (IVA 10% incluido)

Desglose:
  Base imponible:   10,91 EUR  (12 / 1.10)
  IVA repercutido:   1,09 EUR  (10,91 x 10%)
  Total:            12,00 EUR

Lo que pasa automaticamente:
  1. Factura emitida → serie + numero correlativo
  2. VERI*FACTU → hash SHA-256 encadenado con factura anterior → QR → AEAT
  3. Libro emitidas → nueva linea: fecha, NIF cliente, base 10,91, IVA 10%, cuota 1,09
  4. Asiento contable:
       Debe:  430 Clientes .............. 12,00 EUR
       Haber: 700 Ventas ................ 10,91 EUR
       Haber: 477 IVA repercutido .......  1,09 EUR
  5. Cuando cobras (efectivo/tarjeta):
       Debe:  572 Bancos (o 570 Caja) .. 12,00 EUR
       Haber: 430 Clientes .............. 12,00 EUR
```

Tu no haces nada de esto manualmente. ERPlora lo hace todo en el momento del cobro.

---

## 3. Flujo Trimestral — Declaraciones

Cada tres meses hay que liquidar el IVA con Hacienda. Si eres autonomo, tambien el IRPF.

### Calendario fiscal

| Trimestre | Periodo | Plazo de presentacion |
|-----------|---------|----------------------|
| 1T | Enero - Marzo | 1 al 20 de abril |
| 2T | Abril - Junio | 1 al 20 de julio |
| 3T | Julio - Septiembre | 1 al 20 de octubre |
| 4T | Octubre - Diciembre | 1 al 30 de enero (del ano siguiente) |

ERPlora genera alertas **15 dias antes** de cada plazo.

### Modelo 303 — IVA Trimestral

El Modelo 303 es la autoliquidacion del IVA. La formula es sencilla:

```
IVA repercutido (lo que has cobrado de IVA a tus clientes)
- IVA soportado (lo que has pagado de IVA a tus proveedores)
= Resultado
```

Si el resultado es **positivo**, debes ingresarlo en Hacienda. Si es **negativo**, puedes compensarlo en el trimestre siguiente o pedir la devolucion en el 4T.

#### Paso a paso en ERPlora

1. Ve a **Fiscal ES** en el menu lateral
2. Selecciona **Modelo 303**
3. Elige el trimestre (ej. 1T 2026)
4. Pulsa **Calcular** — ERPlora rellena todas las casillas automaticamente desde los libros de IVA
5. **Revisa** las cifras. Comprueba que cuadran con tu actividad
6. Pulsa **Exportar** — genera el XML (para importar en la sede electronica de la AEAT) y el PDF de resumen

#### Ejemplo: 1T de una cafeteria

```
Ventas del trimestre (IVA 10%):
  Base imponible total:     18.200 EUR
  IVA repercutido:           1.820 EUR

Compras del trimestre (IVA 21% y 10%):
  IVA soportado deducible:     890 EUR

Resultado Modelo 303:
  1.820 - 890 = 930 EUR a ingresar
```

### Modelo 130 — IRPF Autonomos

Solo si eres **autonomo en estimacion directa** (no sociedades).

```
Ingresos acumulados del ano hasta este trimestre
- Gastos deducibles acumulados
= Rendimiento neto

Rendimiento neto x 20% = Cuota
Cuota - Pagos fraccionados anteriores - Retenciones soportadas = A ingresar
```

#### Paso a paso en ERPlora

1. Ve a **Fiscal ES** → **Modelo 130**
2. Elige el trimestre
3. Pulsa **Calcular** — ERPlora acumula ingresos y gastos del ejercicio
4. **Revisa** y **Exporta**

**Importante**: el Modelo 130 es **acumulativo**. El 2T incluye los datos de enero a junio, no solo abril a junio. ERPlora lo calcula correctamente y resta los pagos fraccionados que ya has hecho.

---

## 4. Flujo Anual — Cierre Fiscal

En enero se cierra el ejercicio anterior con declaraciones anuales.

### Modelo 390 — Resumen Anual de IVA

El 390 es un resumen informativo que **agrega los 4 modelos 303** del ano. No genera nueva liquidacion — solo resume.

- Se presenta del 1 al 30 de enero (junto con el 4T del 303)
- ERPlora lo calcula automaticamente desde los cuatro 303 trimestrales
- Incluye: totales anuales por tipo impositivo, desglose por actividad (IAE), volumen de operaciones

### Cierre contable

Al cerrar el ejercicio, ERPlora genera:

- **Balance de situacion**: activo, pasivo y patrimonio neto a 31 de diciembre
- **Cuenta de Perdidas y Ganancias (PyG)**: ingresos menos gastos del ejercicio
- **Paquete anual completo** para tu gestoria

### Paso a paso

1. Asegurate de que los 4 trimestres estan cerrados y revisados
2. Ve a **Fiscal ES** → **Modelo 390** → **Calcular**
3. Revisa los totales anuales
4. Genera el **paquete anual** (ver seccion 5)

---

## 5. Envio a Gestoria

La mayoria de negocios tienen un gestor (asesor fiscal) que revisa y presenta las declaraciones con certificado digital. ERPlora facilita este proceso.

### Generar el paquete gestoria

1. Ve a **Fiscal ES** → **Export Gestoria**
2. Selecciona el periodo (trimestre o anual)
3. Elige el formato de tu gestoria (Excel, A3, Sage, o generico)
4. Pulsa **Generar paquete**

### Que contiene el ZIP trimestral

```
fiscal_{tu_negocio}_2026_T1.zip
├── libros/
│   ├── libro_emitidas_2026_T1.xlsx
│   ├── libro_emitidas_2026_T1.csv
│   ├── libro_recibidas_2026_T1.xlsx
│   └── libro_recibidas_2026_T1.csv
├── modelos/
│   ├── modelo_303_2026_T1.xml
│   ├── modelo_303_2026_T1.pdf
│   └── modelo_130_2026_T1.pdf    (si eres autonomo)
├── contabilidad/
│   ├── balance_situacion_2026_T1.xlsx
│   └── cuenta_resultados_2026_T1.xlsx
├── formatos_gestoria/
│   ├── a3_importacion_2026_T1.csv       (Wolters Kluwer)
│   ├── sage_importacion_2026_T1.csv     (ContaPlus/Sage 50c)
│   └── generic_importacion_2026_T1.csv  (universal)
└── resumen.pdf
```

El paquete **anual** incluye lo mismo para los 4 trimestres, mas el Modelo 390 y los informes anuales.

### Enviar al gestor

Dos opciones:

- **Email**: ERPlora envia el ZIP directamente al email de tu gestor configurado
- **Link de descarga**: se genera un enlace seguro (expira en 7 dias) que puedes compartir

El gestor recibe los datos, los importa en su software (A3, Sage, o el que use), revisa, y presenta las declaraciones con su certificado digital.

### Si tienes gestoria_es (portal de pago)

Con el modulo `gestoria_es` (14,99 EUR/mes), tu gestor tiene:

- Acceso directo al hub con su propio login (sin esperar emails)
- Dashboard con pendientes y plazos
- Revision de modelos en vivo, con correccion por casilla
- Aprobacion formal con firma (nombre + fecha + hash)
- Historial completo de actividad

---

## 6. Tipos de IVA en Espana

| Tipo | Porcentaje | Recargo Equiv. | Donde se aplica |
|------|-----------|----------------|-----------------|
| **General** | 21% | 5,2% | La mayoria de productos y servicios |
| **Reducido** | 10% | 1,4% | Hosteleria, alimentacion, transporte, vivienda nueva |
| **Superreducido** | 4% | 0,5% | Pan, leche, huevos, frutas, verduras, libros, medicamentos |
| **Exento** | 0% | — | Sanidad, educacion, seguros, servicios financieros |

### Ejemplos por tipo de negocio

| Negocio | IVA principal | Notas |
|---------|--------------|-------|
| Restaurante | 10% | Toda la comida y bebida servida en el local |
| Tienda de ropa | 21% | Producto general |
| Panaderia | 4% en pan basico, 10% en bolleria | Dos tipos en un mismo negocio |
| Clinica dental | Exento | Servicios sanitarios |
| Supermercado | 4%, 10% y 21% | Mezcla de tipos segun producto |
| Peluqueria | 21% | Servicios personales |

### Recargo de equivalencia

Solo aplica a **comercio minorista** operado por **persona fisica** (autonomo). Si eres minorista en recargo de equivalencia:

- Tu proveedor te cobra el IVA **mas** el recargo
- Tu **no presentas** Modelo 303
- El IVA ya esta liquidado en origen

ERPlora gestiona esto automaticamente si activas el recargo en la configuracion fiscal.

---

## 7. Regimenes Fiscales

### Autonomo (estimacion directa)

- Presentas: **Modelo 303** (IVA) + **Modelo 130** (IRPF) trimestralmente
- Anual: **Modelo 390** + declaracion de la renta (IRPF anual, lo hace la gestoria)
- ERPlora cubre el 303, 130 y 390 completos

### Sociedad (SL/SA)

- Presentas: **Modelo 303** (IVA) trimestralmente
- Anual: **Modelo 390** + **Impuesto de Sociedades** (Modelo 200, lo hace la gestoria)
- ERPlora cubre el 303 y 390. El Modelo 200 es responsabilidad del gestor

### Autonomo en recargo de equivalencia

- **No presentas Modelo 303** — el IVA se liquida en las compras
- Tu proveedor te carga IVA + recargo de equivalencia
- ERPlora registra las operaciones pero no genera el 303

### Cooperativa

- Regimen especial con particularidades en IVA y en Impuesto de Sociedades
- ERPlora genera los libros y el 303; las particularidades las gestiona el asesor

---

## 8. VERI*FACTU — Lo que necesitas saber

### Que es

VERI*FACTU es el sistema de la Agencia Tributaria (AEAT) para garantizar que las facturas no se manipulan despues de emitirse. Es similar a un blockchain simplificado: cada factura esta encadenada a la anterior mediante un hash criptografico.

### Cuando es obligatorio

**Desde el 1 de julio de 2026** para todos los negocios que usen software de facturacion (Real Decreto 1007/2023).

### Que hace ERPlora automaticamente

Cuando emites una factura, el modulo `verifactu` hace todo esto sin que intervengas:

1. **Calcula el hash SHA-256** de la factura, incluyendo el hash de la factura anterior (cadena inmutable)
2. **Genera el codigo QR** obligatorio con la URL de verificacion de la AEAT
3. **Envia los datos en formato XML** a la AEAT via SOAP (en tiempo real o dentro de 4 dias naturales)
4. **Sella el registro** — la factura ya no se puede modificar, solo anular con una rectificativa

### Lo que tu haces

**Nada.** VERI*FACTU es transparente. Sigues vendiendo como siempre y ERPlora se encarga de todo. Lo unico que veras diferente es el codigo QR en tus facturas.

### Excepciones

- **Pais Vasco** (Alava, Bizkaia, Gipuzkoa): usa TicketBAI en lugar de VERI*FACTU (modulo separado, pendiente)
- **Navarra**: tiene su propio sistema
- **Canarias, Ceuta y Melilla**: IGIC/IPSI en lugar de IVA, VERI*FACTU si aplica

---

## 9. Casos Especiales

### Facturas simplificadas (tickets)

Si la operacion es inferior a **400 EUR**, puedes emitir una factura simplificada (lo que antes se llamaba "ticket"). La diferencia:

| | Factura completa | Factura simplificada |
|---|---|---|
| NIF del cliente | Obligatorio | No obligatorio |
| Datos completos del cliente | Si | No necesario |
| Importe maximo | Sin limite | 400 EUR (3.000 EUR en ciertos sectores) |

ERPlora emite facturas simplificadas por defecto en ventas de TPV. Si el cliente pide factura completa (con sus datos), se genera desde la misma venta.

### Facturas rectificativas

Si te equivocas en una factura o hay una devolucion:

1. **No puedes borrar** la factura original (VERI*FACTU lo impide)
2. Emites una **factura rectificativa** que anula total o parcialmente la original
3. ERPlora genera los asientos inversos automaticamente
4. Ambas facturas (original y rectificativa) quedan en los libros

### Operaciones exentas

Algunos servicios estan exentos de IVA (sanidad, educacion, etc.):

- Se registran normalmente en el libro de facturas emitidas
- Aparecen en el Modelo 303 como operaciones exentas (casilla sin cuota)
- No generan IVA repercutido ni soportado

### Recargo de equivalencia como comprador

Si eres comercio minorista persona fisica con recargo de equivalencia:

- Tus proveedores te cobran IVA + recargo (ej. 21% + 5,2%)
- Tu **no presentas** Modelo 303
- Tu precio de venta al publico ya incluye todos los impuestos
- ERPlora registra todo pero desactiva la generacion del 303

---

## 10. Flujo Visual

### Flujo diario (cada operacion)

```
VENTA / COBRO
     │
     ▼
FACTURA (invoicing)
     │
     ├──→ VERI*FACTU (verifactu)
     │       │
     │       ├── Hash SHA-256 encadenado
     │       ├── Codigo QR
     │       └── Envio XML → AEAT
     │
     ├──→ LIBRO EMITIDAS (fiscal_es)
     │
     └──→ ASIENTO CONTABLE (accounting)
              │
              ├── 430 Clientes (Debe)
              ├── 700 Ventas (Haber)
              └── 477 IVA repercutido (Haber)
```

```
COMPRA / GASTO
     │
     ▼
REGISTRO GASTO (expenses)
     │
     ├──→ LIBRO RECIBIDAS (fiscal_es)
     │
     └──→ ASIENTO CONTABLE (accounting)
              │
              ├── 62x Gasto (Debe)
              ├── 472 IVA soportado (Debe)
              └── 410 Acreedores (Haber)
```

### Flujo trimestral

```
TRIMESTRE COMPLETO (ej. enero-marzo)
         │
         ▼
LIBROS IVA CERRADOS
         │
         ├──→ MODELO 303 (IVA)
         │       IVA repercutido - IVA soportado = Resultado
         │
         ├──→ MODELO 130 (IRPF, solo autonomos)
         │       20% rendimiento neto acumulado - pagos anteriores
         │
         └──→ PAQUETE GESTORIA (ZIP)
                 │
                 ├── Libros (Excel + CSV)
                 ├── Modelos (XML + PDF)
                 ├── Contabilidad (Balance + PyG)
                 └── Formatos gestoria (A3, Sage, generico)
                         │
                         ▼
              EMAIL + LINK DESCARGA
                         │
                         ▼
              GESTOR REVISA → PRESENTA EN AEAT
              (con certificado digital)
```

### Flujo anual

```
4 TRIMESTRES CERRADOS
         │
         ▼
MODELO 390 (resumen anual IVA)
         │
         ▼
CIERRE CONTABLE
  ├── Balance de situacion
  └── Cuenta de Perdidas y Ganancias
         │
         ▼
PAQUETE ANUAL GESTORIA
         │
         ▼
GESTOR → Modelo 200 (Sociedades) o IRPF (Autonomos) → AEAT
```

---

## Resumen: que hace ERPlora y que hace tu gestor

| Tarea | ERPlora (automatico) | Tu gestor |
|-------|---------------------|-----------|
| Emitir facturas | Si | — |
| VERI*FACTU (hash, QR, AEAT) | Si | — |
| Libros de IVA | Si | Revisa |
| Contabilidad PGC | Si | Revisa |
| Modelo 303 (IVA trimestral) | Calcula y exporta | Revisa y presenta |
| Modelo 130 (IRPF autonomos) | Calcula y exporta | Revisa y presenta |
| Modelo 390 (resumen anual) | Calcula y exporta | Revisa y presenta |
| Impuesto de Sociedades (200) | — | Lo hace el gestor |
| Declaracion de la renta (IRPF) | — | Lo hace el gestor |
| Presentar en sede electronica AEAT | Genera XML para importar | Presenta con certificado digital |

ERPlora hace el trabajo pesado: registra, calcula, genera los modelos y los exporta en el formato que necesite tu gestor. Tu gestor revisa que todo este correcto y lo presenta oficialmente ante Hacienda.

---

> **Nota**: Esta guia refleja la normativa fiscal espanola vigente a fecha de 2026. La legislacion puede cambiar — ERPlora se actualiza para cumplir con los requisitos legales en cada momento.
