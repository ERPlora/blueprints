-- Catálogo starter 'hospitality' generado por scripts/build_starter_catalog.py — NO editar a mano.
-- 280 productos en 19 categorías. hub_id = 00000000-0000-0000-0000-000000000001.
-- Idempotente (WHERE NOT EXISTS). Requiere que el módulo 'inventory' esté instalado
-- (sus tablas inventory_category / inventory_product existan) ANTES de aplicar este seed.

INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-cafes', '00000000-0000-0000-0000-000000000001', 'Cafés e infusiones', 'cafes', 'cafe-outline', 0, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Cafés e infusiones');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-refrescos', '00000000-0000-0000-0000-000000000001', 'Refrescos y zumos', 'refrescos', 'nutrition-outline', 1, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Refrescos y zumos');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-cervezas', '00000000-0000-0000-0000-000000000001', 'Cervezas', 'cervezas', 'beer-outline', 2, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Cervezas');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-vinos', '00000000-0000-0000-0000-000000000001', 'Vinos y vermut', 'vinos', 'wine-outline', 3, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Vinos y vermut');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-cocteles', '00000000-0000-0000-0000-000000000001', 'Cócteles y copas', 'cocteles', 'wine-outline', 4, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Cócteles y copas');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-desayunos', '00000000-0000-0000-0000-000000000001', 'Desayunos y tostadas', 'desayunos', 'sunny-outline', 5, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Desayunos y tostadas');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-tapas', '00000000-0000-0000-0000-000000000001', 'Tapas y raciones', 'tapas', 'restaurant-outline', 6, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Tapas y raciones');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-ensaladas', '00000000-0000-0000-0000-000000000001', 'Ensaladas', 'ensaladas', 'leaf-outline', 7, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Ensaladas');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-arroces', '00000000-0000-0000-0000-000000000001', 'Arroces y pastas', 'arroces', 'restaurant-outline', 8, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Arroces y pastas');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-pizzas', '00000000-0000-0000-0000-000000000001', 'Pizzas', 'pizzas', 'pizza-outline', 9, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Pizzas');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-kebabs', '00000000-0000-0000-0000-000000000001', 'Kebabs y durum', 'kebabs', 'fast-food-outline', 10, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Kebabs y durum');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-bocadillos', '00000000-0000-0000-0000-000000000001', 'Bocadillos y wraps', 'bocadillos', 'fast-food-outline', 11, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Bocadillos y wraps');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-japones', '00000000-0000-0000-0000-000000000001', 'Sushi y cocina asiática', 'japones', 'fish-outline', 12, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Sushi y cocina asiática');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-carnes', '00000000-0000-0000-0000-000000000001', 'Carnes', 'carnes', 'restaurant-outline', 13, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Carnes');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-pescados', '00000000-0000-0000-0000-000000000001', 'Pescados', 'pescados', 'fish-outline', 14, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Pescados');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-menus', '00000000-0000-0000-0000-000000000001', 'Menús', 'menus', 'list-outline', 15, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Menús');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-postres', '00000000-0000-0000-0000-000000000001', 'Postres y helados', 'postres', 'ice-cream-outline', 16, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Postres y helados');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-panes', '00000000-0000-0000-0000-000000000001', 'Panadería', 'panes', 'pizza-outline', 17, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Panadería');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-hospitality-extras', '00000000-0000-0000-0000-000000000001', 'Extras y complementos', 'extras', 'add-circle-outline', 18, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Extras y complementos');

INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-agua_con_gas', '00000000-0000-0000-0000-000000000001', 'Agua con gas', 'agua_con_gas', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/agua_con_gas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'agua_con_gas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-agua_con_gas', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-agua_con_gas' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-agua_mineral', '00000000-0000-0000-0000-000000000001', 'Agua mineral', 'agua_mineral', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/agua_mineral.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'agua_mineral');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-agua_mineral', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-agua_mineral' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-alitas_pollo', '00000000-0000-0000-0000-000000000001', 'Alitas pollo', 'alitas_pollo', '', 'physical', 13.50, 0, 1000, 0, 'assets/hospitality/alitas_pollo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'alitas_pollo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-alitas_pollo', 'cat-hospitality-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-alitas_pollo' AND category_id = 'cat-hospitality-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-americano', '00000000-0000-0000-0000-000000000001', 'Americano', 'americano', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/americano.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'americano');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-americano', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-americano' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-aquarius', '00000000-0000-0000-0000-000000000001', 'Aquarius', 'aquarius', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/aquarius.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'aquarius');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-aquarius', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-aquarius' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-aros_cebolla', '00000000-0000-0000-0000-000000000001', 'Aros cebolla', 'aros_cebolla', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/aros_cebolla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'aros_cebolla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-aros_cebolla', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-aros_cebolla' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-arroz_banda', '00000000-0000-0000-0000-000000000001', 'Arroz banda', 'arroz_banda', '', 'physical', 11.00, 0, 1000, 0, 'assets/hospitality/arroz_banda.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'arroz_banda');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-arroz_banda', 'cat-hospitality-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-arroz_banda' AND category_id = 'cat-hospitality-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-arroz_extra', '00000000-0000-0000-0000-000000000001', 'Arroz extra', 'arroz_extra', '', 'physical', 11.00, 0, 1000, 0, 'assets/hospitality/arroz_extra.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'arroz_extra');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-arroz_extra', 'cat-hospitality-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-arroz_extra' AND category_id = 'cat-hospitality-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-arroz_negro', '00000000-0000-0000-0000-000000000001', 'Arroz negro', 'arroz_negro', '', 'physical', 11.00, 0, 1000, 0, 'assets/hospitality/arroz_negro.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'arroz_negro');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-arroz_negro', 'cat-hospitality-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-arroz_negro' AND category_id = 'cat-hospitality-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-arroz_wok', '00000000-0000-0000-0000-000000000001', 'Arroz wok', 'arroz_wok', '', 'physical', 11.00, 0, 1000, 0, 'assets/hospitality/arroz_wok.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'arroz_wok');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-arroz_wok', 'cat-hospitality-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-arroz_wok' AND category_id = 'cat-hospitality-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-ayran', '00000000-0000-0000-0000-000000000001', 'Ayran', 'ayran', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/ayran.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ayran');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-ayran', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-ayran' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-bagel_salmon', '00000000-0000-0000-0000-000000000001', 'Bagel salmon', 'bagel_salmon', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/bagel_salmon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bagel_salmon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-bagel_salmon', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-bagel_salmon' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-barra_pan', '00000000-0000-0000-0000-000000000001', 'Barra pan', 'barra_pan', '', 'physical', 1.50, 0, 1000, 0, 'assets/hospitality/barra_pan.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'barra_pan');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-barra_pan', 'cat-hospitality-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-barra_pan' AND category_id = 'cat-hospitality-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-batido_chocolate', '00000000-0000-0000-0000-000000000001', 'Batido chocolate', 'batido_chocolate', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/batido_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'batido_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-batido_chocolate', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-batido_chocolate' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-batido_fresa', '00000000-0000-0000-0000-000000000001', 'Batido fresa', 'batido_fresa', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/batido_fresa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'batido_fresa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-batido_fresa', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-batido_fresa' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-batido_vainilla', '00000000-0000-0000-0000-000000000001', 'Batido vainilla', 'batido_vainilla', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/batido_vainilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'batido_vainilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-batido_vainilla', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-batido_vainilla' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-bocadillo_calamares', '00000000-0000-0000-0000-000000000001', 'Bocadillo calamares', 'bocadillo_calamares', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/bocadillo_calamares.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bocadillo_calamares');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-bocadillo_calamares', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-bocadillo_calamares' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-bocadillo_jamon', '00000000-0000-0000-0000-000000000001', 'Bocadillo jamon', 'bocadillo_jamon', '', 'physical', 5.00, 0, 1000, 0, 'assets/hospitality/bocadillo_jamon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bocadillo_jamon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-bocadillo_jamon', 'cat-hospitality-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-bocadillo_jamon' AND category_id = 'cat-hospitality-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-bocadillo_jamon_queso', '00000000-0000-0000-0000-000000000001', 'Bocadillo jamon queso', 'bocadillo_jamon_queso', '', 'physical', 5.00, 0, 1000, 0, 'assets/hospitality/bocadillo_jamon_queso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bocadillo_jamon_queso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-bocadillo_jamon_queso', 'cat-hospitality-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-bocadillo_jamon_queso' AND category_id = 'cat-hospitality-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-bocadillo_lomo', '00000000-0000-0000-0000-000000000001', 'Bocadillo lomo', 'bocadillo_lomo', '', 'physical', 5.00, 0, 1000, 0, 'assets/hospitality/bocadillo_lomo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bocadillo_lomo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-bocadillo_lomo', 'cat-hospitality-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-bocadillo_lomo' AND category_id = 'cat-hospitality-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-bocadillo_pulled_pork', '00000000-0000-0000-0000-000000000001', 'Bocadillo pulled pork', 'bocadillo_pulled_pork', '', 'physical', 5.00, 0, 1000, 0, 'assets/hospitality/bocadillo_pulled_pork.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bocadillo_pulled_pork');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-bocadillo_pulled_pork', 'cat-hospitality-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-bocadillo_pulled_pork' AND category_id = 'cat-hospitality-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-bocadillo_tortilla', '00000000-0000-0000-0000-000000000001', 'Bocadillo tortilla', 'bocadillo_tortilla', '', 'physical', 5.00, 0, 1000, 0, 'assets/hospitality/bocadillo_tortilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bocadillo_tortilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-bocadillo_tortilla', 'cat-hospitality-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-bocadillo_tortilla' AND category_id = 'cat-hospitality-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-bocadillo_vegetal', '00000000-0000-0000-0000-000000000001', 'Bocadillo vegetal', 'bocadillo_vegetal', '', 'physical', 5.00, 0, 1000, 0, 'assets/hospitality/bocadillo_vegetal.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bocadillo_vegetal');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-bocadillo_vegetal', 'cat-hospitality-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-bocadillo_vegetal' AND category_id = 'cat-hospitality-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-botella_albarino', '00000000-0000-0000-0000-000000000001', 'Botella albarino', 'botella_albarino', '', 'physical', 18.00, 0, 1000, 0, 'assets/hospitality/botella_albarino.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'botella_albarino');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-botella_albarino', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-botella_albarino' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-botella_champagne', '00000000-0000-0000-0000-000000000001', 'Botella champagne', 'botella_champagne', '', 'physical', 45.00, 0, 1000, 0, 'assets/hospitality/botella_champagne.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'botella_champagne');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-botella_champagne', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-botella_champagne' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-botella_ribera_duero', '00000000-0000-0000-0000-000000000001', 'Botella ribera duero', 'botella_ribera_duero', '', 'physical', 22.00, 0, 1000, 0, 'assets/hospitality/botella_ribera_duero.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'botella_ribera_duero');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-botella_ribera_duero', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-botella_ribera_duero' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-botella_rioja_crianza', '00000000-0000-0000-0000-000000000001', 'Botella rioja crianza', 'botella_rioja_crianza', '', 'physical', 19.00, 0, 1000, 0, 'assets/hospitality/botella_rioja_crianza.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'botella_rioja_crianza');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-botella_rioja_crianza', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-botella_rioja_crianza' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-bowl_pollo', '00000000-0000-0000-0000-000000000001', 'Bowl pollo', 'bowl_pollo', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/bowl_pollo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bowl_pollo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-bowl_pollo', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-bowl_pollo' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-brownie', '00000000-0000-0000-0000-000000000001', 'Brownie', 'brownie', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/brownie.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'brownie');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-brownie', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-brownie' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-brownie_chocolate', '00000000-0000-0000-0000-000000000001', 'Brownie chocolate', 'brownie_chocolate', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/brownie_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'brownie_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-brownie_chocolate', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-brownie_chocolate' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-bruschetta', '00000000-0000-0000-0000-000000000001', 'Bruschetta', 'bruschetta', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/bruschetta.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bruschetta');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-bruschetta', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-bruschetta' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-cafe_bombom', '00000000-0000-0000-0000-000000000001', 'Cafe bombom', 'cafe_bombom', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/cafe_bombom.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cafe_bombom');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-cafe_bombom', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-cafe_bombom' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-cafe_con_leche', '00000000-0000-0000-0000-000000000001', 'Cafe con leche', 'cafe_con_leche', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/cafe_con_leche.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cafe_con_leche');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-cafe_con_leche', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-cafe_con_leche' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-cafe_cortado', '00000000-0000-0000-0000-000000000001', 'Cafe cortado', 'cafe_cortado', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/cafe_cortado.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cafe_cortado');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-cafe_cortado', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-cafe_cortado' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-cafe_helado', '00000000-0000-0000-0000-000000000001', 'Cafe helado', 'cafe_helado', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/cafe_helado.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cafe_helado');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-cafe_helado', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-cafe_helado' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-cafe_solo', '00000000-0000-0000-0000-000000000001', 'Cafe solo', 'cafe_solo', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/cafe_solo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cafe_solo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-cafe_solo', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-cafe_solo' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-calamares_romana', '00000000-0000-0000-0000-000000000001', 'Calamares romana', 'calamares_romana', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/calamares_romana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'calamares_romana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-calamares_romana', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-calamares_romana' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-california_roll', '00000000-0000-0000-0000-000000000001', 'California roll', 'california_roll', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/california_roll.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'california_roll');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-california_roll', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-california_roll' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-capuchino', '00000000-0000-0000-0000-000000000001', 'Capuchino', 'capuchino', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/capuchino.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'capuchino');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-capuchino', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-capuchino' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-carajillo', '00000000-0000-0000-0000-000000000001', 'Carajillo', 'carajillo', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/carajillo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'carajillo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-carajillo', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-carajillo' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-cerveza_botella', '00000000-0000-0000-0000-000000000001', 'Cerveza botella', 'cerveza_botella', '', 'physical', 2.50, 0, 1000, 0, 'assets/hospitality/cerveza_botella.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cerveza_botella');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-cerveza_botella', 'cat-hospitality-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-cerveza_botella' AND category_id = 'cat-hospitality-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-cerveza_cana', '00000000-0000-0000-0000-000000000001', 'Cerveza cana', 'cerveza_cana', '', 'physical', 2.50, 0, 1000, 0, 'assets/hospitality/cerveza_cana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cerveza_cana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-cerveza_cana', 'cat-hospitality-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-cerveza_cana' AND category_id = 'cat-hospitality-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-cerveza_japonesa', '00000000-0000-0000-0000-000000000001', 'Cerveza japonesa', 'cerveza_japonesa', '', 'physical', 2.50, 0, 1000, 0, 'assets/hospitality/cerveza_japonesa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cerveza_japonesa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-cerveza_japonesa', 'cat-hospitality-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-cerveza_japonesa' AND category_id = 'cat-hospitality-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-cerveza_jarra', '00000000-0000-0000-0000-000000000001', 'Cerveza jarra', 'cerveza_jarra', '', 'physical', 2.50, 0, 1000, 0, 'assets/hospitality/cerveza_jarra.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cerveza_jarra');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-cerveza_jarra', 'cat-hospitality-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-cerveza_jarra' AND category_id = 'cat-hospitality-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-cerveza_sin', '00000000-0000-0000-0000-000000000001', 'Cerveza sin', 'cerveza_sin', '', 'physical', 2.50, 0, 1000, 0, 'assets/hospitality/cerveza_sin.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cerveza_sin');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-cerveza_sin', 'cat-hospitality-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-cerveza_sin' AND category_id = 'cat-hospitality-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-chai_latte', '00000000-0000-0000-0000-000000000001', 'Chai latte', 'chai_latte', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/chai_latte.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'chai_latte');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-chai_latte', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-chai_latte' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-chapata', '00000000-0000-0000-0000-000000000001', 'Chapata', 'chapata', '', 'physical', 1.50, 0, 1000, 0, 'assets/hospitality/chapata.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'chapata');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-chapata', 'cat-hospitality-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-chapata' AND category_id = 'cat-hospitality-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-cheesecake', '00000000-0000-0000-0000-000000000001', 'Cheesecake', 'cheesecake', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/cheesecake.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cheesecake');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-cheesecake', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-cheesecake' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-chupito_jager', '00000000-0000-0000-0000-000000000001', 'Chupito jager', 'chupito_jager', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/chupito_jager.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'chupito_jager');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-chupito_jager', 'cat-hospitality-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-chupito_jager' AND category_id = 'cat-hospitality-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-chupito_sambuca', '00000000-0000-0000-0000-000000000001', 'Chupito sambuca', 'chupito_sambuca', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/chupito_sambuca.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'chupito_sambuca');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-chupito_sambuca', 'cat-hospitality-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-chupito_sambuca' AND category_id = 'cat-hospitality-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-chupito_tequila', '00000000-0000-0000-0000-000000000001', 'Chupito tequila', 'chupito_tequila', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/chupito_tequila.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'chupito_tequila');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-chupito_tequila', 'cat-hospitality-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-chupito_tequila' AND category_id = 'cat-hospitality-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-churros', '00000000-0000-0000-0000-000000000001', 'Churros', 'churros', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/churros.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'churros');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-churros', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-churros' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-clara', '00000000-0000-0000-0000-000000000001', 'Clara', 'clara', '', 'physical', 2.50, 0, 1000, 0, 'assets/hospitality/clara.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'clara');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-clara', 'cat-hospitality-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-clara' AND category_id = 'cat-hospitality-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-coca_cola', '00000000-0000-0000-0000-000000000001', 'Coca cola', 'coca_cola', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/coca_cola.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'coca_cola');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-coca_cola', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-coca_cola' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-coca_cola_zero', '00000000-0000-0000-0000-000000000001', 'Coca cola zero', 'coca_cola_zero', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/coca_cola_zero.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'coca_cola_zero');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-coca_cola_zero', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-coca_cola_zero' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-cookie', '00000000-0000-0000-0000-000000000001', 'Cookie', 'cookie', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/cookie.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cookie');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-cookie', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-cookie' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-copa_albarino', '00000000-0000-0000-0000-000000000001', 'Copa albarino', 'copa_albarino', '', 'physical', 3.20, 0, 1000, 0, 'assets/hospitality/copa_albarino.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'copa_albarino');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-copa_albarino', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-copa_albarino' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-copa_cava', '00000000-0000-0000-0000-000000000001', 'Copa cava', 'copa_cava', '', 'physical', 3.20, 0, 1000, 0, 'assets/hospitality/copa_cava.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'copa_cava');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-copa_cava', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-copa_cava' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-copa_helado', '00000000-0000-0000-0000-000000000001', 'Copa helado', 'copa_helado', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/copa_helado.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'copa_helado');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-copa_helado', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-copa_helado' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-copa_ribera_duero', '00000000-0000-0000-0000-000000000001', 'Copa ribera duero', 'copa_ribera_duero', '', 'physical', 3.20, 0, 1000, 0, 'assets/hospitality/copa_ribera_duero.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'copa_ribera_duero');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-copa_ribera_duero', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-copa_ribera_duero' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-copa_rioja_crianza', '00000000-0000-0000-0000-000000000001', 'Copa rioja crianza', 'copa_rioja_crianza', '', 'physical', 3.20, 0, 1000, 0, 'assets/hospitality/copa_rioja_crianza.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'copa_rioja_crianza');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-copa_rioja_crianza', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-copa_rioja_crianza' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-copa_verdejo', '00000000-0000-0000-0000-000000000001', 'Copa verdejo', 'copa_verdejo', '', 'physical', 3.20, 0, 1000, 0, 'assets/hospitality/copa_verdejo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'copa_verdejo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-copa_verdejo', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-copa_verdejo' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-crema_catalana', '00000000-0000-0000-0000-000000000001', 'Crema catalana', 'crema_catalana', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/crema_catalana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'crema_catalana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-crema_catalana', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-crema_catalana' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-crepe_nutella', '00000000-0000-0000-0000-000000000001', 'Crepe nutella', 'crepe_nutella', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/crepe_nutella.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'crepe_nutella');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-crepe_nutella', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-crepe_nutella' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-croissant', '00000000-0000-0000-0000-000000000001', 'Croissant', 'croissant', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/croissant.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'croissant');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-croissant', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-croissant' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-croissant_chocolate', '00000000-0000-0000-0000-000000000001', 'Croissant chocolate', 'croissant_chocolate', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/croissant_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'croissant_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-croissant_chocolate', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-croissant_chocolate' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-croquetas_jamon', '00000000-0000-0000-0000-000000000001', 'Croquetas jamon', 'croquetas_jamon', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/croquetas_jamon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'croquetas_jamon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-croquetas_jamon', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-croquetas_jamon' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-cuba_libre', '00000000-0000-0000-0000-000000000001', 'Cuba libre', 'cuba_libre', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/cuba_libre.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cuba_libre');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-cuba_libre', 'cat-hospitality-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-cuba_libre' AND category_id = 'cat-hospitality-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-cubata_ron', '00000000-0000-0000-0000-000000000001', 'Cubata ron', 'cubata_ron', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/cubata_ron.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cubata_ron');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-cubata_ron', 'cat-hospitality-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-cubata_ron' AND category_id = 'cat-hospitality-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-cubata_vodka', '00000000-0000-0000-0000-000000000001', 'Cubata vodka', 'cubata_vodka', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/cubata_vodka.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cubata_vodka');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-cubata_vodka', 'cat-hospitality-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-cubata_vodka' AND category_id = 'cat-hospitality-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-culin_sidra', '00000000-0000-0000-0000-000000000001', 'Culin sidra', 'culin_sidra', '', 'physical', 3.20, 0, 1000, 0, 'assets/hospitality/culin_sidra.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'culin_sidra');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-culin_sidra', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-culin_sidra' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-desayuno_buffet', '00000000-0000-0000-0000-000000000001', 'Desayuno buffet', 'desayuno_buffet', '', 'physical', 14.00, 0, 1000, 0, 'assets/hospitality/desayuno_buffet.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'desayuno_buffet');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-desayuno_buffet', 'cat-hospitality-menus'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-desayuno_buffet' AND category_id = 'cat-hospitality-menus');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-desayuno_continental', '00000000-0000-0000-0000-000000000001', 'Desayuno continental', 'desayuno_continental', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/desayuno_continental.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'desayuno_continental');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-desayuno_continental', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-desayuno_continental' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-descafeinado', '00000000-0000-0000-0000-000000000001', 'Descafeinado', 'descafeinado', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/descafeinado.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'descafeinado');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-descafeinado', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-descafeinado' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-doble_espresso', '00000000-0000-0000-0000-000000000001', 'Doble espresso', 'doble_espresso', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/doble_espresso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'doble_espresso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-doble_espresso', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-doble_espresso' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-dragon_roll', '00000000-0000-0000-0000-000000000001', 'Dragon roll', 'dragon_roll', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/dragon_roll.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'dragon_roll');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-dragon_roll', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-dragon_roll' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-durum_mixto', '00000000-0000-0000-0000-000000000001', 'Durum mixto', 'durum_mixto', '', 'physical', 7.00, 0, 1000, 0, 'assets/hospitality/durum_mixto.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'durum_mixto');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-durum_mixto', 'cat-hospitality-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-durum_mixto' AND category_id = 'cat-hospitality-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-durum_pollo', '00000000-0000-0000-0000-000000000001', 'Durum pollo', 'durum_pollo', '', 'physical', 7.00, 0, 1000, 0, 'assets/hospitality/durum_pollo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'durum_pollo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-durum_pollo', 'cat-hospitality-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-durum_pollo' AND category_id = 'cat-hospitality-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-durum_ternera', '00000000-0000-0000-0000-000000000001', 'Durum ternera', 'durum_ternera', '', 'physical', 7.00, 0, 1000, 0, 'assets/hospitality/durum_ternera.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'durum_ternera');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-durum_ternera', 'cat-hospitality-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-durum_ternera' AND category_id = 'cat-hospitality-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-edamame', '00000000-0000-0000-0000-000000000001', 'Edamame', 'edamame', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/edamame.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'edamame');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-edamame', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-edamame' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-ensaimada', '00000000-0000-0000-0000-000000000001', 'Ensaimada', 'ensaimada', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/ensaimada.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ensaimada');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-ensaimada', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-ensaimada' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-ensalada_acomp', '00000000-0000-0000-0000-000000000001', 'Ensalada acomp', 'ensalada_acomp', '', 'physical', 7.50, 0, 1000, 0, 'assets/hospitality/ensalada_acomp.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ensalada_acomp');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-ensalada_acomp', 'cat-hospitality-ensaladas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-ensalada_acomp' AND category_id = 'cat-hospitality-ensaladas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-ensalada_caprese', '00000000-0000-0000-0000-000000000001', 'Ensalada caprese', 'ensalada_caprese', '', 'physical', 7.50, 0, 1000, 0, 'assets/hospitality/ensalada_caprese.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ensalada_caprese');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-ensalada_caprese', 'cat-hospitality-ensaladas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-ensalada_caprese' AND category_id = 'cat-hospitality-ensaladas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-ensalada_cesar', '00000000-0000-0000-0000-000000000001', 'Ensalada cesar', 'ensalada_cesar', '', 'physical', 7.50, 0, 1000, 0, 'assets/hospitality/ensalada_cesar.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ensalada_cesar');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-ensalada_cesar', 'cat-hospitality-ensaladas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-ensalada_cesar' AND category_id = 'cat-hospitality-ensaladas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-ensalada_mixta', '00000000-0000-0000-0000-000000000001', 'Ensalada mixta', 'ensalada_mixta', '', 'physical', 7.50, 0, 1000, 0, 'assets/hospitality/ensalada_mixta.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ensalada_mixta');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-ensalada_mixta', 'cat-hospitality-ensaladas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-ensalada_mixta' AND category_id = 'cat-hospitality-ensaladas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-ensalada_turca', '00000000-0000-0000-0000-000000000001', 'Ensalada turca', 'ensalada_turca', '', 'physical', 7.50, 0, 1000, 0, 'assets/hospitality/ensalada_turca.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ensalada_turca');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-ensalada_turca', 'cat-hospitality-ensaladas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-ensalada_turca' AND category_id = 'cat-hospitality-ensaladas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-ensalada_wakame', '00000000-0000-0000-0000-000000000001', 'Ensalada wakame', 'ensalada_wakame', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/ensalada_wakame.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ensalada_wakame');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-ensalada_wakame', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-ensalada_wakame' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-entrecot', '00000000-0000-0000-0000-000000000001', 'Entrecot', 'entrecot', '', 'physical', 18.00, 0, 1000, 0, 'assets/hospitality/entrecot.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'entrecot');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-entrecot', 'cat-hospitality-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-entrecot' AND category_id = 'cat-hospitality-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-espeto_sardinas', '00000000-0000-0000-0000-000000000001', 'Espeto sardinas', 'espeto_sardinas', '', 'physical', 9.00, 0, 1000, 0, 'assets/hospitality/espeto_sardinas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'espeto_sardinas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-espeto_sardinas', 'cat-hospitality-pescados'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-espeto_sardinas' AND category_id = 'cat-hospitality-pescados');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-espresso', '00000000-0000-0000-0000-000000000001', 'Espresso', 'espresso', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/espresso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'espresso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-espresso', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-espresso' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-fanta_limon', '00000000-0000-0000-0000-000000000001', 'Fanta limon', 'fanta_limon', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/fanta_limon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'fanta_limon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-fanta_limon', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-fanta_limon' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-fanta_naranja', '00000000-0000-0000-0000-000000000001', 'Fanta naranja', 'fanta_naranja', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/fanta_naranja.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'fanta_naranja');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-fanta_naranja', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-fanta_naranja' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-fideua', '00000000-0000-0000-0000-000000000001', 'Fideua', 'fideua', '', 'physical', 11.00, 0, 1000, 0, 'assets/hospitality/fideua.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'fideua');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-fideua', 'cat-hospitality-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-fideua' AND category_id = 'cat-hospitality-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-flan_casero', '00000000-0000-0000-0000-000000000001', 'Flan casero', 'flan_casero', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/flan_casero.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'flan_casero');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-flan_casero', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-flan_casero' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-flat_white', '00000000-0000-0000-0000-000000000001', 'Flat white', 'flat_white', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/flat_white.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'flat_white');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-flat_white', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-flat_white' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-focaccia', '00000000-0000-0000-0000-000000000001', 'Focaccia', 'focaccia', '', 'physical', 1.50, 0, 1000, 0, 'assets/hospitality/focaccia.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'focaccia');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-focaccia', 'cat-hospitality-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-focaccia' AND category_id = 'cat-hospitality-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-frappuccino', '00000000-0000-0000-0000-000000000001', 'Frappuccino', 'frappuccino', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/frappuccino.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'frappuccino');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-frappuccino', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-frappuccino' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-galleta_chocolate', '00000000-0000-0000-0000-000000000001', 'Galleta chocolate', 'galleta_chocolate', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/galleta_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'galleta_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-galleta_chocolate', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-galleta_chocolate' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-galleta_mantequilla', '00000000-0000-0000-0000-000000000001', 'Galleta mantequilla', 'galleta_mantequilla', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/galleta_mantequilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'galleta_mantequilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-galleta_mantequilla', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-galleta_mantequilla' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-gambas_ajillo', '00000000-0000-0000-0000-000000000001', 'Gambas ajillo', 'gambas_ajillo', '', 'physical', 11.00, 0, 1000, 0, 'assets/hospitality/gambas_ajillo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'gambas_ajillo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-gambas_ajillo', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-gambas_ajillo' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-gambas_plancha', '00000000-0000-0000-0000-000000000001', 'Gambas plancha', 'gambas_plancha', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/gambas_plancha.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'gambas_plancha');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-gambas_plancha', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-gambas_plancha' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-gazpacho', '00000000-0000-0000-0000-000000000001', 'Gazpacho', 'gazpacho', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/gazpacho.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'gazpacho');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-gazpacho', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-gazpacho' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-gin_tonic', '00000000-0000-0000-0000-000000000001', 'Gin tonic', 'gin_tonic', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/gin_tonic.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'gin_tonic');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-gin_tonic', 'cat-hospitality-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-gin_tonic' AND category_id = 'cat-hospitality-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-gofre_clasico', '00000000-0000-0000-0000-000000000001', 'Gofre clasico', 'gofre_clasico', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/gofre_clasico.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'gofre_clasico');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-gofre_clasico', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-gofre_clasico' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-granizado_cafe', '00000000-0000-0000-0000-000000000001', 'Granizado cafe', 'granizado_cafe', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/granizado_cafe.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'granizado_cafe');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-granizado_cafe', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-granizado_cafe' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-granizado_limon', '00000000-0000-0000-0000-000000000001', 'Granizado limon', 'granizado_limon', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/granizado_limon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'granizado_limon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-granizado_limon', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-granizado_limon' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-gyozas', '00000000-0000-0000-0000-000000000001', 'Gyozas', 'gyozas', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/gyozas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'gyozas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-gyozas', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-gyozas' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-hamburguesa_clasica', '00000000-0000-0000-0000-000000000001', 'Hamburguesa clasica', 'hamburguesa_clasica', '', 'physical', 13.50, 0, 1000, 0, 'assets/hospitality/hamburguesa_clasica.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hamburguesa_clasica');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-hamburguesa_clasica', 'cat-hospitality-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-hamburguesa_clasica' AND category_id = 'cat-hospitality-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-hamburguesa_doble', '00000000-0000-0000-0000-000000000001', 'Hamburguesa doble', 'hamburguesa_doble', '', 'physical', 11.50, 0, 1000, 0, 'assets/hospitality/hamburguesa_doble.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hamburguesa_doble');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-hamburguesa_doble', 'cat-hospitality-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-hamburguesa_doble' AND category_id = 'cat-hospitality-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-hamburguesa_gourmet', '00000000-0000-0000-0000-000000000001', 'Hamburguesa gourmet', 'hamburguesa_gourmet', '', 'physical', 13.50, 0, 1000, 0, 'assets/hospitality/hamburguesa_gourmet.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hamburguesa_gourmet');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-hamburguesa_gourmet', 'cat-hospitality-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-hamburguesa_gourmet' AND category_id = 'cat-hospitality-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-hamburguesa_pollo', '00000000-0000-0000-0000-000000000001', 'Hamburguesa pollo', 'hamburguesa_pollo', '', 'physical', 13.50, 0, 1000, 0, 'assets/hospitality/hamburguesa_pollo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hamburguesa_pollo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-hamburguesa_pollo', 'cat-hospitality-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-hamburguesa_pollo' AND category_id = 'cat-hospitality-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-hamburguesa_queso', '00000000-0000-0000-0000-000000000001', 'Hamburguesa queso', 'hamburguesa_queso', '', 'physical', 13.50, 0, 1000, 0, 'assets/hospitality/hamburguesa_queso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hamburguesa_queso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-hamburguesa_queso', 'cat-hospitality-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-hamburguesa_queso' AND category_id = 'cat-hospitality-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-hamburguesa_smash', '00000000-0000-0000-0000-000000000001', 'Hamburguesa smash', 'hamburguesa_smash', '', 'physical', 13.50, 0, 1000, 0, 'assets/hospitality/hamburguesa_smash.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hamburguesa_smash');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-hamburguesa_smash', 'cat-hospitality-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-hamburguesa_smash' AND category_id = 'cat-hospitality-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-helado_1_bola', '00000000-0000-0000-0000-000000000001', 'Helado 1 bola', 'helado_1_bola', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/helado_1_bola.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'helado_1_bola');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-helado_1_bola', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-helado_1_bola' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-helado_2_bolas', '00000000-0000-0000-0000-000000000001', 'Helado 2 bolas', 'helado_2_bolas', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/helado_2_bolas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'helado_2_bolas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-helado_2_bolas', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-helado_2_bolas' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-helado_3_bolas', '00000000-0000-0000-0000-000000000001', 'Helado 3 bolas', 'helado_3_bolas', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/helado_3_bolas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'helado_3_bolas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-helado_3_bolas', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-helado_3_bolas' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-helado_bola', '00000000-0000-0000-0000-000000000001', 'Helado bola', 'helado_bola', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/helado_bola.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'helado_bola');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-helado_bola', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-helado_bola' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-helado_soft', '00000000-0000-0000-0000-000000000001', 'Helado soft', 'helado_soft', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/helado_soft.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'helado_soft');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-helado_soft', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-helado_soft' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-hielo', '00000000-0000-0000-0000-000000000001', 'Hielo', 'hielo', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/hielo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hielo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-hielo', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-hielo' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-hogaza', '00000000-0000-0000-0000-000000000001', 'Hogaza', 'hogaza', '', 'physical', 1.50, 0, 1000, 0, 'assets/hospitality/hogaza.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hogaza');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-hogaza', 'cat-hospitality-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-hogaza' AND category_id = 'cat-hospitality-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-hummus', '00000000-0000-0000-0000-000000000001', 'Hummus', 'hummus', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/hummus.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hummus');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-hummus', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-hummus' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-ipa_artesana', '00000000-0000-0000-0000-000000000001', 'Ipa artesana', 'ipa_artesana', '', 'physical', 2.50, 0, 1000, 0, 'assets/hospitality/ipa_artesana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ipa_artesana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-ipa_artesana', 'cat-hospitality-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-ipa_artesana' AND category_id = 'cat-hospitality-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-jamon_iberico', '00000000-0000-0000-0000-000000000001', 'Jamon iberico', 'jamon_iberico', '', 'physical', 18.00, 0, 1000, 0, 'assets/hospitality/jamon_iberico.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'jamon_iberico');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-jamon_iberico', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-jamon_iberico' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-kebab_falafel', '00000000-0000-0000-0000-000000000001', 'Kebab falafel', 'kebab_falafel', '', 'physical', 7.00, 0, 1000, 0, 'assets/hospitality/kebab_falafel.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'kebab_falafel');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-kebab_falafel', 'cat-hospitality-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-kebab_falafel' AND category_id = 'cat-hospitality-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-kebab_mixto', '00000000-0000-0000-0000-000000000001', 'Kebab mixto', 'kebab_mixto', '', 'physical', 7.00, 0, 1000, 0, 'assets/hospitality/kebab_mixto.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'kebab_mixto');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-kebab_mixto', 'cat-hospitality-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-kebab_mixto' AND category_id = 'cat-hospitality-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-kebab_pollo', '00000000-0000-0000-0000-000000000001', 'Kebab pollo', 'kebab_pollo', '', 'physical', 7.00, 0, 1000, 0, 'assets/hospitality/kebab_pollo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'kebab_pollo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-kebab_pollo', 'cat-hospitality-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-kebab_pollo' AND category_id = 'cat-hospitality-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-kebab_ternera', '00000000-0000-0000-0000-000000000001', 'Kebab ternera', 'kebab_ternera', '', 'physical', 7.00, 0, 1000, 0, 'assets/hospitality/kebab_ternera.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'kebab_ternera');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-kebab_ternera', 'cat-hospitality-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-kebab_ternera' AND category_id = 'cat-hospitality-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-lahmacun', '00000000-0000-0000-0000-000000000001', 'Lahmacun', 'lahmacun', '', 'physical', 7.00, 0, 1000, 0, 'assets/hospitality/lahmacun.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'lahmacun');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-lahmacun', 'cat-hospitality-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-lahmacun' AND category_id = 'cat-hospitality-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-lasana', '00000000-0000-0000-0000-000000000001', 'Lasana', 'lasana', '', 'physical', 11.00, 0, 1000, 0, 'assets/hospitality/lasana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'lasana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-lasana', 'cat-hospitality-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-lasana' AND category_id = 'cat-hospitality-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-latte', '00000000-0000-0000-0000-000000000001', 'Latte', 'latte', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/latte.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'latte');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-latte', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-latte' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-latte_caramelo', '00000000-0000-0000-0000-000000000001', 'Latte caramelo', 'latte_caramelo', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/latte_caramelo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'latte_caramelo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-latte_caramelo', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-latte_caramelo' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-latte_vainilla', '00000000-0000-0000-0000-000000000001', 'Latte vainilla', 'latte_vainilla', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/latte_vainilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'latte_vainilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-latte_vainilla', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-latte_vainilla' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-limonada', '00000000-0000-0000-0000-000000000001', 'Limonada', 'limonada', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/limonada.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'limonada');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-limonada', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-limonada' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-limonada_yuzu', '00000000-0000-0000-0000-000000000001', 'Limonada yuzu', 'limonada_yuzu', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/limonada_yuzu.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'limonada_yuzu');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-limonada_yuzu', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-limonada_yuzu' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-lubina_horno', '00000000-0000-0000-0000-000000000001', 'Lubina horno', 'lubina_horno', '', 'physical', 16.00, 0, 1000, 0, 'assets/hospitality/lubina_horno.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'lubina_horno');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-lubina_horno', 'cat-hospitality-pescados'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-lubina_horno' AND category_id = 'cat-hospitality-pescados');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-magdalena', '00000000-0000-0000-0000-000000000001', 'Magdalena', 'magdalena', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/magdalena.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'magdalena');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-magdalena', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-magdalena' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-maki_atun', '00000000-0000-0000-0000-000000000001', 'Maki atun', 'maki_atun', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/maki_atun.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'maki_atun');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-maki_atun', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-maki_atun' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-maki_salmon', '00000000-0000-0000-0000-000000000001', 'Maki salmon', 'maki_salmon', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/maki_salmon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'maki_salmon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-maki_salmon', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-maki_salmon' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-manzanilla', '00000000-0000-0000-0000-000000000001', 'Manzanilla', 'manzanilla', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/manzanilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'manzanilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-manzanilla', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-manzanilla' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-matcha_latte', '00000000-0000-0000-0000-000000000001', 'Matcha latte', 'matcha_latte', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/matcha_latte.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'matcha_latte');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-matcha_latte', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-matcha_latte' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-menu_dia', '00000000-0000-0000-0000-000000000001', 'Menu dia', 'menu_dia', '', 'physical', 13.50, 0, 1000, 0, 'assets/hospitality/menu_dia.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'menu_dia');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-menu_dia', 'cat-hospitality-menus'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-menu_dia' AND category_id = 'cat-hospitality-menus');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-menu_hamburguesa', '00000000-0000-0000-0000-000000000001', 'Menu hamburguesa', 'menu_hamburguesa', '', 'physical', 12.00, 0, 1000, 0, 'assets/hospitality/menu_hamburguesa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'menu_hamburguesa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-menu_hamburguesa', 'cat-hospitality-menus'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-menu_hamburguesa' AND category_id = 'cat-hospitality-menus');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-menu_infantil', '00000000-0000-0000-0000-000000000001', 'Menu infantil', 'menu_infantil', '', 'physical', 8.50, 0, 1000, 0, 'assets/hospitality/menu_infantil.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'menu_infantil');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-menu_infantil', 'cat-hospitality-menus'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-menu_infantil' AND category_id = 'cat-hospitality-menus');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-menu_kebab', '00000000-0000-0000-0000-000000000001', 'Menu kebab', 'menu_kebab', '', 'physical', 12.00, 0, 1000, 0, 'assets/hospitality/menu_kebab.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'menu_kebab');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-menu_kebab', 'cat-hospitality-menus'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-menu_kebab' AND category_id = 'cat-hospitality-menus');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-merluza_plancha', '00000000-0000-0000-0000-000000000001', 'Merluza plancha', 'merluza_plancha', '', 'physical', 14.00, 0, 1000, 0, 'assets/hospitality/merluza_plancha.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'merluza_plancha');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-merluza_plancha', 'cat-hospitality-pescados'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-merluza_plancha' AND category_id = 'cat-hospitality-pescados');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-mesa_dulce', '00000000-0000-0000-0000-000000000001', 'Mesa dulce', 'mesa_dulce', '', 'physical', 12.00, 0, 1000, 0, 'assets/hospitality/mesa_dulce.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'mesa_dulce');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-mesa_dulce', 'cat-hospitality-menus'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-mesa_dulce' AND category_id = 'cat-hospitality-menus');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-mocha', '00000000-0000-0000-0000-000000000001', 'Mocha', 'mocha', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/mocha.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'mocha');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-mocha', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-mocha' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-mochi_helado', '00000000-0000-0000-0000-000000000001', 'Mochi helado', 'mochi_helado', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/mochi_helado.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'mochi_helado');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-mochi_helado', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-mochi_helado' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-mojito', '00000000-0000-0000-0000-000000000001', 'Mojito', 'mojito', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/mojito.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'mojito');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-mojito', 'cat-hospitality-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-mojito' AND category_id = 'cat-hospitality-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-muffin_arandanos', '00000000-0000-0000-0000-000000000001', 'Muffin arandanos', 'muffin_arandanos', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/muffin_arandanos.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'muffin_arandanos');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-muffin_arandanos', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-muffin_arandanos' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-muffin_chocolate', '00000000-0000-0000-0000-000000000001', 'Muffin chocolate', 'muffin_chocolate', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/muffin_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'muffin_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-muffin_chocolate', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-muffin_chocolate' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-nachos_queso', '00000000-0000-0000-0000-000000000001', 'Nachos queso', 'nachos_queso', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/nachos_queso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'nachos_queso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-nachos_queso', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-nachos_queso' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-napolitana_chocolate', '00000000-0000-0000-0000-000000000001', 'Napolitana chocolate', 'napolitana_chocolate', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/napolitana_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'napolitana_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-napolitana_chocolate', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-napolitana_chocolate' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-nigiri_anguila', '00000000-0000-0000-0000-000000000001', 'Nigiri anguila', 'nigiri_anguila', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/nigiri_anguila.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'nigiri_anguila');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-nigiri_anguila', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-nigiri_anguila' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-nigiri_atun', '00000000-0000-0000-0000-000000000001', 'Nigiri atun', 'nigiri_atun', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/nigiri_atun.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'nigiri_atun');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-nigiri_atun', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-nigiri_atun' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-nigiri_gamba', '00000000-0000-0000-0000-000000000001', 'Nigiri gamba', 'nigiri_gamba', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/nigiri_gamba.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'nigiri_gamba');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-nigiri_gamba', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-nigiri_gamba' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-nigiri_pulpo', '00000000-0000-0000-0000-000000000001', 'Nigiri pulpo', 'nigiri_pulpo', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/nigiri_pulpo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'nigiri_pulpo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-nigiri_pulpo', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-nigiri_pulpo' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-nigiri_salmon', '00000000-0000-0000-0000-000000000001', 'Nigiri salmon', 'nigiri_salmon', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/nigiri_salmon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'nigiri_salmon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-nigiri_salmon', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-nigiri_salmon' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-nuggets', '00000000-0000-0000-0000-000000000001', 'Nuggets', 'nuggets', '', 'physical', 13.50, 0, 1000, 0, 'assets/hospitality/nuggets.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'nuggets');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-nuggets', 'cat-hospitality-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-nuggets' AND category_id = 'cat-hospitality-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pad_thai', '00000000-0000-0000-0000-000000000001', 'Pad thai', 'pad_thai', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/pad_thai.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pad_thai');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pad_thai', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pad_thai' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-paella_marisco', '00000000-0000-0000-0000-000000000001', 'Paella marisco', 'paella_marisco', '', 'physical', 16.00, 0, 1000, 0, 'assets/hospitality/paella_marisco.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'paella_marisco');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-paella_marisco', 'cat-hospitality-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-paella_marisco' AND category_id = 'cat-hospitality-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-paella_mixta', '00000000-0000-0000-0000-000000000001', 'Paella mixta', 'paella_mixta', '', 'physical', 13.50, 0, 1000, 0, 'assets/hospitality/paella_mixta.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'paella_mixta');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-paella_mixta', 'cat-hospitality-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-paella_mixta' AND category_id = 'cat-hospitality-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-paella_valenciana', '00000000-0000-0000-0000-000000000001', 'Paella valenciana', 'paella_valenciana', '', 'physical', 13.00, 0, 1000, 0, 'assets/hospitality/paella_valenciana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'paella_valenciana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-paella_valenciana', 'cat-hospitality-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-paella_valenciana' AND category_id = 'cat-hospitality-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pale_ale', '00000000-0000-0000-0000-000000000001', 'Pale ale', 'pale_ale', '', 'physical', 2.50, 0, 1000, 0, 'assets/hospitality/pale_ale.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pale_ale');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pale_ale', 'cat-hospitality-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pale_ale' AND category_id = 'cat-hospitality-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-palmera_chocolate', '00000000-0000-0000-0000-000000000001', 'Palmera chocolate', 'palmera_chocolate', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/palmera_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'palmera_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-palmera_chocolate', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-palmera_chocolate' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pan_ajo', '00000000-0000-0000-0000-000000000001', 'Pan ajo', 'pan_ajo', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/pan_ajo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pan_ajo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pan_ajo', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pan_ajo' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pan_centeno', '00000000-0000-0000-0000-000000000001', 'Pan centeno', 'pan_centeno', '', 'physical', 1.50, 0, 1000, 0, 'assets/hospitality/pan_centeno.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pan_centeno');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pan_centeno', 'cat-hospitality-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pan_centeno' AND category_id = 'cat-hospitality-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pan_integral', '00000000-0000-0000-0000-000000000001', 'Pan integral', 'pan_integral', '', 'physical', 1.50, 0, 1000, 0, 'assets/hospitality/pan_integral.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pan_integral');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pan_integral', 'cat-hospitality-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pan_integral' AND category_id = 'cat-hospitality-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pan_pita', '00000000-0000-0000-0000-000000000001', 'Pan pita', 'pan_pita', '', 'physical', 1.50, 0, 1000, 0, 'assets/hospitality/pan_pita.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pan_pita');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pan_pita', 'cat-hospitality-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pan_pita' AND category_id = 'cat-hospitality-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pan_semillas', '00000000-0000-0000-0000-000000000001', 'Pan semillas', 'pan_semillas', '', 'physical', 1.50, 0, 1000, 0, 'assets/hospitality/pan_semillas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pan_semillas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pan_semillas', 'cat-hospitality-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pan_semillas' AND category_id = 'cat-hospitality-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-panna_cotta', '00000000-0000-0000-0000-000000000001', 'Panna cotta', 'panna_cotta', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/panna_cotta.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'panna_cotta');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-panna_cotta', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-panna_cotta' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pasta_bolonesa', '00000000-0000-0000-0000-000000000001', 'Pasta bolonesa', 'pasta_bolonesa', '', 'physical', 11.00, 0, 1000, 0, 'assets/hospitality/pasta_bolonesa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pasta_bolonesa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pasta_bolonesa', 'cat-hospitality-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pasta_bolonesa' AND category_id = 'cat-hospitality-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pasta_carbonara', '00000000-0000-0000-0000-000000000001', 'Pasta carbonara', 'pasta_carbonara', '', 'physical', 11.00, 0, 1000, 0, 'assets/hospitality/pasta_carbonara.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pasta_carbonara');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pasta_carbonara', 'cat-hospitality-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pasta_carbonara' AND category_id = 'cat-hospitality-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pasta_pesto', '00000000-0000-0000-0000-000000000001', 'Pasta pesto', 'pasta_pesto', '', 'physical', 11.00, 0, 1000, 0, 'assets/hospitality/pasta_pesto.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pasta_pesto');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pasta_pesto', 'cat-hospitality-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pasta_pesto' AND category_id = 'cat-hospitality-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-patatas_bravas', '00000000-0000-0000-0000-000000000001', 'Patatas bravas', 'patatas_bravas', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/patatas_bravas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'patatas_bravas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-patatas_bravas', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-patatas_bravas' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-patatas_fritas', '00000000-0000-0000-0000-000000000001', 'Patatas fritas', 'patatas_fritas', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/patatas_fritas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'patatas_fritas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-patatas_fritas', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-patatas_fritas' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-perrito_clasico', '00000000-0000-0000-0000-000000000001', 'Perrito clasico', 'perrito_clasico', '', 'physical', 13.50, 0, 1000, 0, 'assets/hospitality/perrito_clasico.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'perrito_clasico');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-perrito_clasico', 'cat-hospitality-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-perrito_clasico' AND category_id = 'cat-hospitality-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pescaito_frito', '00000000-0000-0000-0000-000000000001', 'Pescaito frito', 'pescaito_frito', '', 'physical', 14.00, 0, 1000, 0, 'assets/hospitality/pescaito_frito.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pescaito_frito');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pescaito_frito', 'cat-hospitality-pescados'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pescaito_frito' AND category_id = 'cat-hospitality-pescados');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pincho_tortilla', '00000000-0000-0000-0000-000000000001', 'Pincho tortilla', 'pincho_tortilla', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/pincho_tortilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pincho_tortilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pincho_tortilla', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pincho_tortilla' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pizza_4_quesos', '00000000-0000-0000-0000-000000000001', 'Pizza 4 quesos', 'pizza_4_quesos', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/pizza_4_quesos.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_4_quesos');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pizza_4_quesos', 'cat-hospitality-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pizza_4_quesos' AND category_id = 'cat-hospitality-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pizza_barbacoa', '00000000-0000-0000-0000-000000000001', 'Pizza barbacoa', 'pizza_barbacoa', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/pizza_barbacoa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_barbacoa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pizza_barbacoa', 'cat-hospitality-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pizza_barbacoa' AND category_id = 'cat-hospitality-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pizza_calzone', '00000000-0000-0000-0000-000000000001', 'Pizza calzone', 'pizza_calzone', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/pizza_calzone.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_calzone');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pizza_calzone', 'cat-hospitality-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pizza_calzone' AND category_id = 'cat-hospitality-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pizza_caprichosa', '00000000-0000-0000-0000-000000000001', 'Pizza caprichosa', 'pizza_caprichosa', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/pizza_caprichosa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_caprichosa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pizza_caprichosa', 'cat-hospitality-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pizza_caprichosa' AND category_id = 'cat-hospitality-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pizza_carbonara', '00000000-0000-0000-0000-000000000001', 'Pizza carbonara', 'pizza_carbonara', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/pizza_carbonara.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_carbonara');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pizza_carbonara', 'cat-hospitality-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pizza_carbonara' AND category_id = 'cat-hospitality-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pizza_diavola', '00000000-0000-0000-0000-000000000001', 'Pizza diavola', 'pizza_diavola', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/pizza_diavola.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_diavola');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pizza_diavola', 'cat-hospitality-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pizza_diavola' AND category_id = 'cat-hospitality-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pizza_familiar', '00000000-0000-0000-0000-000000000001', 'Pizza familiar', 'pizza_familiar', '', 'physical', 14.00, 0, 1000, 0, 'assets/hospitality/pizza_familiar.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_familiar');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pizza_familiar', 'cat-hospitality-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pizza_familiar' AND category_id = 'cat-hospitality-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pizza_hawaiana', '00000000-0000-0000-0000-000000000001', 'Pizza hawaiana', 'pizza_hawaiana', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/pizza_hawaiana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_hawaiana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pizza_hawaiana', 'cat-hospitality-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pizza_hawaiana' AND category_id = 'cat-hospitality-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pizza_jamon_queso', '00000000-0000-0000-0000-000000000001', 'Pizza jamon queso', 'pizza_jamon_queso', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/pizza_jamon_queso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_jamon_queso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pizza_jamon_queso', 'cat-hospitality-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pizza_jamon_queso' AND category_id = 'cat-hospitality-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pizza_margarita', '00000000-0000-0000-0000-000000000001', 'Pizza margarita', 'pizza_margarita', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/pizza_margarita.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_margarita');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pizza_margarita', 'cat-hospitality-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pizza_margarita' AND category_id = 'cat-hospitality-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pizza_pepperoni', '00000000-0000-0000-0000-000000000001', 'Pizza pepperoni', 'pizza_pepperoni', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/pizza_pepperoni.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_pepperoni');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pizza_pepperoni', 'cat-hospitality-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pizza_pepperoni' AND category_id = 'cat-hospitality-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pizza_vegetal', '00000000-0000-0000-0000-000000000001', 'Pizza vegetal', 'pizza_vegetal', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/pizza_vegetal.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_vegetal');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pizza_vegetal', 'cat-hospitality-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pizza_vegetal' AND category_id = 'cat-hospitality-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-plato_falafel', '00000000-0000-0000-0000-000000000001', 'Plato falafel', 'plato_falafel', '', 'physical', 7.00, 0, 1000, 0, 'assets/hospitality/plato_falafel.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'plato_falafel');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-plato_falafel', 'cat-hospitality-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-plato_falafel' AND category_id = 'cat-hospitality-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-plato_kebab', '00000000-0000-0000-0000-000000000001', 'Plato kebab', 'plato_kebab', '', 'physical', 7.00, 0, 1000, 0, 'assets/hospitality/plato_kebab.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'plato_kebab');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-plato_kebab', 'cat-hospitality-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-plato_kebab' AND category_id = 'cat-hospitality-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-poke_atun', '00000000-0000-0000-0000-000000000001', 'Poke atun', 'poke_atun', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/poke_atun.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'poke_atun');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-poke_atun', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-poke_atun' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-poke_salmon', '00000000-0000-0000-0000-000000000001', 'Poke salmon', 'poke_salmon', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/poke_salmon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'poke_salmon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-poke_salmon', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-poke_salmon' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-poleo_menta', '00000000-0000-0000-0000-000000000001', 'Poleo menta', 'poleo_menta', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/poleo_menta.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'poleo_menta');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-poleo_menta', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-poleo_menta' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pollo_asado', '00000000-0000-0000-0000-000000000001', 'Pollo asado', 'pollo_asado', '', 'physical', 13.50, 0, 1000, 0, 'assets/hospitality/pollo_asado.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pollo_asado');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pollo_asado', 'cat-hospitality-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pollo_asado' AND category_id = 'cat-hospitality-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pollo_teriyaki', '00000000-0000-0000-0000-000000000001', 'Pollo teriyaki', 'pollo_teriyaki', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/pollo_teriyaki.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pollo_teriyaki');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pollo_teriyaki', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pollo_teriyaki' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-pulpo_gallega', '00000000-0000-0000-0000-000000000001', 'Pulpo gallega', 'pulpo_gallega', '', 'physical', 16.00, 0, 1000, 0, 'assets/hospitality/pulpo_gallega.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pulpo_gallega');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-pulpo_gallega', 'cat-hospitality-pescados'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-pulpo_gallega' AND category_id = 'cat-hospitality-pescados');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-racion_cachopo', '00000000-0000-0000-0000-000000000001', 'Racion cachopo', 'racion_cachopo', '', 'physical', 16.00, 0, 1000, 0, 'assets/hospitality/racion_cachopo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'racion_cachopo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-racion_cachopo', 'cat-hospitality-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-racion_cachopo' AND category_id = 'cat-hospitality-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-racion_croquetas', '00000000-0000-0000-0000-000000000001', 'Racion croquetas', 'racion_croquetas', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/racion_croquetas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'racion_croquetas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-racion_croquetas', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-racion_croquetas' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-racion_gambas', '00000000-0000-0000-0000-000000000001', 'Racion gambas', 'racion_gambas', '', 'physical', 12.00, 0, 1000, 0, 'assets/hospitality/racion_gambas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'racion_gambas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-racion_gambas', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-racion_gambas' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-racion_patatas_bravas', '00000000-0000-0000-0000-000000000001', 'Racion patatas bravas', 'racion_patatas_bravas', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/racion_patatas_bravas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'racion_patatas_bravas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-racion_patatas_bravas', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-racion_patatas_bravas' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-racion_rabas', '00000000-0000-0000-0000-000000000001', 'Racion rabas', 'racion_rabas', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/racion_rabas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'racion_rabas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-racion_rabas', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-racion_rabas' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-ramen_cerdo', '00000000-0000-0000-0000-000000000001', 'Ramen cerdo', 'ramen_cerdo', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/ramen_cerdo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ramen_cerdo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-ramen_cerdo', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-ramen_cerdo' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-ramen_pollo', '00000000-0000-0000-0000-000000000001', 'Ramen pollo', 'ramen_pollo', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/ramen_pollo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ramen_pollo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-ramen_pollo', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-ramen_pollo' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-ron_cola', '00000000-0000-0000-0000-000000000001', 'Ron cola', 'ron_cola', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/ron_cola.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ron_cola');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-ron_cola', 'cat-hospitality-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-ron_cola' AND category_id = 'cat-hospitality-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-sake_copa', '00000000-0000-0000-0000-000000000001', 'Sake copa', 'sake_copa', '', 'physical', 3.20, 0, 1000, 0, 'assets/hospitality/sake_copa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sake_copa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-sake_copa', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-sake_copa' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-salmon_teriyaki', '00000000-0000-0000-0000-000000000001', 'Salmon teriyaki', 'salmon_teriyaki', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/salmon_teriyaki.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'salmon_teriyaki');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-salmon_teriyaki', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-salmon_teriyaki' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-salmorejo', '00000000-0000-0000-0000-000000000001', 'Salmorejo', 'salmorejo', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/salmorejo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'salmorejo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-salmorejo', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-salmorejo' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-salsa_extra', '00000000-0000-0000-0000-000000000001', 'Salsa extra', 'salsa_extra', '', 'physical', 1.20, 0, 1000, 0, 'assets/hospitality/salsa_extra.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'salsa_extra');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-salsa_extra', 'cat-hospitality-extras'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-salsa_extra' AND category_id = 'cat-hospitality-extras');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-salsa_yogur', '00000000-0000-0000-0000-000000000001', 'Salsa yogur', 'salsa_yogur', '', 'physical', 1.20, 0, 1000, 0, 'assets/hospitality/salsa_yogur.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'salsa_yogur');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-salsa_yogur', 'cat-hospitality-extras'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-salsa_yogur' AND category_id = 'cat-hospitality-extras');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-sandwich_mixto', '00000000-0000-0000-0000-000000000001', 'Sandwich mixto', 'sandwich_mixto', '', 'physical', 5.00, 0, 1000, 0, 'assets/hospitality/sandwich_mixto.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sandwich_mixto');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-sandwich_mixto', 'cat-hospitality-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-sandwich_mixto' AND category_id = 'cat-hospitality-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-sandwich_vegetal', '00000000-0000-0000-0000-000000000001', 'Sandwich vegetal', 'sandwich_vegetal', '', 'physical', 5.00, 0, 1000, 0, 'assets/hospitality/sandwich_vegetal.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sandwich_vegetal');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-sandwich_vegetal', 'cat-hospitality-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-sandwich_vegetal' AND category_id = 'cat-hospitality-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-sangria_jarra', '00000000-0000-0000-0000-000000000001', 'Sangria jarra', 'sangria_jarra', '', 'physical', 3.20, 0, 1000, 0, 'assets/hospitality/sangria_jarra.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sangria_jarra');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-sangria_jarra', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-sangria_jarra' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-sashimi_atun', '00000000-0000-0000-0000-000000000001', 'Sashimi atun', 'sashimi_atun', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/sashimi_atun.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sashimi_atun');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-sashimi_atun', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-sashimi_atun' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-sashimi_mixto', '00000000-0000-0000-0000-000000000001', 'Sashimi mixto', 'sashimi_mixto', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/sashimi_mixto.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sashimi_mixto');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-sashimi_mixto', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-sashimi_mixto' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-sashimi_salmon', '00000000-0000-0000-0000-000000000001', 'Sashimi salmon', 'sashimi_salmon', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/sashimi_salmon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sashimi_salmon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-sashimi_salmon', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-sashimi_salmon' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-secreto_iberico', '00000000-0000-0000-0000-000000000001', 'Secreto iberico', 'secreto_iberico', '', 'physical', 15.00, 0, 1000, 0, 'assets/hospitality/secreto_iberico.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'secreto_iberico');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-secreto_iberico', 'cat-hospitality-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-secreto_iberico' AND category_id = 'cat-hospitality-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-shawarma_plato', '00000000-0000-0000-0000-000000000001', 'Shawarma plato', 'shawarma_plato', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/shawarma_plato.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'shawarma_plato');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-shawarma_plato', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-shawarma_plato' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-sidra_botella', '00000000-0000-0000-0000-000000000001', 'Sidra botella', 'sidra_botella', '', 'physical', 3.20, 0, 1000, 0, 'assets/hospitality/sidra_botella.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sidra_botella');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-sidra_botella', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-sidra_botella' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-sidra_natural', '00000000-0000-0000-0000-000000000001', 'Sidra natural', 'sidra_natural', '', 'physical', 3.20, 0, 1000, 0, 'assets/hospitality/sidra_natural.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sidra_natural');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-sidra_natural', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-sidra_natural' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-smoothie_fresa', '00000000-0000-0000-0000-000000000001', 'Smoothie fresa', 'smoothie_fresa', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/smoothie_fresa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'smoothie_fresa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-smoothie_fresa', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-smoothie_fresa' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-smoothie_mango', '00000000-0000-0000-0000-000000000001', 'Smoothie mango', 'smoothie_mango', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/smoothie_mango.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'smoothie_mango');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-smoothie_mango', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-smoothie_mango' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-solomillo', '00000000-0000-0000-0000-000000000001', 'Solomillo', 'solomillo', '', 'physical', 19.50, 0, 1000, 0, 'assets/hospitality/solomillo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'solomillo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-solomillo', 'cat-hospitality-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-solomillo' AND category_id = 'cat-hospitality-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-sopa_miso', '00000000-0000-0000-0000-000000000001', 'Sopa miso', 'sopa_miso', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/sopa_miso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sopa_miso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-sopa_miso', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-sopa_miso' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-spicy_salmon_roll', '00000000-0000-0000-0000-000000000001', 'Spicy salmon roll', 'spicy_salmon_roll', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/spicy_salmon_roll.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'spicy_salmon_roll');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-spicy_salmon_roll', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-spicy_salmon_roll' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-spring_rolls', '00000000-0000-0000-0000-000000000001', 'Spring rolls', 'spring_rolls', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/spring_rolls.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'spring_rolls');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-spring_rolls', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-spring_rolls' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-sprite', '00000000-0000-0000-0000-000000000001', 'Sprite', 'sprite', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/sprite.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sprite');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-sprite', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-sprite' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-stout', '00000000-0000-0000-0000-000000000001', 'Stout', 'stout', '', 'physical', 2.50, 0, 1000, 0, 'assets/hospitality/stout.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'stout');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-stout', 'cat-hospitality-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-stout' AND category_id = 'cat-hospitality-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tabla_embutidos', '00000000-0000-0000-0000-000000000001', 'Tabla embutidos', 'tabla_embutidos', '', 'physical', 14.00, 0, 1000, 0, 'assets/hospitality/tabla_embutidos.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tabla_embutidos');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tabla_embutidos', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tabla_embutidos' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tabla_iberica', '00000000-0000-0000-0000-000000000001', 'Tabla iberica', 'tabla_iberica', '', 'physical', 16.50, 0, 1000, 0, 'assets/hospitality/tabla_iberica.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tabla_iberica');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tabla_iberica', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tabla_iberica' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tabla_mixta', '00000000-0000-0000-0000-000000000001', 'Tabla mixta', 'tabla_mixta', '', 'physical', 15.00, 0, 1000, 0, 'assets/hospitality/tabla_mixta.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tabla_mixta');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tabla_mixta', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tabla_mixta' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tabla_quesos', '00000000-0000-0000-0000-000000000001', 'Tabla quesos', 'tabla_quesos', '', 'physical', 13.00, 0, 1000, 0, 'assets/hospitality/tabla_quesos.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tabla_quesos');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tabla_quesos', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tabla_quesos' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tacos', '00000000-0000-0000-0000-000000000001', 'Tacos', 'tacos', '', 'physical', 13.50, 0, 1000, 0, 'assets/hospitality/tacos.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tacos');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tacos', 'cat-hospitality-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tacos' AND category_id = 'cat-hospitality-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tapa_aceitunas', '00000000-0000-0000-0000-000000000001', 'Tapa aceitunas', 'tapa_aceitunas', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/tapa_aceitunas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tapa_aceitunas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tapa_aceitunas', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tapa_aceitunas' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tapa_bravas', '00000000-0000-0000-0000-000000000001', 'Tapa bravas', 'tapa_bravas', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/tapa_bravas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tapa_bravas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tapa_bravas', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tapa_bravas' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tapa_croquetas', '00000000-0000-0000-0000-000000000001', 'Tapa croquetas', 'tapa_croquetas', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/tapa_croquetas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tapa_croquetas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tapa_croquetas', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tapa_croquetas' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tapa_jamon', '00000000-0000-0000-0000-000000000001', 'Tapa jamon', 'tapa_jamon', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/tapa_jamon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tapa_jamon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tapa_jamon', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tapa_jamon' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tapa_queso', '00000000-0000-0000-0000-000000000001', 'Tapa queso', 'tapa_queso', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/tapa_queso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tapa_queso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tapa_queso', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tapa_queso' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tapa_queso_manchego', '00000000-0000-0000-0000-000000000001', 'Tapa queso manchego', 'tapa_queso_manchego', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/tapa_queso_manchego.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tapa_queso_manchego');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tapa_queso_manchego', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tapa_queso_manchego' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tapa_tortilla', '00000000-0000-0000-0000-000000000001', 'Tapa tortilla', 'tapa_tortilla', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/tapa_tortilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tapa_tortilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tapa_tortilla', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tapa_tortilla' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tarrina_1l', '00000000-0000-0000-0000-000000000001', 'Tarrina 1l', 'tarrina_1l', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/tarrina_1l.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tarrina_1l');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tarrina_1l', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tarrina_1l' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tarrina_500ml', '00000000-0000-0000-0000-000000000001', 'Tarrina 500ml', 'tarrina_500ml', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/tarrina_500ml.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tarrina_500ml');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tarrina_500ml', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tarrina_500ml' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tarta_chocolate', '00000000-0000-0000-0000-000000000001', 'Tarta chocolate', 'tarta_chocolate', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/tarta_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tarta_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tarta_chocolate', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tarta_chocolate' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tarta_manzana', '00000000-0000-0000-0000-000000000001', 'Tarta manzana', 'tarta_manzana', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/tarta_manzana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tarta_manzana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tarta_manzana', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tarta_manzana' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tarta_matcha', '00000000-0000-0000-0000-000000000001', 'Tarta matcha', 'tarta_matcha', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/tarta_matcha.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tarta_matcha');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tarta_matcha', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tarta_matcha' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tarta_queso', '00000000-0000-0000-0000-000000000001', 'Tarta queso', 'tarta_queso', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/tarta_queso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tarta_queso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tarta_queso', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tarta_queso' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tarta_zanahoria', '00000000-0000-0000-0000-000000000001', 'Tarta zanahoria', 'tarta_zanahoria', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/tarta_zanahoria.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tarta_zanahoria');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tarta_zanahoria', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tarta_zanahoria' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-te_negro', '00000000-0000-0000-0000-000000000001', 'Te negro', 'te_negro', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/te_negro.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'te_negro');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-te_negro', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-te_negro' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-te_rojo', '00000000-0000-0000-0000-000000000001', 'Te rojo', 'te_rojo', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/te_rojo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'te_rojo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-te_rojo', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-te_rojo' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-te_turco', '00000000-0000-0000-0000-000000000001', 'Te turco', 'te_turco', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/te_turco.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'te_turco');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-te_turco', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-te_turco' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-te_verde', '00000000-0000-0000-0000-000000000001', 'Te verde', 'te_verde', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/te_verde.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'te_verde');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-te_verde', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-te_verde' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-te_verde_japones', '00000000-0000-0000-0000-000000000001', 'Te verde japones', 'te_verde_japones', '', 'physical', 1.80, 0, 1000, 0, 'assets/hospitality/te_verde_japones.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'te_verde_japones');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-te_verde_japones', 'cat-hospitality-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-te_verde_japones' AND category_id = 'cat-hospitality-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tempura_gambas', '00000000-0000-0000-0000-000000000001', 'Tempura gambas', 'tempura_gambas', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/tempura_gambas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tempura_gambas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tempura_gambas', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tempura_gambas' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tempura_helado', '00000000-0000-0000-0000-000000000001', 'Tempura helado', 'tempura_helado', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/tempura_helado.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tempura_helado');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tempura_helado', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tempura_helado' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tempura_roll', '00000000-0000-0000-0000-000000000001', 'Tempura roll', 'tempura_roll', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/tempura_roll.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tempura_roll');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tempura_roll', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tempura_roll' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tempura_verduras', '00000000-0000-0000-0000-000000000001', 'Tempura verduras', 'tempura_verduras', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/tempura_verduras.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tempura_verduras');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tempura_verduras', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tempura_verduras' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tinto_verano', '00000000-0000-0000-0000-000000000001', 'Tinto verano', 'tinto_verano', '', 'physical', 3.20, 0, 1000, 0, 'assets/hospitality/tinto_verano.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tinto_verano');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tinto_verano', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tinto_verano' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tiramisu', '00000000-0000-0000-0000-000000000001', 'Tiramisu', 'tiramisu', '', 'physical', 4.50, 0, 1000, 0, 'assets/hospitality/tiramisu.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tiramisu');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tiramisu', 'cat-hospitality-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tiramisu' AND category_id = 'cat-hospitality-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tonica', '00000000-0000-0000-0000-000000000001', 'Tonica', 'tonica', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/tonica.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tonica');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tonica', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tonica' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tortilla_espanola', '00000000-0000-0000-0000-000000000001', 'Tortilla espanola', 'tortilla_espanola', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/tortilla_espanola.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tortilla_espanola');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tortilla_espanola', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tortilla_espanola' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tostada_aguacate', '00000000-0000-0000-0000-000000000001', 'Tostada aguacate', 'tostada_aguacate', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/tostada_aguacate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tostada_aguacate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tostada_aguacate', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tostada_aguacate' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tostada_mantequilla', '00000000-0000-0000-0000-000000000001', 'Tostada mantequilla', 'tostada_mantequilla', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/tostada_mantequilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tostada_mantequilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tostada_mantequilla', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tostada_mantequilla' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-tostada_tomate', '00000000-0000-0000-0000-000000000001', 'Tostada tomate', 'tostada_tomate', '', 'physical', 2.80, 0, 1000, 0, 'assets/hospitality/tostada_tomate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tostada_tomate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-tostada_tomate', 'cat-hospitality-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-tostada_tomate' AND category_id = 'cat-hospitality-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-uramaki_aguacate', '00000000-0000-0000-0000-000000000001', 'Uramaki aguacate', 'uramaki_aguacate', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/uramaki_aguacate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'uramaki_aguacate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-uramaki_aguacate', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-uramaki_aguacate' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-vegetariano_roll', '00000000-0000-0000-0000-000000000001', 'Vegetariano roll', 'vegetariano_roll', '', 'physical', 9.50, 0, 1000, 0, 'assets/hospitality/vegetariano_roll.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'vegetariano_roll');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-vegetariano_roll', 'cat-hospitality-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-vegetariano_roll' AND category_id = 'cat-hospitality-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-verduras_plancha', '00000000-0000-0000-0000-000000000001', 'Verduras plancha', 'verduras_plancha', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/verduras_plancha.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'verduras_plancha');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-verduras_plancha', 'cat-hospitality-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-verduras_plancha' AND category_id = 'cat-hospitality-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-vermut', '00000000-0000-0000-0000-000000000001', 'Vermut', 'vermut', '', 'physical', 3.20, 0, 1000, 0, 'assets/hospitality/vermut.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'vermut');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-vermut', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-vermut' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-vino_blanco_copa', '00000000-0000-0000-0000-000000000001', 'Vino blanco copa', 'vino_blanco_copa', '', 'physical', 3.20, 0, 1000, 0, 'assets/hospitality/vino_blanco_copa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'vino_blanco_copa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-vino_blanco_copa', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-vino_blanco_copa' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-vino_rosado_copa', '00000000-0000-0000-0000-000000000001', 'Vino rosado copa', 'vino_rosado_copa', '', 'physical', 3.20, 0, 1000, 0, 'assets/hospitality/vino_rosado_copa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'vino_rosado_copa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-vino_rosado_copa', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-vino_rosado_copa' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-vino_tinto_copa', '00000000-0000-0000-0000-000000000001', 'Vino tinto copa', 'vino_tinto_copa', '', 'physical', 3.20, 0, 1000, 0, 'assets/hospitality/vino_tinto_copa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'vino_tinto_copa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-vino_tinto_copa', 'cat-hospitality-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-vino_tinto_copa' AND category_id = 'cat-hospitality-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-wheat_beer', '00000000-0000-0000-0000-000000000001', 'Wheat beer', 'wheat_beer', '', 'physical', 2.50, 0, 1000, 0, 'assets/hospitality/wheat_beer.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'wheat_beer');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-wheat_beer', 'cat-hospitality-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-wheat_beer' AND category_id = 'cat-hospitality-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-whisky_cola', '00000000-0000-0000-0000-000000000001', 'Whisky cola', 'whisky_cola', '', 'physical', 6.50, 0, 1000, 0, 'assets/hospitality/whisky_cola.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'whisky_cola');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-whisky_cola', 'cat-hospitality-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-whisky_cola' AND category_id = 'cat-hospitality-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-wrap_falafel', '00000000-0000-0000-0000-000000000001', 'Wrap falafel', 'wrap_falafel', '', 'physical', 7.00, 0, 1000, 0, 'assets/hospitality/wrap_falafel.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'wrap_falafel');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-wrap_falafel', 'cat-hospitality-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-wrap_falafel' AND category_id = 'cat-hospitality-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-wrap_pollo', '00000000-0000-0000-0000-000000000001', 'Wrap pollo', 'wrap_pollo', '', 'physical', 5.00, 0, 1000, 0, 'assets/hospitality/wrap_pollo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'wrap_pollo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-wrap_pollo', 'cat-hospitality-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-wrap_pollo' AND category_id = 'cat-hospitality-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-wrap_vegetal', '00000000-0000-0000-0000-000000000001', 'Wrap vegetal', 'wrap_vegetal', '', 'physical', 5.00, 0, 1000, 0, 'assets/hospitality/wrap_vegetal.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'wrap_vegetal');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-wrap_vegetal', 'cat-hospitality-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-wrap_vegetal' AND category_id = 'cat-hospitality-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-zumo_naranja', '00000000-0000-0000-0000-000000000001', 'Zumo naranja', 'zumo_naranja', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/zumo_naranja.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'zumo_naranja');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-zumo_naranja', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-zumo_naranja' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-zumo_pina', '00000000-0000-0000-0000-000000000001', 'Zumo pina', 'zumo_pina', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/zumo_pina.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'zumo_pina');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-zumo_pina', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-zumo_pina' AND category_id = 'cat-hospitality-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, image, created_at, updated_at)
SELECT 'prod-hospitality-zumo_tomate', '00000000-0000-0000-0000-000000000001', 'Zumo tomate', 'zumo_tomate', '', 'physical', 2.20, 0, 1000, 0, 'assets/hospitality/zumo_tomate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'zumo_tomate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-hospitality-zumo_tomate', 'cat-hospitality-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-hospitality-zumo_tomate' AND category_id = 'cat-hospitality-refrescos');
