-- Catálogo starter 'beauty' (peluquería / salón de belleza) — escrito a mano (NO generado).
-- Análogo de hospitality.sql para el vertical de SERVICIOS: en vez de un catálogo de
-- productos de inventory, siembra el arranque de una peluquería real: tipos de IVA,
-- categorías + servicios (services), estilistas + roles + horarios de cada uno (staff),
-- el horario de apertura del negocio (schedules) y una lista de tarifas (pricing).
--
-- hub_id = 00000000-0000-0000-0000-000000000001 (mismo literal demo que hospitality.sql; para
-- un hub por-tenant se reescribe este UUID, igual que build_starter_catalog.py acepta --hub-id).
--
-- CÓMO SE CARGA: idéntico a hospitality.sql / demo.sql. El runtime del Hub lo aplica una vez al
-- arrancar vía `HUB_SEED_SQL` (inline) o `HUB_SEED_SQL_PATH` (fichero) — ver
-- hub/crates/runtime/src/seed.rs::apply() (split por `;`, descarta líneas `--`, una sentencia por
-- execute_batch). Idempotente: cada sentencia usa `WHERE NOT EXISTS` / `ON CONFLICT` para poder
-- re-arrancar sin duplicar ni fallar. Portable SQLite/Postgres (ADR-0007): ids/refs TEXT, importes
-- INTEGER en céntimos, tasas % REAL, flags 0/1 INTEGER, fechas/horas ISO-8601 TEXT.
--
-- REQUISITO DE ORDEN: los módulos `taxes`, `services`, `staff` y `schedules` (y `pricing` para la
-- lista de tarifas) deben estar INSTALADOS antes de aplicar este seed (sus tablas deben existir).
-- `services` depende de `taxes` (ADR-0085: el IVA se enlaza por `tax_category_key` → categoría
-- canónica del módulo taxes, no por % crudo ni por id de taxes_rate). El módulo taxes siembra las
-- categorías + reglas ES al instalarse; este seed solo referencia la key `service.generic` (21 %).
--
-- Esquema real verificado contra las migraciones de cada módulo (modules-workspace/modules/*):
--   (taxes: el módulo `taxes` siembra las categorías canónicas + reglas ES; el seed no toca taxes_rate)
--   services_settings(id, hub_id, default_duration, default_buffer_time, default_tax_category_key, ...)
--   services_category(id, hub_id, name, slug, description, parent_id, icon, color, image,
--                     sort_order, is_active, is_deleted, ...auditoría)
--   services_service(id, hub_id, name, slug, ..., category_id, pricing_type, price[céntimos], cost,
--                    tax_category_key, duration_minutes, ..., image, icon, color, is_bookable, ...)
--   staff_role / staff_member / staff_schedule / staff_working_hours / staff_settings
--   schedules_settings / schedules_business_hours
--   pricing_price_list / pricing_price_list_item

-- ════════════════════════════════════════════════════════════════════════════════════════════
-- 1) IVA (ADR-0085). El blueprint ya NO siembra `taxes_rate` (tabla eliminada). El módulo `taxes`
--    siembra al instalarse la categoría canónica `service.generic` + la regla ES (21 %). Los
--    servicios solo declaran su `tax_category_key = 'service.generic'` y el módulo resuelve el tipo.
-- ════════════════════════════════════════════════════════════════════════════════════════════

-- ════════════════════════════════════════════════════════════════════════════════════════════
-- 2) Ajustes del módulo services (singleton por hub). Tipo de IVA por defecto = 21 %, precios e
--    duraciones visibles, reserva online activa, precios CON IVA incluido (uso habitual en salón).
-- ════════════════════════════════════════════════════════════════════════════════════════════

INSERT INTO services_settings (id, hub_id, default_duration, default_buffer_time, default_tax_category_key, show_prices, show_duration, allow_online_booking, include_tax_in_price, currency, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svcset-beauty', '00000000-0000-0000-0000-000000000001', 45, 5, 'service.generic', 1, 1, 1, 1, 'EUR', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_settings WHERE hub_id = '00000000-0000-0000-0000-000000000001');

-- ════════════════════════════════════════════════════════════════════════════════════════════
-- 3) Categorías de servicios (services_category). Iconos Iconify ion:. slug único por hub.
-- ════════════════════════════════════════════════════════════════════════════════════════════

INSERT INTO services_category (id, hub_id, name, slug, description, parent_id, icon, color, image, sort_order, is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'cat-beauty-corte', '00000000-0000-0000-0000-000000000001', 'Corte y peinado', 'corte-peinado', '', NULL, 'cut-outline', '', '', 0, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'corte-peinado');
INSERT INTO services_category (id, hub_id, name, slug, description, parent_id, icon, color, image, sort_order, is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'cat-beauty-color', '00000000-0000-0000-0000-000000000001', 'Color y mechas', 'color-mechas', '', NULL, 'color-palette-outline', '', '', 1, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'color-mechas');
INSERT INTO services_category (id, hub_id, name, slug, description, parent_id, icon, color, image, sort_order, is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'cat-beauty-tratamientos', '00000000-0000-0000-0000-000000000001', 'Tratamientos capilares', 'tratamientos-capilares', '', NULL, 'sparkles-outline', '', '', 2, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'tratamientos-capilares');
INSERT INTO services_category (id, hub_id, name, slug, description, parent_id, icon, color, image, sort_order, is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'cat-beauty-barberia', '00000000-0000-0000-0000-000000000001', 'Barbería', 'barberia', '', NULL, 'man-outline', '', '', 3, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'barberia');
INSERT INTO services_category (id, hub_id, name, slug, description, parent_id, icon, color, image, sort_order, is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'cat-beauty-unas', '00000000-0000-0000-0000-000000000001', 'Manicura y pedicura', 'manicura-pedicura', '', NULL, 'hand-left-outline', '', '', 4, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'manicura-pedicura');
INSERT INTO services_category (id, hub_id, name, slug, description, parent_id, icon, color, image, sort_order, is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'cat-beauty-estetica', '00000000-0000-0000-0000-000000000001', 'Estética y depilación', 'estetica-depilacion', '', NULL, 'flower-outline', '', '', 5, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'estetica-depilacion');

-- ════════════════════════════════════════════════════════════════════════════════════════════
-- 4) Servicios (services_service). price = CÉNTIMOS (ADR-0007). tax_category_key → IVA 21 %.
--    image = ref lógica `media:public/img/<beauty_hair|beauty_body>/*.webp` (la resuelve el proxy del SaaS).
--    pricing_type: 'fixed' precio cerrado | 'from' "desde" (color/mechas varían por melena).
-- ════════════════════════════════════════════════════════════════════════════════════════════

-- Corte y peinado
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-corte_senora', '00000000-0000-0000-0000-000000000001', 'Corte de señora', 'corte-senora', '', '', 'cat-beauty-corte', 'fixed', 1800, NULL, NULL, 0, 'service.generic', 45, 0, 5, 1, 'media:public/img/beauty_hair/corte_senora.webp', '', '', 1, 0, 1, 0, 1, 1, 'corte_senora', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'corte-senora');
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-corte_caballero', '00000000-0000-0000-0000-000000000001', 'Corte de caballero', 'corte-caballero', '', '', 'cat-beauty-corte', 'fixed', 1400, NULL, NULL, 0, 'service.generic', 30, 0, 5, 1, 'media:public/img/beauty_hair/corte_caballero.webp', '', '', 1, 0, 1, 1, 1, 0, 'corte_caballero', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'corte-caballero');
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-corte_nino', '00000000-0000-0000-0000-000000000001', 'Corte infantil', 'corte-infantil', '', '', 'cat-beauty-corte', 'fixed', 1100, NULL, NULL, 0, 'service.generic', 30, 0, 5, 1, 'media:public/img/beauty_hair/corte_nino.webp', '', '', 1, 0, 1, 2, 1, 0, 'corte_nino', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'corte-infantil');
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-lavado_peinado', '00000000-0000-0000-0000-000000000001', 'Lavar y peinar', 'lavar-peinar', '', '', 'cat-beauty-corte', 'fixed', 1500, NULL, NULL, 0, 'service.generic', 30, 0, 5, 1, 'media:public/img/beauty_hair/lavado_secado.webp', '', '', 1, 0, 1, 3, 1, 0, 'lavado_peinado', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'lavar-peinar');
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-recogido', '00000000-0000-0000-0000-000000000001', 'Recogido / peinado evento', 'recogido', '', '', 'cat-beauty-corte', 'from', 3500, 3500, NULL, 0, 'service.generic', 60, 0, 10, 1, 'media:public/img/beauty_hair/recogido.webp', '', '', 1, 1, 1, 4, 1, 0, 'recogido', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'recogido');

-- Color y mechas (pricing_type 'from': varían por largo/densidad)
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-tinte_completo', '00000000-0000-0000-0000-000000000001', 'Tinte completo', 'tinte-completo', '', '', 'cat-beauty-color', 'from', 3200, 3200, NULL, 0, 'service.generic', 75, 0, 10, 1, 'media:public/img/beauty_hair/tinte_completo.webp', '', '', 1, 0, 1, 0, 1, 1, 'tinte_completo', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'tinte-completo');
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-tinte_raiz', '00000000-0000-0000-0000-000000000001', 'Retoque de raíz', 'tinte-raiz', '', '', 'cat-beauty-color', 'fixed', 2500, NULL, NULL, 0, 'service.generic', 60, 0, 10, 1, 'media:public/img/beauty_hair/tinte_raiz.webp', '', '', 1, 0, 1, 1, 1, 0, 'tinte_raiz', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'tinte-raiz');
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-mechas', '00000000-0000-0000-0000-000000000001', 'Mechas', 'mechas', '', '', 'cat-beauty-color', 'from', 4500, 4500, NULL, 0, 'service.generic', 120, 0, 10, 1, 'media:public/img/beauty_hair/mechas.webp', '', '', 1, 0, 1, 2, 1, 1, 'mechas', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'mechas');
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-balayage', '00000000-0000-0000-0000-000000000001', 'Balayage', 'balayage', '', '', 'cat-beauty-color', 'from', 6500, 6500, NULL, 0, 'service.generic', 150, 0, 10, 1, 'media:public/img/beauty_hair/mechas_balayage.webp', '', '', 1, 1, 1, 3, 1, 0, 'balayage', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'balayage');

-- Tratamientos capilares
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-keratina', '00000000-0000-0000-0000-000000000001', 'Tratamiento de keratina', 'keratina', '', '', 'cat-beauty-tratamientos', 'from', 6000, 6000, NULL, 0, 'service.generic', 120, 0, 10, 1, 'media:public/img/beauty_hair/keratina.webp', '', '', 1, 1, 1, 0, 1, 0, 'keratina', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'keratina');
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-hidratacion', '00000000-0000-0000-0000-000000000001', 'Tratamiento hidratación', 'hidratacion', '', '', 'cat-beauty-tratamientos', 'fixed', 2000, NULL, NULL, 0, 'service.generic', 45, 0, 5, 1, 'media:public/img/beauty_hair/hidratacion.webp', '', '', 1, 0, 1, 1, 1, 0, 'hidratacion', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'hidratacion');

-- Barbería
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-arreglo_barba', '00000000-0000-0000-0000-000000000001', 'Arreglo de barba', 'arreglo-barba', '', '', 'cat-beauty-barberia', 'fixed', 1000, NULL, NULL, 0, 'service.generic', 20, 0, 5, 1, 'media:public/img/beauty_hair/perfilado_barba.webp', '', '', 1, 0, 1, 0, 1, 0, 'arreglo_barba', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'arreglo-barba');
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-afeitado_navaja', '00000000-0000-0000-0000-000000000001', 'Afeitado a navaja', 'afeitado-navaja', '', '', 'cat-beauty-barberia', 'fixed', 1500, NULL, NULL, 0, 'service.generic', 30, 0, 5, 1, 'media:public/img/beauty_hair/afeitado_navaja.webp', '', '', 1, 0, 1, 1, 1, 0, 'afeitado_navaja', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'afeitado-navaja');

-- Manicura y pedicura
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-manicura', '00000000-0000-0000-0000-000000000001', 'Manicura básica', 'manicura-basica', '', '', 'cat-beauty-unas', 'fixed', 1500, NULL, NULL, 0, 'service.generic', 30, 0, 5, 1, 'media:public/img/beauty_body/manicura_basica.webp', '', '', 1, 0, 1, 0, 1, 0, 'manicura_basica', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'manicura-basica');
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-manicura_semi', '00000000-0000-0000-0000-000000000001', 'Manicura semipermanente', 'manicura-semipermanente', '', '', 'cat-beauty-unas', 'fixed', 2200, NULL, NULL, 0, 'service.generic', 45, 0, 5, 1, 'media:public/img/beauty_body/manicura_semipermanente.webp', '', '', 1, 0, 1, 1, 1, 0, 'manicura_semi', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'manicura-semipermanente');
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-pedicura', '00000000-0000-0000-0000-000000000001', 'Pedicura básica', 'pedicura-basica', '', '', 'cat-beauty-unas', 'fixed', 1800, NULL, NULL, 0, 'service.generic', 45, 0, 5, 1, 'media:public/img/beauty_body/pedicura_basica.webp', '', '', 1, 0, 1, 2, 1, 0, 'pedicura_basica', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'pedicura-basica');

-- Estética y depilación
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-depilacion_cejas', '00000000-0000-0000-0000-000000000001', 'Depilación / diseño de cejas', 'depilacion-cejas', '', '', 'cat-beauty-estetica', 'fixed', 800, NULL, NULL, 0, 'service.generic', 15, 0, 5, 1, 'media:public/img/beauty_body/tinte_cejas.webp', '', '', 1, 0, 1, 0, 1, 0, 'depilacion_cejas', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'depilacion-cejas');
INSERT INTO services_service (id, hub_id, name, slug, description, short_description, category_id, pricing_type, price, min_price, max_price, cost, tax_category_key, duration_minutes, buffer_before, buffer_after, max_capacity, image, icon, color, is_bookable, requires_confirmation, allow_online_booking, sort_order, is_active, is_featured, sku, barcode, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'svc-beauty-limpieza_facial', '00000000-0000-0000-0000-000000000001', 'Limpieza facial', 'limpieza-facial', '', '', 'cat-beauty-estetica', 'fixed', 3500, NULL, NULL, 0, 'service.generic', 60, 0, 10, 1, 'media:public/img/beauty_body/limpieza_facial.webp', '', '', 1, 0, 1, 1, 1, 0, 'limpieza_facial', '', '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM services_service WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND slug = 'limpieza-facial');

-- ════════════════════════════════════════════════════════════════════════════════════════════
-- 5) Roles de staff (staff_role).
-- ════════════════════════════════════════════════════════════════════════════════════════════

INSERT INTO staff_role (id, hub_id, name, description, color, "order", is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'role-beauty-estilista', '00000000-0000-0000-0000-000000000001', 'Estilista', 'Corte, color y peinado', '#0091CE', 0, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_role WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Estilista');
INSERT INTO staff_role (id, hub_id, name, description, color, "order", is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'role-beauty-barbero', '00000000-0000-0000-0000-000000000001', 'Barbero', 'Corte y arreglo de barba', '#1B5E20', 1, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_role WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Barbero');
INSERT INTO staff_role (id, hub_id, name, description, color, "order", is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'role-beauty-esteticista', '00000000-0000-0000-0000-000000000001', 'Esteticista', 'Manicura, pedicura y estética', '#AD1457', 2, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_role WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Esteticista');
INSERT INTO staff_role (id, hub_id, name, description, color, "order", is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'role-beauty-recepcion', '00000000-0000-0000-0000-000000000001', 'Recepción', 'Atención y reservas', '#6A1B9A', 3, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_role WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Recepción');

-- ════════════════════════════════════════════════════════════════════════════════════════════
-- 6) Estilistas / staff (staff_member). hourly_rate = CÉNTIMOS/hora (ADR-0007). status='active'.
-- ════════════════════════════════════════════════════════════════════════════════════════════

INSERT INTO staff_member (id, hub_id, first_name, last_name, email, phone, employee_id, role_id, hire_date, status, bio, specialties, is_bookable, color, hourly_rate, commission_rate, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'staff-beauty-laura', '00000000-0000-0000-0000-000000000001', 'Laura', 'García', '', '', 'EMP-001', 'role-beauty-estilista', '2026-01-01', 'active', '', 'corte,color,mechas', 1, '#0091CE', 1200, 10.0, '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_member WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND employee_id = 'EMP-001');
INSERT INTO staff_member (id, hub_id, first_name, last_name, email, phone, employee_id, role_id, hire_date, status, bio, specialties, is_bookable, color, hourly_rate, commission_rate, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'staff-beauty-marta', '00000000-0000-0000-0000-000000000001', 'Marta', 'Ruiz', '', '', 'EMP-002', 'role-beauty-estilista', '2026-01-01', 'active', '', 'corte,peinado,tratamientos', 1, '#00897B', 1200, 10.0, '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_member WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND employee_id = 'EMP-002');
INSERT INTO staff_member (id, hub_id, first_name, last_name, email, phone, employee_id, role_id, hire_date, status, bio, specialties, is_bookable, color, hourly_rate, commission_rate, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'staff-beauty-carlos', '00000000-0000-0000-0000-000000000001', 'Carlos', 'Fernández', '', '', 'EMP-003', 'role-beauty-barbero', '2026-01-01', 'active', '', 'corte_caballero,barba,afeitado', 1, '#1B5E20', 1200, 10.0, '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_member WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND employee_id = 'EMP-003');
INSERT INTO staff_member (id, hub_id, first_name, last_name, email, phone, employee_id, role_id, hire_date, status, bio, specialties, is_bookable, color, hourly_rate, commission_rate, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'staff-beauty-sara', '00000000-0000-0000-0000-000000000001', 'Sara', 'López', '', '', 'EMP-004', 'role-beauty-esteticista', '2026-01-01', 'active', '', 'manicura,pedicura,depilacion', 1, '#AD1457', 1200, 10.0, '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_member WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND employee_id = 'EMP-004');
INSERT INTO staff_member (id, hub_id, first_name, last_name, email, phone, employee_id, role_id, hire_date, status, bio, specialties, is_bookable, color, hourly_rate, commission_rate, notes, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'staff-beauty-nuria', '00000000-0000-0000-0000-000000000001', 'Nuria', 'Martín', '', '', 'EMP-005', 'role-beauty-recepcion', '2026-01-01', 'active', '', 'recepcion,reservas', 0, '#6A1B9A', 1100, 0.0, '', 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_member WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND employee_id = 'EMP-005');

-- ════════════════════════════════════════════════════════════════════════════════════════════
-- 7) Servicios que presta cada estilista (staff_service). service_id = referencia opaca a
--    services_service.id (sin FK cross-módulo, ver migración). custom_price NULL = precio base.
-- ════════════════════════════════════════════════════════════════════════════════════════════

INSERT INTO staff_service (id, hub_id, staff_id, service_id, service_name, custom_duration, custom_price, is_primary, is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'staffsvc-beauty-laura-corte', '00000000-0000-0000-0000-000000000001', 'staff-beauty-laura', 'svc-beauty-corte_senora', 'Corte de señora', NULL, NULL, 1, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_service WHERE staff_id = 'staff-beauty-laura' AND service_id = 'svc-beauty-corte_senora');
INSERT INTO staff_service (id, hub_id, staff_id, service_id, service_name, custom_duration, custom_price, is_primary, is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'staffsvc-beauty-laura-mechas', '00000000-0000-0000-0000-000000000001', 'staff-beauty-laura', 'svc-beauty-mechas', 'Mechas', NULL, NULL, 0, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_service WHERE staff_id = 'staff-beauty-laura' AND service_id = 'svc-beauty-mechas');
INSERT INTO staff_service (id, hub_id, staff_id, service_id, service_name, custom_duration, custom_price, is_primary, is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'staffsvc-beauty-carlos-corte', '00000000-0000-0000-0000-000000000001', 'staff-beauty-carlos', 'svc-beauty-corte_caballero', 'Corte de caballero', NULL, NULL, 1, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_service WHERE staff_id = 'staff-beauty-carlos' AND service_id = 'svc-beauty-corte_caballero');
INSERT INTO staff_service (id, hub_id, staff_id, service_id, service_name, custom_duration, custom_price, is_primary, is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'staffsvc-beauty-carlos-barba', '00000000-0000-0000-0000-000000000001', 'staff-beauty-carlos', 'svc-beauty-arreglo_barba', 'Arreglo de barba', NULL, NULL, 0, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_service WHERE staff_id = 'staff-beauty-carlos' AND service_id = 'svc-beauty-arreglo_barba');
INSERT INTO staff_service (id, hub_id, staff_id, service_id, service_name, custom_duration, custom_price, is_primary, is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'staffsvc-beauty-sara-manicura', '00000000-0000-0000-0000-000000000001', 'staff-beauty-sara', 'svc-beauty-manicura', 'Manicura básica', NULL, NULL, 1, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_service WHERE staff_id = 'staff-beauty-sara' AND service_id = 'svc-beauty-manicura');

-- ════════════════════════════════════════════════════════════════════════════════════════════
-- 8) Horario semanal de cada estilista (staff_schedule + staff_working_hours). day_of_week:
--    0=Lunes .. 6=Domingo (ver migración staff). Una plantilla por miembro (is_default=1).
--    Patrón salón: L–V 09:30–20:00 con descanso 14:00–16:00; sábado 09:30–14:00; domingo cerrado.
-- ════════════════════════════════════════════════════════════════════════════════════════════

-- Plantillas (una por miembro bookable)
INSERT INTO staff_schedule (id, hub_id, staff_id, name, is_default, effective_from, effective_until, is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'sched-beauty-laura', '00000000-0000-0000-0000-000000000001', 'staff-beauty-laura', 'Horario habitual', 1, '2026-01-01', NULL, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_schedule WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND staff_id = 'staff-beauty-laura' AND is_default = 1);
INSERT INTO staff_schedule (id, hub_id, staff_id, name, is_default, effective_from, effective_until, is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'sched-beauty-marta', '00000000-0000-0000-0000-000000000001', 'staff-beauty-marta', 'Horario habitual', 1, '2026-01-01', NULL, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_schedule WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND staff_id = 'staff-beauty-marta' AND is_default = 1);
INSERT INTO staff_schedule (id, hub_id, staff_id, name, is_default, effective_from, effective_until, is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'sched-beauty-carlos', '00000000-0000-0000-0000-000000000001', 'staff-beauty-carlos', 'Horario habitual', 1, '2026-01-01', NULL, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_schedule WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND staff_id = 'staff-beauty-carlos' AND is_default = 1);
INSERT INTO staff_schedule (id, hub_id, staff_id, name, is_default, effective_from, effective_until, is_active, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'sched-beauty-sara', '00000000-0000-0000-0000-000000000001', 'staff-beauty-sara', 'Horario habitual', 1, '2026-01-01', NULL, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_schedule WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND staff_id = 'staff-beauty-sara' AND is_default = 1);

-- Horas L–V (días 0..4) de Laura: 09:30–20:00 con descanso 14:00–16:00.
INSERT INTO staff_working_hours (id, hub_id, schedule_id, day_of_week, start_time, end_time, break_start, break_end, is_working, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'wh-beauty-laura-0', '00000000-0000-0000-0000-000000000001', 'sched-beauty-laura', 0, '09:30:00', '20:00:00', '14:00:00', '16:00:00', 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_working_hours WHERE schedule_id = 'sched-beauty-laura' AND day_of_week = 0);
INSERT INTO staff_working_hours (id, hub_id, schedule_id, day_of_week, start_time, end_time, break_start, break_end, is_working, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'wh-beauty-laura-1', '00000000-0000-0000-0000-000000000001', 'sched-beauty-laura', 1, '09:30:00', '20:00:00', '14:00:00', '16:00:00', 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_working_hours WHERE schedule_id = 'sched-beauty-laura' AND day_of_week = 1);
INSERT INTO staff_working_hours (id, hub_id, schedule_id, day_of_week, start_time, end_time, break_start, break_end, is_working, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'wh-beauty-laura-2', '00000000-0000-0000-0000-000000000001', 'sched-beauty-laura', 2, '09:30:00', '20:00:00', '14:00:00', '16:00:00', 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_working_hours WHERE schedule_id = 'sched-beauty-laura' AND day_of_week = 2);
INSERT INTO staff_working_hours (id, hub_id, schedule_id, day_of_week, start_time, end_time, break_start, break_end, is_working, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'wh-beauty-laura-3', '00000000-0000-0000-0000-000000000001', 'sched-beauty-laura', 3, '09:30:00', '20:00:00', '14:00:00', '16:00:00', 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_working_hours WHERE schedule_id = 'sched-beauty-laura' AND day_of_week = 3);
INSERT INTO staff_working_hours (id, hub_id, schedule_id, day_of_week, start_time, end_time, break_start, break_end, is_working, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'wh-beauty-laura-4', '00000000-0000-0000-0000-000000000001', 'sched-beauty-laura', 4, '09:30:00', '20:00:00', '14:00:00', '16:00:00', 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_working_hours WHERE schedule_id = 'sched-beauty-laura' AND day_of_week = 4);
INSERT INTO staff_working_hours (id, hub_id, schedule_id, day_of_week, start_time, end_time, break_start, break_end, is_working, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'wh-beauty-laura-5', '00000000-0000-0000-0000-000000000001', 'sched-beauty-laura', 5, '09:30:00', '14:00:00', NULL, NULL, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_working_hours WHERE schedule_id = 'sched-beauty-laura' AND day_of_week = 5);

-- ════════════════════════════════════════════════════════════════════════════════════════════
-- 9) Configuración de staff (singleton). Jornada por defecto 09:30–20:00.
-- ════════════════════════════════════════════════════════════════════════════════════════════

INSERT INTO staff_settings (id, hub_id, default_work_start, default_work_end, default_break_duration, min_advance_booking, max_daily_hours, overtime_threshold, show_staff_photos, show_staff_bio, allow_staff_selection, notify_new_appointment, notify_cancellation, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'staffset-beauty', '00000000-0000-0000-0000-000000000001', '09:30:00', '20:00:00', 120, 1, 10, 40, 1, 1, 1, 1, 1, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_settings WHERE hub_id = '00000000-0000-0000-0000-000000000001');

-- ════════════════════════════════════════════════════════════════════════════════════════════
-- 10) Horario de apertura del negocio (schedules). day_of_week 0=Lunes .. 6=Domingo.
--     L–V 09:30–20:00 (descanso 14:00–16:00); sábado 09:30–14:00; domingo cerrado.
-- ════════════════════════════════════════════════════════════════════════════════════════════

INSERT INTO schedules_settings (id, hub_id, timezone, week_starts_on, slot_duration, auto_close_enabled, is_deleted, created_by, created_at, updated_by, updated_at)
SELECT 'schedset-beauty', '00000000-0000-0000-0000-000000000001', 'Europe/Madrid', 1, 30, 0, 0, NULL, '2026-01-01T00:00:00+00:00', NULL, '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM schedules_settings WHERE hub_id = '00000000-0000-0000-0000-000000000001');

INSERT INTO schedules_business_hours (id, hub_id, day_of_week, open_time, close_time, is_closed, break_start, break_end, is_deleted, created_by, created_at, updated_by, updated_at)
SELECT 'bh-beauty-0', '00000000-0000-0000-0000-000000000001', 0, '09:30', '20:00', 0, '14:00', '16:00', 0, NULL, '2026-01-01T00:00:00+00:00', NULL, '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM schedules_business_hours WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND day_of_week = 0);
INSERT INTO schedules_business_hours (id, hub_id, day_of_week, open_time, close_time, is_closed, break_start, break_end, is_deleted, created_by, created_at, updated_by, updated_at)
SELECT 'bh-beauty-1', '00000000-0000-0000-0000-000000000001', 1, '09:30', '20:00', 0, '14:00', '16:00', 0, NULL, '2026-01-01T00:00:00+00:00', NULL, '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM schedules_business_hours WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND day_of_week = 1);
INSERT INTO schedules_business_hours (id, hub_id, day_of_week, open_time, close_time, is_closed, break_start, break_end, is_deleted, created_by, created_at, updated_by, updated_at)
SELECT 'bh-beauty-2', '00000000-0000-0000-0000-000000000001', 2, '09:30', '20:00', 0, '14:00', '16:00', 0, NULL, '2026-01-01T00:00:00+00:00', NULL, '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM schedules_business_hours WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND day_of_week = 2);
INSERT INTO schedules_business_hours (id, hub_id, day_of_week, open_time, close_time, is_closed, break_start, break_end, is_deleted, created_by, created_at, updated_by, updated_at)
SELECT 'bh-beauty-3', '00000000-0000-0000-0000-000000000001', 3, '09:30', '20:00', 0, '14:00', '16:00', 0, NULL, '2026-01-01T00:00:00+00:00', NULL, '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM schedules_business_hours WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND day_of_week = 3);
INSERT INTO schedules_business_hours (id, hub_id, day_of_week, open_time, close_time, is_closed, break_start, break_end, is_deleted, created_by, created_at, updated_by, updated_at)
SELECT 'bh-beauty-4', '00000000-0000-0000-0000-000000000001', 4, '09:30', '20:00', 0, '14:00', '16:00', 0, NULL, '2026-01-01T00:00:00+00:00', NULL, '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM schedules_business_hours WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND day_of_week = 4);
INSERT INTO schedules_business_hours (id, hub_id, day_of_week, open_time, close_time, is_closed, break_start, break_end, is_deleted, created_by, created_at, updated_by, updated_at)
SELECT 'bh-beauty-5', '00000000-0000-0000-0000-000000000001', 5, '09:30', '14:00', 0, NULL, NULL, 0, NULL, '2026-01-01T00:00:00+00:00', NULL, '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM schedules_business_hours WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND day_of_week = 5);
INSERT INTO schedules_business_hours (id, hub_id, day_of_week, open_time, close_time, is_closed, break_start, break_end, is_deleted, created_by, created_at, updated_by, updated_at)
SELECT 'bh-beauty-6', '00000000-0000-0000-0000-000000000001', 6, '00:00', '00:00', 1, NULL, NULL, 0, NULL, '2026-01-01T00:00:00+00:00', NULL, '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM schedules_business_hours WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND day_of_week = 6);

-- ════════════════════════════════════════════════════════════════════════════════════════════
-- 11) Lista de tarifas (pricing). Lista por defecto "Tarifa general" en EUR. Los items referencian
--     los servicios por product_ref = services_service.id (precio en céntimos, igual que el servicio).
-- ════════════════════════════════════════════════════════════════════════════════════════════

INSERT INTO pricing_price_list (id, hub_id, code, name, currency, is_default, is_active, valid_from, valid_until, segment, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'pl-beauty-general', '00000000-0000-0000-0000-000000000001', 'TARIFA_GENERAL', 'Tarifa general', 'EUR', 1, 1, '2026-01-01', NULL, NULL, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM pricing_price_list WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND code = 'TARIFA_GENERAL');

INSERT INTO pricing_price_list_item (id, hub_id, price_list_id, product_ref, price, min_quantity, max_quantity, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'pli-beauty-corte_senora', '00000000-0000-0000-0000-000000000001', 'pl-beauty-general', 'svc-beauty-corte_senora', 1800, 1, NULL, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM pricing_price_list_item WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND price_list_id = 'pl-beauty-general' AND product_ref = 'svc-beauty-corte_senora');
INSERT INTO pricing_price_list_item (id, hub_id, price_list_id, product_ref, price, min_quantity, max_quantity, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'pli-beauty-corte_caballero', '00000000-0000-0000-0000-000000000001', 'pl-beauty-general', 'svc-beauty-corte_caballero', 1400, 1, NULL, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM pricing_price_list_item WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND price_list_id = 'pl-beauty-general' AND product_ref = 'svc-beauty-corte_caballero');
INSERT INTO pricing_price_list_item (id, hub_id, price_list_id, product_ref, price, min_quantity, max_quantity, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'pli-beauty-mechas', '00000000-0000-0000-0000-000000000001', 'pl-beauty-general', 'svc-beauty-mechas', 4500, 1, NULL, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM pricing_price_list_item WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND price_list_id = 'pl-beauty-general' AND product_ref = 'svc-beauty-mechas');
INSERT INTO pricing_price_list_item (id, hub_id, price_list_id, product_ref, price, min_quantity, max_quantity, is_deleted, created_by, updated_by, created_at, updated_at)
SELECT 'pli-beauty-manicura', '00000000-0000-0000-0000-000000000001', 'pl-beauty-general', 'svc-beauty-manicura', 1500, 1, NULL, 0, NULL, NULL, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM pricing_price_list_item WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND price_list_id = 'pl-beauty-general' AND product_ref = 'svc-beauty-manicura');

-- ════════════════════════════════════════════════════════════════════════════════════════════
-- 9) Cajeros demo (login local). Cada cajero = una fila `hub_user` (login por PIN) ENLAZADA a su
--    ficha `staff_member` vía `staff_member.user_id` (hub_user es identidad/login; staff_member es
--    catálogo de personal y no da login por sí mismo). pin_hash en formato LEGACY
--    `salt:sha256_hex("{salt}:{pin}")` que `identity.rs::check_pin` acepta y rehashea perezosamente
--    a argon2id en el primer login (igual que `hub/crates/server/seeds/demo.sql`).
--    ROL = 'employee': el cajero ES el rol de operador que YA existe en los 27 module.json
--    (role_permissions admin/manager/employee). 'employee' concede vender / abrir-cerrar caja /
--    facturar, sin ajustes ni borrados → reutilizar en vez de crear 'cashier' (componer, no duplicar).
--    PIN: 1111/2222 NO rotan — la seguridad la da el device-trust (solo dispositivos de confianza
--    hacen login por PIN, §2.9); son credenciales de demo estables a propósito.
-- ════════════════════════════════════════════════════════════════════════════════════════════

INSERT INTO hub_user (id, name, pin_hash, role, cloud_user_id, is_active, created_at)
SELECT 'user-beauty-cashier1', 'Cajero 1', 'cashier1-seed-salt:9d81582af594e1cc780151726e43aceb5da668e780bf455ca41b6bfc0a7074ca', 'employee', NULL, 1, '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM hub_user WHERE name = 'Cajero 1');
INSERT INTO staff_member (id, hub_id, first_name, last_name, user_id, status, is_bookable, created_at, updated_at)
SELECT 'staff-beauty-cashier1', '00000000-0000-0000-0000-000000000001', 'Cajero', 'Uno', 'user-beauty-cashier1', 'active', 0, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_member WHERE id = 'staff-beauty-cashier1');
INSERT INTO hub_user (id, name, pin_hash, role, cloud_user_id, is_active, created_at)
SELECT 'user-beauty-cashier2', 'Cajero 2', 'cashier2-seed-salt:fe8ab1c960ef7d0abbbd1c7598ed2036f7aabc2408571edfdaff16d6bc1bdb0f', 'employee', NULL, 1, '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM hub_user WHERE name = 'Cajero 2');
INSERT INTO staff_member (id, hub_id, first_name, last_name, user_id, status, is_bookable, created_at, updated_at)
SELECT 'staff-beauty-cashier2', '00000000-0000-0000-0000-000000000001', 'Cajero', 'Dos', 'user-beauty-cashier2', 'active', 0, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_member WHERE id = 'staff-beauty-cashier2');
