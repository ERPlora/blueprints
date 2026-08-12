-- Catálogo starter 'restaurant' generado por scripts/build_starter_catalog.py — NO editar a mano.
-- 280 productos en 19 categorías + 2 cajeros. IVA vía módulo taxes (ADR-0085).
-- hub_id = 00000000-0000-0000-0000-000000000001. Importes en CÉNTIMOS enteros (ADR-0007); cantidades a escala 10⁶ (ADR-0147).
-- Idempotente (WHERE NOT EXISTS).
-- Requiere los módulos 'taxes', 'inventory' y 'staff' instalados (sus tablas existen) ANTES de aplicar.

INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-cafes', '00000000-0000-0000-0000-000000000001', 'Cafés e infusiones', 'cafes', 'cafe-outline', 0, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Cafés e infusiones');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-refrescos', '00000000-0000-0000-0000-000000000001', 'Refrescos y zumos', 'refrescos', 'nutrition-outline', 1, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Refrescos y zumos');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-cervezas', '00000000-0000-0000-0000-000000000001', 'Cervezas', 'cervezas', 'beer-outline', 2, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Cervezas');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-vinos', '00000000-0000-0000-0000-000000000001', 'Vinos y vermut', 'vinos', 'wine-outline', 3, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Vinos y vermut');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-cocteles', '00000000-0000-0000-0000-000000000001', 'Cócteles y copas', 'cocteles', 'wine-outline', 4, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Cócteles y copas');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-desayunos', '00000000-0000-0000-0000-000000000001', 'Desayunos y tostadas', 'desayunos', 'sunny-outline', 5, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Desayunos y tostadas');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-tapas', '00000000-0000-0000-0000-000000000001', 'Tapas y raciones', 'tapas', 'restaurant-outline', 6, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Tapas y raciones');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-ensaladas', '00000000-0000-0000-0000-000000000001', 'Ensaladas', 'ensaladas', 'leaf-outline', 7, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Ensaladas');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-arroces', '00000000-0000-0000-0000-000000000001', 'Arroces y pastas', 'arroces', 'restaurant-outline', 8, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Arroces y pastas');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-pizzas', '00000000-0000-0000-0000-000000000001', 'Pizzas', 'pizzas', 'pizza-outline', 9, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Pizzas');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-kebabs', '00000000-0000-0000-0000-000000000001', 'Kebabs y durum', 'kebabs', 'fast-food-outline', 10, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Kebabs y durum');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-bocadillos', '00000000-0000-0000-0000-000000000001', 'Bocadillos y wraps', 'bocadillos', 'fast-food-outline', 11, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Bocadillos y wraps');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-japones', '00000000-0000-0000-0000-000000000001', 'Sushi y cocina asiática', 'japones', 'fish-outline', 12, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Sushi y cocina asiática');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-carnes', '00000000-0000-0000-0000-000000000001', 'Carnes', 'carnes', 'restaurant-outline', 13, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Carnes');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-pescados', '00000000-0000-0000-0000-000000000001', 'Pescados', 'pescados', 'fish-outline', 14, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Pescados');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-menus', '00000000-0000-0000-0000-000000000001', 'Menús', 'menus', 'list-outline', 15, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Menús');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-postres', '00000000-0000-0000-0000-000000000001', 'Postres y helados', 'postres', 'ice-cream-outline', 16, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Postres y helados');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-panes', '00000000-0000-0000-0000-000000000001', 'Panadería', 'panes', 'pizza-outline', 17, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Panadería');
INSERT INTO inventory_category (id, hub_id, name, slug, icon, "order", created_at, updated_at)
SELECT 'cat-restaurant-extras', '00000000-0000-0000-0000-000000000001', 'Extras y complementos', 'extras', 'add-circle-outline', 18, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_category WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND name = 'Extras y complementos');


INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-agua_con_gas', '00000000-0000-0000-0000-000000000001', 'Agua con gas', 'agua_con_gas', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/agua_con_gas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'agua_con_gas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-agua_con_gas', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-agua_con_gas' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-agua_mineral', '00000000-0000-0000-0000-000000000001', 'Agua mineral', 'agua_mineral', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/agua_mineral.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'agua_mineral');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-agua_mineral', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-agua_mineral' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-alitas_pollo', '00000000-0000-0000-0000-000000000001', 'Alitas pollo', 'alitas_pollo', '', 'physical', 1350, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/alitas_pollo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'alitas_pollo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-alitas_pollo', 'cat-restaurant-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-alitas_pollo' AND category_id = 'cat-restaurant-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-americano', '00000000-0000-0000-0000-000000000001', 'Americano', 'americano', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/americano.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'americano');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-americano', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-americano' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-aquarius', '00000000-0000-0000-0000-000000000001', 'Aquarius', 'aquarius', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/aquarius.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'aquarius');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-aquarius', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-aquarius' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-aros_cebolla', '00000000-0000-0000-0000-000000000001', 'Aros cebolla', 'aros_cebolla', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/aros_cebolla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'aros_cebolla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-aros_cebolla', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-aros_cebolla' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-arroz_banda', '00000000-0000-0000-0000-000000000001', 'Arroz banda', 'arroz_banda', '', 'physical', 1100, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/arroz_banda.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'arroz_banda');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-arroz_banda', 'cat-restaurant-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-arroz_banda' AND category_id = 'cat-restaurant-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-arroz_extra', '00000000-0000-0000-0000-000000000001', 'Arroz extra', 'arroz_extra', '', 'physical', 1100, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/arroz_extra.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'arroz_extra');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-arroz_extra', 'cat-restaurant-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-arroz_extra' AND category_id = 'cat-restaurant-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-arroz_negro', '00000000-0000-0000-0000-000000000001', 'Arroz negro', 'arroz_negro', '', 'physical', 1100, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/arroz_negro.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'arroz_negro');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-arroz_negro', 'cat-restaurant-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-arroz_negro' AND category_id = 'cat-restaurant-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-arroz_wok', '00000000-0000-0000-0000-000000000001', 'Arroz wok', 'arroz_wok', '', 'physical', 1100, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/arroz_wok.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'arroz_wok');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-arroz_wok', 'cat-restaurant-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-arroz_wok' AND category_id = 'cat-restaurant-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-ayran', '00000000-0000-0000-0000-000000000001', 'Ayran', 'ayran', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/ayran.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ayran');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-ayran', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-ayran' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-bagel_salmon', '00000000-0000-0000-0000-000000000001', 'Bagel salmón', 'bagel_salmon', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/bagel_salmon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bagel_salmon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-bagel_salmon', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-bagel_salmon' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-barra_pan', '00000000-0000-0000-0000-000000000001', 'Barra pan', 'barra_pan', '', 'physical', 150, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/barra_pan.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'barra_pan');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-barra_pan', 'cat-restaurant-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-barra_pan' AND category_id = 'cat-restaurant-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-batido_chocolate', '00000000-0000-0000-0000-000000000001', 'Batido chocolate', 'batido_chocolate', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/batido_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'batido_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-batido_chocolate', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-batido_chocolate' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-batido_fresa', '00000000-0000-0000-0000-000000000001', 'Batido fresa', 'batido_fresa', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/batido_fresa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'batido_fresa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-batido_fresa', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-batido_fresa' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-batido_vainilla', '00000000-0000-0000-0000-000000000001', 'Batido vainilla', 'batido_vainilla', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/batido_vainilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'batido_vainilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-batido_vainilla', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-batido_vainilla' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-bocadillo_calamares', '00000000-0000-0000-0000-000000000001', 'Bocadillo calamares', 'bocadillo_calamares', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/bocadillo_calamares.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bocadillo_calamares');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-bocadillo_calamares', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-bocadillo_calamares' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-bocadillo_jamon', '00000000-0000-0000-0000-000000000001', 'Bocadillo jamón', 'bocadillo_jamon', '', 'physical', 500, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/bocadillo_jamon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bocadillo_jamon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-bocadillo_jamon', 'cat-restaurant-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-bocadillo_jamon' AND category_id = 'cat-restaurant-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-bocadillo_jamon_queso', '00000000-0000-0000-0000-000000000001', 'Bocadillo jamón queso', 'bocadillo_jamon_queso', '', 'physical', 500, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/bocadillo_jamon_queso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bocadillo_jamon_queso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-bocadillo_jamon_queso', 'cat-restaurant-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-bocadillo_jamon_queso' AND category_id = 'cat-restaurant-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-bocadillo_lomo', '00000000-0000-0000-0000-000000000001', 'Bocadillo lomo', 'bocadillo_lomo', '', 'physical', 500, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/bocadillo_lomo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bocadillo_lomo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-bocadillo_lomo', 'cat-restaurant-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-bocadillo_lomo' AND category_id = 'cat-restaurant-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-bocadillo_pulled_pork', '00000000-0000-0000-0000-000000000001', 'Bocadillo pulled pork', 'bocadillo_pulled_pork', '', 'physical', 500, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/bocadillo_pulled_pork.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bocadillo_pulled_pork');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-bocadillo_pulled_pork', 'cat-restaurant-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-bocadillo_pulled_pork' AND category_id = 'cat-restaurant-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-bocadillo_tortilla', '00000000-0000-0000-0000-000000000001', 'Bocadillo tortilla', 'bocadillo_tortilla', '', 'physical', 500, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/bocadillo_tortilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bocadillo_tortilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-bocadillo_tortilla', 'cat-restaurant-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-bocadillo_tortilla' AND category_id = 'cat-restaurant-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-bocadillo_vegetal', '00000000-0000-0000-0000-000000000001', 'Bocadillo vegetal', 'bocadillo_vegetal', '', 'physical', 500, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/bocadillo_vegetal.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bocadillo_vegetal');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-bocadillo_vegetal', 'cat-restaurant-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-bocadillo_vegetal' AND category_id = 'cat-restaurant-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-botella_albarino', '00000000-0000-0000-0000-000000000001', 'Botella albariño', 'botella_albarino', '', 'physical', 1800, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/botella_albarino.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'botella_albarino');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-botella_albarino', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-botella_albarino' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-botella_champagne', '00000000-0000-0000-0000-000000000001', 'Botella champagne', 'botella_champagne', '', 'physical', 4500, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/botella_champagne.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'botella_champagne');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-botella_champagne', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-botella_champagne' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-botella_ribera_duero', '00000000-0000-0000-0000-000000000001', 'Botella ribera duero', 'botella_ribera_duero', '', 'physical', 2200, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/botella_ribera_duero.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'botella_ribera_duero');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-botella_ribera_duero', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-botella_ribera_duero' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-botella_rioja_crianza', '00000000-0000-0000-0000-000000000001', 'Botella rioja crianza', 'botella_rioja_crianza', '', 'physical', 1900, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/botella_rioja_crianza.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'botella_rioja_crianza');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-botella_rioja_crianza', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-botella_rioja_crianza' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-bowl_pollo', '00000000-0000-0000-0000-000000000001', 'Bowl pollo', 'bowl_pollo', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/bowl_pollo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bowl_pollo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-bowl_pollo', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-bowl_pollo' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-brownie', '00000000-0000-0000-0000-000000000001', 'Brownie', 'brownie', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/brownie.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'brownie');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-brownie', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-brownie' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-brownie_chocolate', '00000000-0000-0000-0000-000000000001', 'Brownie chocolate', 'brownie_chocolate', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/brownie_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'brownie_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-brownie_chocolate', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-brownie_chocolate' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-bruschetta', '00000000-0000-0000-0000-000000000001', 'Bruschetta', 'bruschetta', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/bruschetta.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'bruschetta');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-bruschetta', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-bruschetta' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-cafe_bombom', '00000000-0000-0000-0000-000000000001', 'Café bombón', 'cafe_bombom', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/cafe_bombom.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cafe_bombom');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-cafe_bombom', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-cafe_bombom' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-cafe_con_leche', '00000000-0000-0000-0000-000000000001', 'Café con leche', 'cafe_con_leche', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/cafe_con_leche.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cafe_con_leche');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-cafe_con_leche', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-cafe_con_leche' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-cafe_cortado', '00000000-0000-0000-0000-000000000001', 'Café cortado', 'cafe_cortado', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/cafe_cortado.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cafe_cortado');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-cafe_cortado', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-cafe_cortado' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-cafe_helado', '00000000-0000-0000-0000-000000000001', 'Café helado', 'cafe_helado', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/cafe_helado.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cafe_helado');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-cafe_helado', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-cafe_helado' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-cafe_solo', '00000000-0000-0000-0000-000000000001', 'Café solo', 'cafe_solo', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/cafe_solo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cafe_solo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-cafe_solo', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-cafe_solo' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-calamares_romana', '00000000-0000-0000-0000-000000000001', 'Calamares romana', 'calamares_romana', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/calamares_romana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'calamares_romana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-calamares_romana', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-calamares_romana' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-california_roll', '00000000-0000-0000-0000-000000000001', 'California roll', 'california_roll', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/california_roll.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'california_roll');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-california_roll', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-california_roll' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-capuchino', '00000000-0000-0000-0000-000000000001', 'Capuchino', 'capuchino', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/capuchino.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'capuchino');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-capuchino', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-capuchino' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-carajillo', '00000000-0000-0000-0000-000000000001', 'Carajillo', 'carajillo', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/carajillo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'carajillo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-carajillo', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-carajillo' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-cerveza_botella', '00000000-0000-0000-0000-000000000001', 'Cerveza botella', 'cerveza_botella', '', 'physical', 250, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/cerveza_botella.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cerveza_botella');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-cerveza_botella', 'cat-restaurant-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-cerveza_botella' AND category_id = 'cat-restaurant-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-cerveza_cana', '00000000-0000-0000-0000-000000000001', 'Cerveza caña', 'cerveza_cana', '', 'physical', 250, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/cerveza_cana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cerveza_cana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-cerveza_cana', 'cat-restaurant-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-cerveza_cana' AND category_id = 'cat-restaurant-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-cerveza_japonesa', '00000000-0000-0000-0000-000000000001', 'Cerveza japonesa', 'cerveza_japonesa', '', 'physical', 250, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/cerveza_japonesa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cerveza_japonesa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-cerveza_japonesa', 'cat-restaurant-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-cerveza_japonesa' AND category_id = 'cat-restaurant-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-cerveza_jarra', '00000000-0000-0000-0000-000000000001', 'Cerveza jarra', 'cerveza_jarra', '', 'physical', 250, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/cerveza_jarra.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cerveza_jarra');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-cerveza_jarra', 'cat-restaurant-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-cerveza_jarra' AND category_id = 'cat-restaurant-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-cerveza_sin', '00000000-0000-0000-0000-000000000001', 'Cerveza sin', 'cerveza_sin', '', 'physical', 250, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/cerveza_sin.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cerveza_sin');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-cerveza_sin', 'cat-restaurant-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-cerveza_sin' AND category_id = 'cat-restaurant-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-chai_latte', '00000000-0000-0000-0000-000000000001', 'Chai latte', 'chai_latte', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/chai_latte.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'chai_latte');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-chai_latte', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-chai_latte' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-chapata', '00000000-0000-0000-0000-000000000001', 'Chapata', 'chapata', '', 'physical', 150, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/chapata.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'chapata');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-chapata', 'cat-restaurant-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-chapata' AND category_id = 'cat-restaurant-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-cheesecake', '00000000-0000-0000-0000-000000000001', 'Cheesecake', 'cheesecake', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/cheesecake.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cheesecake');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-cheesecake', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-cheesecake' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-chupito_jager', '00000000-0000-0000-0000-000000000001', 'Chupito jager', 'chupito_jager', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/chupito_jager.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'chupito_jager');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-chupito_jager', 'cat-restaurant-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-chupito_jager' AND category_id = 'cat-restaurant-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-chupito_sambuca', '00000000-0000-0000-0000-000000000001', 'Chupito sambuca', 'chupito_sambuca', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/chupito_sambuca.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'chupito_sambuca');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-chupito_sambuca', 'cat-restaurant-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-chupito_sambuca' AND category_id = 'cat-restaurant-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-chupito_tequila', '00000000-0000-0000-0000-000000000001', 'Chupito tequila', 'chupito_tequila', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/chupito_tequila.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'chupito_tequila');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-chupito_tequila', 'cat-restaurant-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-chupito_tequila' AND category_id = 'cat-restaurant-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-churros', '00000000-0000-0000-0000-000000000001', 'Churros', 'churros', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/churros.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'churros');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-churros', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-churros' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-clara', '00000000-0000-0000-0000-000000000001', 'Clara', 'clara', '', 'physical', 250, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/clara.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'clara');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-clara', 'cat-restaurant-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-clara' AND category_id = 'cat-restaurant-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-coca_cola', '00000000-0000-0000-0000-000000000001', 'Coca cola', 'coca_cola', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/coca_cola.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'coca_cola');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-coca_cola', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-coca_cola' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-coca_cola_zero', '00000000-0000-0000-0000-000000000001', 'Coca cola zero', 'coca_cola_zero', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/coca_cola_zero.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'coca_cola_zero');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-coca_cola_zero', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-coca_cola_zero' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-cookie', '00000000-0000-0000-0000-000000000001', 'Cookie', 'cookie', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/cookie.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cookie');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-cookie', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-cookie' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-copa_albarino', '00000000-0000-0000-0000-000000000001', 'Copa albariño', 'copa_albarino', '', 'physical', 320, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/copa_albarino.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'copa_albarino');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-copa_albarino', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-copa_albarino' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-copa_cava', '00000000-0000-0000-0000-000000000001', 'Copa cava', 'copa_cava', '', 'physical', 320, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/copa_cava.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'copa_cava');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-copa_cava', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-copa_cava' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-copa_helado', '00000000-0000-0000-0000-000000000001', 'Copa helado', 'copa_helado', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/copa_helado.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'copa_helado');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-copa_helado', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-copa_helado' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-copa_ribera_duero', '00000000-0000-0000-0000-000000000001', 'Copa ribera duero', 'copa_ribera_duero', '', 'physical', 320, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/copa_ribera_duero.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'copa_ribera_duero');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-copa_ribera_duero', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-copa_ribera_duero' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-copa_rioja_crianza', '00000000-0000-0000-0000-000000000001', 'Copa rioja crianza', 'copa_rioja_crianza', '', 'physical', 320, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/copa_rioja_crianza.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'copa_rioja_crianza');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-copa_rioja_crianza', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-copa_rioja_crianza' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-copa_verdejo', '00000000-0000-0000-0000-000000000001', 'Copa verdejo', 'copa_verdejo', '', 'physical', 320, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/copa_verdejo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'copa_verdejo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-copa_verdejo', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-copa_verdejo' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-crema_catalana', '00000000-0000-0000-0000-000000000001', 'Crema catalana', 'crema_catalana', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/crema_catalana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'crema_catalana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-crema_catalana', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-crema_catalana' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-crepe_nutella', '00000000-0000-0000-0000-000000000001', 'Crepe Nutella', 'crepe_nutella', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/crepe_nutella.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'crepe_nutella');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-crepe_nutella', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-crepe_nutella' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-croissant', '00000000-0000-0000-0000-000000000001', 'Croissant', 'croissant', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/croissant.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'croissant');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-croissant', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-croissant' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-croissant_chocolate', '00000000-0000-0000-0000-000000000001', 'Croissant chocolate', 'croissant_chocolate', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/croissant_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'croissant_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-croissant_chocolate', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-croissant_chocolate' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-croquetas_jamon', '00000000-0000-0000-0000-000000000001', 'Croquetas jamón', 'croquetas_jamon', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/croquetas_jamon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'croquetas_jamon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-croquetas_jamon', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-croquetas_jamon' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-cuba_libre', '00000000-0000-0000-0000-000000000001', 'Cuba libre', 'cuba_libre', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/cuba_libre.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cuba_libre');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-cuba_libre', 'cat-restaurant-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-cuba_libre' AND category_id = 'cat-restaurant-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-cubata_ron', '00000000-0000-0000-0000-000000000001', 'Cubata ron', 'cubata_ron', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/cubata_ron.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cubata_ron');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-cubata_ron', 'cat-restaurant-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-cubata_ron' AND category_id = 'cat-restaurant-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-cubata_vodka', '00000000-0000-0000-0000-000000000001', 'Cubata vodka', 'cubata_vodka', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/cubata_vodka.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'cubata_vodka');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-cubata_vodka', 'cat-restaurant-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-cubata_vodka' AND category_id = 'cat-restaurant-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-culin_sidra', '00000000-0000-0000-0000-000000000001', 'Culín sidra', 'culin_sidra', '', 'physical', 320, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/culin_sidra.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'culin_sidra');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-culin_sidra', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-culin_sidra' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-desayuno_buffet', '00000000-0000-0000-0000-000000000001', 'Desayuno buffet', 'desayuno_buffet', '', 'physical', 1400, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/desayuno_buffet.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'desayuno_buffet');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-desayuno_buffet', 'cat-restaurant-menus'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-desayuno_buffet' AND category_id = 'cat-restaurant-menus');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-desayuno_continental', '00000000-0000-0000-0000-000000000001', 'Desayuno continental', 'desayuno_continental', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/desayuno_continental.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'desayuno_continental');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-desayuno_continental', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-desayuno_continental' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-descafeinado', '00000000-0000-0000-0000-000000000001', 'Descafeinado', 'descafeinado', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/descafeinado.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'descafeinado');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-descafeinado', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-descafeinado' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-doble_espresso', '00000000-0000-0000-0000-000000000001', 'Doble espresso', 'doble_espresso', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/doble_espresso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'doble_espresso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-doble_espresso', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-doble_espresso' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-dragon_roll', '00000000-0000-0000-0000-000000000001', 'Dragon roll', 'dragon_roll', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/dragon_roll.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'dragon_roll');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-dragon_roll', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-dragon_roll' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-durum_mixto', '00000000-0000-0000-0000-000000000001', 'Durum mixto', 'durum_mixto', '', 'physical', 700, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/durum_mixto.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'durum_mixto');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-durum_mixto', 'cat-restaurant-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-durum_mixto' AND category_id = 'cat-restaurant-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-durum_pollo', '00000000-0000-0000-0000-000000000001', 'Durum pollo', 'durum_pollo', '', 'physical', 700, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/durum_pollo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'durum_pollo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-durum_pollo', 'cat-restaurant-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-durum_pollo' AND category_id = 'cat-restaurant-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-durum_ternera', '00000000-0000-0000-0000-000000000001', 'Durum ternera', 'durum_ternera', '', 'physical', 700, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/durum_ternera.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'durum_ternera');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-durum_ternera', 'cat-restaurant-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-durum_ternera' AND category_id = 'cat-restaurant-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-edamame', '00000000-0000-0000-0000-000000000001', 'Edamame', 'edamame', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/edamame.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'edamame');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-edamame', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-edamame' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-ensaimada', '00000000-0000-0000-0000-000000000001', 'Ensaimada', 'ensaimada', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/ensaimada.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ensaimada');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-ensaimada', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-ensaimada' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-ensalada_acomp', '00000000-0000-0000-0000-000000000001', 'Ensalada acomp', 'ensalada_acomp', '', 'physical', 750, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/ensalada_acomp.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ensalada_acomp');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-ensalada_acomp', 'cat-restaurant-ensaladas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-ensalada_acomp' AND category_id = 'cat-restaurant-ensaladas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-ensalada_caprese', '00000000-0000-0000-0000-000000000001', 'Ensalada caprese', 'ensalada_caprese', '', 'physical', 750, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/ensalada_caprese.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ensalada_caprese');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-ensalada_caprese', 'cat-restaurant-ensaladas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-ensalada_caprese' AND category_id = 'cat-restaurant-ensaladas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-ensalada_cesar', '00000000-0000-0000-0000-000000000001', 'Ensalada césar', 'ensalada_cesar', '', 'physical', 750, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/ensalada_cesar.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ensalada_cesar');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-ensalada_cesar', 'cat-restaurant-ensaladas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-ensalada_cesar' AND category_id = 'cat-restaurant-ensaladas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-ensalada_mixta', '00000000-0000-0000-0000-000000000001', 'Ensalada mixta', 'ensalada_mixta', '', 'physical', 750, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/ensalada_mixta.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ensalada_mixta');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-ensalada_mixta', 'cat-restaurant-ensaladas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-ensalada_mixta' AND category_id = 'cat-restaurant-ensaladas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-ensalada_turca', '00000000-0000-0000-0000-000000000001', 'Ensalada turca', 'ensalada_turca', '', 'physical', 750, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/ensalada_turca.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ensalada_turca');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-ensalada_turca', 'cat-restaurant-ensaladas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-ensalada_turca' AND category_id = 'cat-restaurant-ensaladas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-ensalada_wakame', '00000000-0000-0000-0000-000000000001', 'Ensalada wakame', 'ensalada_wakame', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/ensalada_wakame.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ensalada_wakame');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-ensalada_wakame', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-ensalada_wakame' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-entrecot', '00000000-0000-0000-0000-000000000001', 'Entrecot', 'entrecot', '', 'physical', 1800, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/entrecot.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'entrecot');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-entrecot', 'cat-restaurant-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-entrecot' AND category_id = 'cat-restaurant-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-espeto_sardinas', '00000000-0000-0000-0000-000000000001', 'Espeto sardinas', 'espeto_sardinas', '', 'physical', 900, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/espeto_sardinas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'espeto_sardinas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-espeto_sardinas', 'cat-restaurant-pescados'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-espeto_sardinas' AND category_id = 'cat-restaurant-pescados');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-espresso', '00000000-0000-0000-0000-000000000001', 'Espresso', 'espresso', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/espresso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'espresso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-espresso', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-espresso' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-fanta_limon', '00000000-0000-0000-0000-000000000001', 'Fanta limón', 'fanta_limon', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/fanta_limon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'fanta_limon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-fanta_limon', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-fanta_limon' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-fanta_naranja', '00000000-0000-0000-0000-000000000001', 'Fanta naranja', 'fanta_naranja', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/fanta_naranja.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'fanta_naranja');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-fanta_naranja', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-fanta_naranja' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-fideua', '00000000-0000-0000-0000-000000000001', 'Fideuá', 'fideua', '', 'physical', 1100, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/fideua.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'fideua');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-fideua', 'cat-restaurant-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-fideua' AND category_id = 'cat-restaurant-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-flan_casero', '00000000-0000-0000-0000-000000000001', 'Flan casero', 'flan_casero', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/flan_casero.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'flan_casero');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-flan_casero', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-flan_casero' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-flat_white', '00000000-0000-0000-0000-000000000001', 'Flat white', 'flat_white', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/flat_white.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'flat_white');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-flat_white', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-flat_white' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-focaccia', '00000000-0000-0000-0000-000000000001', 'Focaccia', 'focaccia', '', 'physical', 150, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/focaccia.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'focaccia');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-focaccia', 'cat-restaurant-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-focaccia' AND category_id = 'cat-restaurant-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-frappuccino', '00000000-0000-0000-0000-000000000001', 'Frappuccino', 'frappuccino', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/frappuccino.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'frappuccino');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-frappuccino', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-frappuccino' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-galleta_chocolate', '00000000-0000-0000-0000-000000000001', 'Galleta chocolate', 'galleta_chocolate', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/galleta_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'galleta_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-galleta_chocolate', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-galleta_chocolate' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-galleta_mantequilla', '00000000-0000-0000-0000-000000000001', 'Galleta mantequilla', 'galleta_mantequilla', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/galleta_mantequilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'galleta_mantequilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-galleta_mantequilla', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-galleta_mantequilla' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-gambas_ajillo', '00000000-0000-0000-0000-000000000001', 'Gambas ajillo', 'gambas_ajillo', '', 'physical', 1100, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/gambas_ajillo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'gambas_ajillo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-gambas_ajillo', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-gambas_ajillo' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-gambas_plancha', '00000000-0000-0000-0000-000000000001', 'Gambas plancha', 'gambas_plancha', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/gambas_plancha.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'gambas_plancha');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-gambas_plancha', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-gambas_plancha' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-gazpacho', '00000000-0000-0000-0000-000000000001', 'Gazpacho', 'gazpacho', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/gazpacho.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'gazpacho');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-gazpacho', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-gazpacho' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-gin_tonic', '00000000-0000-0000-0000-000000000001', 'Gin tonic', 'gin_tonic', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/gin_tonic.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'gin_tonic');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-gin_tonic', 'cat-restaurant-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-gin_tonic' AND category_id = 'cat-restaurant-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-gofre_clasico', '00000000-0000-0000-0000-000000000001', 'Gofre clásico', 'gofre_clasico', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/gofre_clasico.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'gofre_clasico');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-gofre_clasico', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-gofre_clasico' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-granizado_cafe', '00000000-0000-0000-0000-000000000001', 'Granizado café', 'granizado_cafe', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/granizado_cafe.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'granizado_cafe');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-granizado_cafe', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-granizado_cafe' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-granizado_limon', '00000000-0000-0000-0000-000000000001', 'Granizado limón', 'granizado_limon', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/granizado_limon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'granizado_limon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-granizado_limon', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-granizado_limon' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-gyozas', '00000000-0000-0000-0000-000000000001', 'Gyozas', 'gyozas', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/gyozas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'gyozas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-gyozas', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-gyozas' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-hamburguesa_clasica', '00000000-0000-0000-0000-000000000001', 'Hamburguesa clásica', 'hamburguesa_clasica', '', 'physical', 1350, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/hamburguesa_clasica.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hamburguesa_clasica');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-hamburguesa_clasica', 'cat-restaurant-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-hamburguesa_clasica' AND category_id = 'cat-restaurant-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-hamburguesa_doble', '00000000-0000-0000-0000-000000000001', 'Hamburguesa doble', 'hamburguesa_doble', '', 'physical', 1150, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/hamburguesa_doble.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hamburguesa_doble');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-hamburguesa_doble', 'cat-restaurant-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-hamburguesa_doble' AND category_id = 'cat-restaurant-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-hamburguesa_gourmet', '00000000-0000-0000-0000-000000000001', 'Hamburguesa gourmet', 'hamburguesa_gourmet', '', 'physical', 1350, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/hamburguesa_gourmet.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hamburguesa_gourmet');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-hamburguesa_gourmet', 'cat-restaurant-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-hamburguesa_gourmet' AND category_id = 'cat-restaurant-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-hamburguesa_pollo', '00000000-0000-0000-0000-000000000001', 'Hamburguesa pollo', 'hamburguesa_pollo', '', 'physical', 1350, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/hamburguesa_pollo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hamburguesa_pollo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-hamburguesa_pollo', 'cat-restaurant-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-hamburguesa_pollo' AND category_id = 'cat-restaurant-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-hamburguesa_queso', '00000000-0000-0000-0000-000000000001', 'Hamburguesa queso', 'hamburguesa_queso', '', 'physical', 1350, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/hamburguesa_queso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hamburguesa_queso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-hamburguesa_queso', 'cat-restaurant-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-hamburguesa_queso' AND category_id = 'cat-restaurant-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-hamburguesa_smash', '00000000-0000-0000-0000-000000000001', 'Hamburguesa smash', 'hamburguesa_smash', '', 'physical', 1350, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/hamburguesa_smash.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hamburguesa_smash');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-hamburguesa_smash', 'cat-restaurant-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-hamburguesa_smash' AND category_id = 'cat-restaurant-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-helado_1_bola', '00000000-0000-0000-0000-000000000001', 'Helado 1 bola', 'helado_1_bola', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/helado_1_bola.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'helado_1_bola');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-helado_1_bola', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-helado_1_bola' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-helado_2_bolas', '00000000-0000-0000-0000-000000000001', 'Helado 2 bolas', 'helado_2_bolas', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/helado_2_bolas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'helado_2_bolas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-helado_2_bolas', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-helado_2_bolas' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-helado_3_bolas', '00000000-0000-0000-0000-000000000001', 'Helado 3 bolas', 'helado_3_bolas', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/helado_3_bolas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'helado_3_bolas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-helado_3_bolas', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-helado_3_bolas' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-helado_bola', '00000000-0000-0000-0000-000000000001', 'Helado bola', 'helado_bola', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/helado_bola.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'helado_bola');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-helado_bola', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-helado_bola' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-helado_soft', '00000000-0000-0000-0000-000000000001', 'Helado soft', 'helado_soft', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/helado_soft.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'helado_soft');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-helado_soft', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-helado_soft' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-hielo', '00000000-0000-0000-0000-000000000001', 'Hielo', 'hielo', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/hielo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hielo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-hielo', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-hielo' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-hogaza', '00000000-0000-0000-0000-000000000001', 'Hogaza', 'hogaza', '', 'physical', 150, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/hogaza.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hogaza');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-hogaza', 'cat-restaurant-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-hogaza' AND category_id = 'cat-restaurant-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-hummus', '00000000-0000-0000-0000-000000000001', 'Hummus', 'hummus', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/hummus.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'hummus');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-hummus', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-hummus' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-ipa_artesana', '00000000-0000-0000-0000-000000000001', 'IPA artesana', 'ipa_artesana', '', 'physical', 250, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/ipa_artesana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ipa_artesana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-ipa_artesana', 'cat-restaurant-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-ipa_artesana' AND category_id = 'cat-restaurant-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-jamon_iberico', '00000000-0000-0000-0000-000000000001', 'Jamón ibérico', 'jamon_iberico', '', 'physical', 1800, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/jamon_iberico.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'jamon_iberico');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-jamon_iberico', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-jamon_iberico' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-kebab_falafel', '00000000-0000-0000-0000-000000000001', 'Kebab falafel', 'kebab_falafel', '', 'physical', 700, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/kebab_falafel.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'kebab_falafel');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-kebab_falafel', 'cat-restaurant-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-kebab_falafel' AND category_id = 'cat-restaurant-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-kebab_mixto', '00000000-0000-0000-0000-000000000001', 'Kebab mixto', 'kebab_mixto', '', 'physical', 700, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/kebab_mixto.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'kebab_mixto');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-kebab_mixto', 'cat-restaurant-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-kebab_mixto' AND category_id = 'cat-restaurant-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-kebab_pollo', '00000000-0000-0000-0000-000000000001', 'Kebab pollo', 'kebab_pollo', '', 'physical', 700, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/kebab_pollo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'kebab_pollo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-kebab_pollo', 'cat-restaurant-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-kebab_pollo' AND category_id = 'cat-restaurant-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-kebab_ternera', '00000000-0000-0000-0000-000000000001', 'Kebab ternera', 'kebab_ternera', '', 'physical', 700, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/kebab_ternera.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'kebab_ternera');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-kebab_ternera', 'cat-restaurant-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-kebab_ternera' AND category_id = 'cat-restaurant-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-lahmacun', '00000000-0000-0000-0000-000000000001', 'Lahmacún', 'lahmacun', '', 'physical', 700, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/lahmacun.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'lahmacun');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-lahmacun', 'cat-restaurant-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-lahmacun' AND category_id = 'cat-restaurant-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-lasana', '00000000-0000-0000-0000-000000000001', 'Lasaña', 'lasana', '', 'physical', 1100, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/lasana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'lasana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-lasana', 'cat-restaurant-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-lasana' AND category_id = 'cat-restaurant-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-latte', '00000000-0000-0000-0000-000000000001', 'Latte', 'latte', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/latte.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'latte');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-latte', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-latte' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-latte_caramelo', '00000000-0000-0000-0000-000000000001', 'Latte caramelo', 'latte_caramelo', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/latte_caramelo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'latte_caramelo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-latte_caramelo', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-latte_caramelo' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-latte_vainilla', '00000000-0000-0000-0000-000000000001', 'Latte vainilla', 'latte_vainilla', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/latte_vainilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'latte_vainilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-latte_vainilla', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-latte_vainilla' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-limonada', '00000000-0000-0000-0000-000000000001', 'Limonada', 'limonada', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/limonada.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'limonada');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-limonada', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-limonada' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-limonada_yuzu', '00000000-0000-0000-0000-000000000001', 'Limonada yuzu', 'limonada_yuzu', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/limonada_yuzu.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'limonada_yuzu');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-limonada_yuzu', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-limonada_yuzu' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-lubina_horno', '00000000-0000-0000-0000-000000000001', 'Lubina horno', 'lubina_horno', '', 'physical', 1600, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/lubina_horno.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'lubina_horno');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-lubina_horno', 'cat-restaurant-pescados'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-lubina_horno' AND category_id = 'cat-restaurant-pescados');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-magdalena', '00000000-0000-0000-0000-000000000001', 'Magdalena', 'magdalena', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/magdalena.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'magdalena');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-magdalena', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-magdalena' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-maki_atun', '00000000-0000-0000-0000-000000000001', 'Maki atún', 'maki_atun', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/maki_atun.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'maki_atun');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-maki_atun', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-maki_atun' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-maki_salmon', '00000000-0000-0000-0000-000000000001', 'Maki salmón', 'maki_salmon', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/maki_salmon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'maki_salmon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-maki_salmon', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-maki_salmon' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-manzanilla', '00000000-0000-0000-0000-000000000001', 'Manzanilla', 'manzanilla', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/manzanilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'manzanilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-manzanilla', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-manzanilla' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-matcha_latte', '00000000-0000-0000-0000-000000000001', 'Matcha latte', 'matcha_latte', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/matcha_latte.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'matcha_latte');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-matcha_latte', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-matcha_latte' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-menu_dia', '00000000-0000-0000-0000-000000000001', 'Menú dia', 'menu_dia', '', 'physical', 1350, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/menu_dia.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'menu_dia');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-menu_dia', 'cat-restaurant-menus'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-menu_dia' AND category_id = 'cat-restaurant-menus');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-menu_hamburguesa', '00000000-0000-0000-0000-000000000001', 'Menú hamburguesa', 'menu_hamburguesa', '', 'physical', 1200, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/menu_hamburguesa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'menu_hamburguesa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-menu_hamburguesa', 'cat-restaurant-menus'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-menu_hamburguesa' AND category_id = 'cat-restaurant-menus');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-menu_infantil', '00000000-0000-0000-0000-000000000001', 'Menú infantil', 'menu_infantil', '', 'physical', 850, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/menu_infantil.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'menu_infantil');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-menu_infantil', 'cat-restaurant-menus'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-menu_infantil' AND category_id = 'cat-restaurant-menus');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-menu_kebab', '00000000-0000-0000-0000-000000000001', 'Menú kebab', 'menu_kebab', '', 'physical', 1200, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/menu_kebab.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'menu_kebab');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-menu_kebab', 'cat-restaurant-menus'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-menu_kebab' AND category_id = 'cat-restaurant-menus');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-merluza_plancha', '00000000-0000-0000-0000-000000000001', 'Merluza plancha', 'merluza_plancha', '', 'physical', 1400, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/merluza_plancha.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'merluza_plancha');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-merluza_plancha', 'cat-restaurant-pescados'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-merluza_plancha' AND category_id = 'cat-restaurant-pescados');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-mesa_dulce', '00000000-0000-0000-0000-000000000001', 'Mesa dulce', 'mesa_dulce', '', 'physical', 1200, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/mesa_dulce.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'mesa_dulce');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-mesa_dulce', 'cat-restaurant-menus'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-mesa_dulce' AND category_id = 'cat-restaurant-menus');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-mocha', '00000000-0000-0000-0000-000000000001', 'Mocha', 'mocha', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/mocha.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'mocha');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-mocha', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-mocha' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-mochi_helado', '00000000-0000-0000-0000-000000000001', 'Mochi helado', 'mochi_helado', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/mochi_helado.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'mochi_helado');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-mochi_helado', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-mochi_helado' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-mojito', '00000000-0000-0000-0000-000000000001', 'Mojito', 'mojito', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/mojito.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'mojito');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-mojito', 'cat-restaurant-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-mojito' AND category_id = 'cat-restaurant-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-muffin_arandanos', '00000000-0000-0000-0000-000000000001', 'Muffin arándanos', 'muffin_arandanos', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/muffin_arandanos.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'muffin_arandanos');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-muffin_arandanos', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-muffin_arandanos' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-muffin_chocolate', '00000000-0000-0000-0000-000000000001', 'Muffin chocolate', 'muffin_chocolate', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/muffin_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'muffin_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-muffin_chocolate', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-muffin_chocolate' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-nachos_queso', '00000000-0000-0000-0000-000000000001', 'Nachos queso', 'nachos_queso', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/nachos_queso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'nachos_queso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-nachos_queso', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-nachos_queso' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-napolitana_chocolate', '00000000-0000-0000-0000-000000000001', 'Napolitana chocolate', 'napolitana_chocolate', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/napolitana_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'napolitana_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-napolitana_chocolate', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-napolitana_chocolate' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-nigiri_anguila', '00000000-0000-0000-0000-000000000001', 'Nigiri anguila', 'nigiri_anguila', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/nigiri_anguila.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'nigiri_anguila');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-nigiri_anguila', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-nigiri_anguila' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-nigiri_atun', '00000000-0000-0000-0000-000000000001', 'Nigiri atún', 'nigiri_atun', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/nigiri_atun.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'nigiri_atun');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-nigiri_atun', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-nigiri_atun' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-nigiri_gamba', '00000000-0000-0000-0000-000000000001', 'Nigiri gamba', 'nigiri_gamba', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/nigiri_gamba.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'nigiri_gamba');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-nigiri_gamba', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-nigiri_gamba' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-nigiri_pulpo', '00000000-0000-0000-0000-000000000001', 'Nigiri pulpo', 'nigiri_pulpo', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/nigiri_pulpo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'nigiri_pulpo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-nigiri_pulpo', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-nigiri_pulpo' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-nigiri_salmon', '00000000-0000-0000-0000-000000000001', 'Nigiri salmón', 'nigiri_salmon', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/nigiri_salmon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'nigiri_salmon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-nigiri_salmon', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-nigiri_salmon' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-nuggets', '00000000-0000-0000-0000-000000000001', 'Nuggets', 'nuggets', '', 'physical', 1350, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/nuggets.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'nuggets');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-nuggets', 'cat-restaurant-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-nuggets' AND category_id = 'cat-restaurant-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pad_thai', '00000000-0000-0000-0000-000000000001', 'Pad thai', 'pad_thai', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pad_thai.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pad_thai');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pad_thai', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pad_thai' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-paella_marisco', '00000000-0000-0000-0000-000000000001', 'Paella marisco', 'paella_marisco', '', 'physical', 1600, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/paella_marisco.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'paella_marisco');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-paella_marisco', 'cat-restaurant-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-paella_marisco' AND category_id = 'cat-restaurant-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-paella_mixta', '00000000-0000-0000-0000-000000000001', 'Paella mixta', 'paella_mixta', '', 'physical', 1350, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/paella_mixta.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'paella_mixta');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-paella_mixta', 'cat-restaurant-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-paella_mixta' AND category_id = 'cat-restaurant-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-paella_valenciana', '00000000-0000-0000-0000-000000000001', 'Paella valenciana', 'paella_valenciana', '', 'physical', 1300, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/paella_valenciana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'paella_valenciana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-paella_valenciana', 'cat-restaurant-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-paella_valenciana' AND category_id = 'cat-restaurant-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pale_ale', '00000000-0000-0000-0000-000000000001', 'Pale ale', 'pale_ale', '', 'physical', 250, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/pale_ale.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pale_ale');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pale_ale', 'cat-restaurant-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pale_ale' AND category_id = 'cat-restaurant-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-palmera_chocolate', '00000000-0000-0000-0000-000000000001', 'Palmera chocolate', 'palmera_chocolate', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/palmera_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'palmera_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-palmera_chocolate', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-palmera_chocolate' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pan_ajo', '00000000-0000-0000-0000-000000000001', 'Pan ajo', 'pan_ajo', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pan_ajo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pan_ajo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pan_ajo', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pan_ajo' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pan_centeno', '00000000-0000-0000-0000-000000000001', 'Pan centeno', 'pan_centeno', '', 'physical', 150, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pan_centeno.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pan_centeno');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pan_centeno', 'cat-restaurant-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pan_centeno' AND category_id = 'cat-restaurant-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pan_integral', '00000000-0000-0000-0000-000000000001', 'Pan integral', 'pan_integral', '', 'physical', 150, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pan_integral.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pan_integral');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pan_integral', 'cat-restaurant-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pan_integral' AND category_id = 'cat-restaurant-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pan_pita', '00000000-0000-0000-0000-000000000001', 'Pan pita', 'pan_pita', '', 'physical', 150, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pan_pita.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pan_pita');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pan_pita', 'cat-restaurant-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pan_pita' AND category_id = 'cat-restaurant-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pan_semillas', '00000000-0000-0000-0000-000000000001', 'Pan semillas', 'pan_semillas', '', 'physical', 150, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pan_semillas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pan_semillas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pan_semillas', 'cat-restaurant-panes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pan_semillas' AND category_id = 'cat-restaurant-panes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-panna_cotta', '00000000-0000-0000-0000-000000000001', 'Panna cotta', 'panna_cotta', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/panna_cotta.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'panna_cotta');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-panna_cotta', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-panna_cotta' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pasta_bolonesa', '00000000-0000-0000-0000-000000000001', 'Pasta bolonesa', 'pasta_bolonesa', '', 'physical', 1100, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pasta_bolonesa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pasta_bolonesa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pasta_bolonesa', 'cat-restaurant-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pasta_bolonesa' AND category_id = 'cat-restaurant-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pasta_carbonara', '00000000-0000-0000-0000-000000000001', 'Pasta carbonara', 'pasta_carbonara', '', 'physical', 1100, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pasta_carbonara.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pasta_carbonara');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pasta_carbonara', 'cat-restaurant-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pasta_carbonara' AND category_id = 'cat-restaurant-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pasta_pesto', '00000000-0000-0000-0000-000000000001', 'Pasta pesto', 'pasta_pesto', '', 'physical', 1100, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pasta_pesto.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pasta_pesto');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pasta_pesto', 'cat-restaurant-arroces'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pasta_pesto' AND category_id = 'cat-restaurant-arroces');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-patatas_bravas', '00000000-0000-0000-0000-000000000001', 'Patatas bravas', 'patatas_bravas', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/patatas_bravas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'patatas_bravas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-patatas_bravas', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-patatas_bravas' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-patatas_fritas', '00000000-0000-0000-0000-000000000001', 'Patatas fritas', 'patatas_fritas', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/patatas_fritas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'patatas_fritas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-patatas_fritas', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-patatas_fritas' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-perrito_clasico', '00000000-0000-0000-0000-000000000001', 'Perrito clásico', 'perrito_clasico', '', 'physical', 1350, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/perrito_clasico.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'perrito_clasico');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-perrito_clasico', 'cat-restaurant-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-perrito_clasico' AND category_id = 'cat-restaurant-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pescaito_frito', '00000000-0000-0000-0000-000000000001', 'Pescaito frito', 'pescaito_frito', '', 'physical', 1400, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pescaito_frito.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pescaito_frito');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pescaito_frito', 'cat-restaurant-pescados'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pescaito_frito' AND category_id = 'cat-restaurant-pescados');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pincho_tortilla', '00000000-0000-0000-0000-000000000001', 'Pincho tortilla', 'pincho_tortilla', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pincho_tortilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pincho_tortilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pincho_tortilla', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pincho_tortilla' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pizza_4_quesos', '00000000-0000-0000-0000-000000000001', 'Pizza 4 quesos', 'pizza_4_quesos', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pizza_4_quesos.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_4_quesos');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pizza_4_quesos', 'cat-restaurant-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pizza_4_quesos' AND category_id = 'cat-restaurant-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pizza_barbacoa', '00000000-0000-0000-0000-000000000001', 'Pizza barbacoa', 'pizza_barbacoa', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pizza_barbacoa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_barbacoa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pizza_barbacoa', 'cat-restaurant-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pizza_barbacoa' AND category_id = 'cat-restaurant-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pizza_calzone', '00000000-0000-0000-0000-000000000001', 'Pizza calzone', 'pizza_calzone', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pizza_calzone.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_calzone');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pizza_calzone', 'cat-restaurant-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pizza_calzone' AND category_id = 'cat-restaurant-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pizza_caprichosa', '00000000-0000-0000-0000-000000000001', 'Pizza caprichosa', 'pizza_caprichosa', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pizza_caprichosa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_caprichosa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pizza_caprichosa', 'cat-restaurant-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pizza_caprichosa' AND category_id = 'cat-restaurant-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pizza_carbonara', '00000000-0000-0000-0000-000000000001', 'Pizza carbonara', 'pizza_carbonara', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pizza_carbonara.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_carbonara');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pizza_carbonara', 'cat-restaurant-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pizza_carbonara' AND category_id = 'cat-restaurant-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pizza_diavola', '00000000-0000-0000-0000-000000000001', 'Pizza diavola', 'pizza_diavola', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pizza_diavola.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_diavola');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pizza_diavola', 'cat-restaurant-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pizza_diavola' AND category_id = 'cat-restaurant-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pizza_familiar', '00000000-0000-0000-0000-000000000001', 'Pizza familiar', 'pizza_familiar', '', 'physical', 1400, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pizza_familiar.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_familiar');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pizza_familiar', 'cat-restaurant-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pizza_familiar' AND category_id = 'cat-restaurant-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pizza_hawaiana', '00000000-0000-0000-0000-000000000001', 'Pizza hawaiana', 'pizza_hawaiana', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pizza_hawaiana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_hawaiana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pizza_hawaiana', 'cat-restaurant-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pizza_hawaiana' AND category_id = 'cat-restaurant-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pizza_jamon_queso', '00000000-0000-0000-0000-000000000001', 'Pizza jamón queso', 'pizza_jamon_queso', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pizza_jamon_queso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_jamon_queso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pizza_jamon_queso', 'cat-restaurant-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pizza_jamon_queso' AND category_id = 'cat-restaurant-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pizza_margarita', '00000000-0000-0000-0000-000000000001', 'Pizza margarita', 'pizza_margarita', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pizza_margarita.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_margarita');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pizza_margarita', 'cat-restaurant-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pizza_margarita' AND category_id = 'cat-restaurant-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pizza_pepperoni', '00000000-0000-0000-0000-000000000001', 'Pizza pepperoni', 'pizza_pepperoni', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pizza_pepperoni.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_pepperoni');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pizza_pepperoni', 'cat-restaurant-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pizza_pepperoni' AND category_id = 'cat-restaurant-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pizza_vegetal', '00000000-0000-0000-0000-000000000001', 'Pizza vegetal', 'pizza_vegetal', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pizza_vegetal.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pizza_vegetal');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pizza_vegetal', 'cat-restaurant-pizzas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pizza_vegetal' AND category_id = 'cat-restaurant-pizzas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-plato_falafel', '00000000-0000-0000-0000-000000000001', 'Plato falafel', 'plato_falafel', '', 'physical', 700, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/plato_falafel.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'plato_falafel');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-plato_falafel', 'cat-restaurant-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-plato_falafel' AND category_id = 'cat-restaurant-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-plato_kebab', '00000000-0000-0000-0000-000000000001', 'Plato kebab', 'plato_kebab', '', 'physical', 700, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/plato_kebab.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'plato_kebab');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-plato_kebab', 'cat-restaurant-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-plato_kebab' AND category_id = 'cat-restaurant-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-poke_atun', '00000000-0000-0000-0000-000000000001', 'Poke atún', 'poke_atun', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/poke_atun.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'poke_atun');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-poke_atun', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-poke_atun' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-poke_salmon', '00000000-0000-0000-0000-000000000001', 'Poke salmón', 'poke_salmon', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/poke_salmon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'poke_salmon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-poke_salmon', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-poke_salmon' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-poleo_menta', '00000000-0000-0000-0000-000000000001', 'Poleo menta', 'poleo_menta', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/poleo_menta.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'poleo_menta');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-poleo_menta', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-poleo_menta' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pollo_asado', '00000000-0000-0000-0000-000000000001', 'Pollo asado', 'pollo_asado', '', 'physical', 1350, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pollo_asado.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pollo_asado');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pollo_asado', 'cat-restaurant-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pollo_asado' AND category_id = 'cat-restaurant-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pollo_teriyaki', '00000000-0000-0000-0000-000000000001', 'Pollo teriyaki', 'pollo_teriyaki', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pollo_teriyaki.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pollo_teriyaki');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pollo_teriyaki', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pollo_teriyaki' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-pulpo_gallega', '00000000-0000-0000-0000-000000000001', 'Pulpo gallega', 'pulpo_gallega', '', 'physical', 1600, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/pulpo_gallega.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'pulpo_gallega');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-pulpo_gallega', 'cat-restaurant-pescados'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-pulpo_gallega' AND category_id = 'cat-restaurant-pescados');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-racion_cachopo', '00000000-0000-0000-0000-000000000001', 'Ración cachopo', 'racion_cachopo', '', 'physical', 1600, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/racion_cachopo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'racion_cachopo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-racion_cachopo', 'cat-restaurant-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-racion_cachopo' AND category_id = 'cat-restaurant-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-racion_croquetas', '00000000-0000-0000-0000-000000000001', 'Ración croquetas', 'racion_croquetas', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/racion_croquetas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'racion_croquetas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-racion_croquetas', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-racion_croquetas' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-racion_gambas', '00000000-0000-0000-0000-000000000001', 'Ración gambas', 'racion_gambas', '', 'physical', 1200, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/racion_gambas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'racion_gambas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-racion_gambas', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-racion_gambas' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-racion_patatas_bravas', '00000000-0000-0000-0000-000000000001', 'Ración patatas bravas', 'racion_patatas_bravas', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/racion_patatas_bravas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'racion_patatas_bravas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-racion_patatas_bravas', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-racion_patatas_bravas' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-racion_rabas', '00000000-0000-0000-0000-000000000001', 'Ración rabas', 'racion_rabas', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/racion_rabas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'racion_rabas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-racion_rabas', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-racion_rabas' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-ramen_cerdo', '00000000-0000-0000-0000-000000000001', 'Ramen cerdo', 'ramen_cerdo', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/ramen_cerdo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ramen_cerdo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-ramen_cerdo', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-ramen_cerdo' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-ramen_pollo', '00000000-0000-0000-0000-000000000001', 'Ramen pollo', 'ramen_pollo', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/ramen_pollo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ramen_pollo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-ramen_pollo', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-ramen_pollo' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-ron_cola', '00000000-0000-0000-0000-000000000001', 'Ron cola', 'ron_cola', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/ron_cola.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'ron_cola');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-ron_cola', 'cat-restaurant-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-ron_cola' AND category_id = 'cat-restaurant-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-sake_copa', '00000000-0000-0000-0000-000000000001', 'Sake copa', 'sake_copa', '', 'physical', 320, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/sake_copa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sake_copa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-sake_copa', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-sake_copa' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-salmon_teriyaki', '00000000-0000-0000-0000-000000000001', 'Salmón teriyaki', 'salmon_teriyaki', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/salmon_teriyaki.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'salmon_teriyaki');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-salmon_teriyaki', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-salmon_teriyaki' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-salmorejo', '00000000-0000-0000-0000-000000000001', 'Salmorejo', 'salmorejo', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/salmorejo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'salmorejo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-salmorejo', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-salmorejo' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-salsa_extra', '00000000-0000-0000-0000-000000000001', 'Salsa extra', 'salsa_extra', '', 'physical', 120, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/salsa_extra.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'salsa_extra');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-salsa_extra', 'cat-restaurant-extras'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-salsa_extra' AND category_id = 'cat-restaurant-extras');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-salsa_yogur', '00000000-0000-0000-0000-000000000001', 'Salsa yogur', 'salsa_yogur', '', 'physical', 120, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/salsa_yogur.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'salsa_yogur');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-salsa_yogur', 'cat-restaurant-extras'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-salsa_yogur' AND category_id = 'cat-restaurant-extras');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-sandwich_mixto', '00000000-0000-0000-0000-000000000001', 'Sándwich mixto', 'sandwich_mixto', '', 'physical', 500, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/sandwich_mixto.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sandwich_mixto');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-sandwich_mixto', 'cat-restaurant-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-sandwich_mixto' AND category_id = 'cat-restaurant-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-sandwich_vegetal', '00000000-0000-0000-0000-000000000001', 'Sándwich vegetal', 'sandwich_vegetal', '', 'physical', 500, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/sandwich_vegetal.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sandwich_vegetal');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-sandwich_vegetal', 'cat-restaurant-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-sandwich_vegetal' AND category_id = 'cat-restaurant-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-sangria_jarra', '00000000-0000-0000-0000-000000000001', 'Sangría jarra', 'sangria_jarra', '', 'physical', 320, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/sangria_jarra.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sangria_jarra');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-sangria_jarra', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-sangria_jarra' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-sashimi_atun', '00000000-0000-0000-0000-000000000001', 'Sashimi atún', 'sashimi_atun', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/sashimi_atun.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sashimi_atun');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-sashimi_atun', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-sashimi_atun' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-sashimi_mixto', '00000000-0000-0000-0000-000000000001', 'Sashimi mixto', 'sashimi_mixto', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/sashimi_mixto.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sashimi_mixto');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-sashimi_mixto', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-sashimi_mixto' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-sashimi_salmon', '00000000-0000-0000-0000-000000000001', 'Sashimi salmón', 'sashimi_salmon', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/sashimi_salmon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sashimi_salmon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-sashimi_salmon', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-sashimi_salmon' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-secreto_iberico', '00000000-0000-0000-0000-000000000001', 'Secreto ibérico', 'secreto_iberico', '', 'physical', 1500, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/secreto_iberico.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'secreto_iberico');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-secreto_iberico', 'cat-restaurant-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-secreto_iberico' AND category_id = 'cat-restaurant-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-shawarma_plato', '00000000-0000-0000-0000-000000000001', 'Shawarma plato', 'shawarma_plato', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/shawarma_plato.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'shawarma_plato');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-shawarma_plato', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-shawarma_plato' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-sidra_botella', '00000000-0000-0000-0000-000000000001', 'Sidra botella', 'sidra_botella', '', 'physical', 320, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/sidra_botella.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sidra_botella');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-sidra_botella', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-sidra_botella' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-sidra_natural', '00000000-0000-0000-0000-000000000001', 'Sidra natural', 'sidra_natural', '', 'physical', 320, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/sidra_natural.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sidra_natural');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-sidra_natural', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-sidra_natural' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-smoothie_fresa', '00000000-0000-0000-0000-000000000001', 'Smoothie fresa', 'smoothie_fresa', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/smoothie_fresa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'smoothie_fresa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-smoothie_fresa', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-smoothie_fresa' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-smoothie_mango', '00000000-0000-0000-0000-000000000001', 'Smoothie mango', 'smoothie_mango', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/smoothie_mango.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'smoothie_mango');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-smoothie_mango', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-smoothie_mango' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-solomillo', '00000000-0000-0000-0000-000000000001', 'Solomillo', 'solomillo', '', 'physical', 1950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/solomillo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'solomillo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-solomillo', 'cat-restaurant-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-solomillo' AND category_id = 'cat-restaurant-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-sopa_miso', '00000000-0000-0000-0000-000000000001', 'Sopa miso', 'sopa_miso', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/sopa_miso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sopa_miso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-sopa_miso', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-sopa_miso' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-spicy_salmon_roll', '00000000-0000-0000-0000-000000000001', 'Spicy salmón roll', 'spicy_salmon_roll', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/spicy_salmon_roll.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'spicy_salmon_roll');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-spicy_salmon_roll', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-spicy_salmon_roll' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-spring_rolls', '00000000-0000-0000-0000-000000000001', 'Spring rolls', 'spring_rolls', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/spring_rolls.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'spring_rolls');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-spring_rolls', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-spring_rolls' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-sprite', '00000000-0000-0000-0000-000000000001', 'Sprite', 'sprite', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/sprite.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'sprite');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-sprite', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-sprite' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-stout', '00000000-0000-0000-0000-000000000001', 'Stout', 'stout', '', 'physical', 250, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/stout.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'stout');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-stout', 'cat-restaurant-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-stout' AND category_id = 'cat-restaurant-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tabla_embutidos', '00000000-0000-0000-0000-000000000001', 'Tabla embutidos', 'tabla_embutidos', '', 'physical', 1400, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tabla_embutidos.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tabla_embutidos');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tabla_embutidos', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tabla_embutidos' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tabla_iberica', '00000000-0000-0000-0000-000000000001', 'Tabla ibérica', 'tabla_iberica', '', 'physical', 1650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tabla_iberica.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tabla_iberica');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tabla_iberica', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tabla_iberica' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tabla_mixta', '00000000-0000-0000-0000-000000000001', 'Tabla mixta', 'tabla_mixta', '', 'physical', 1500, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tabla_mixta.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tabla_mixta');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tabla_mixta', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tabla_mixta' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tabla_quesos', '00000000-0000-0000-0000-000000000001', 'Tabla quesos', 'tabla_quesos', '', 'physical', 1300, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tabla_quesos.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tabla_quesos');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tabla_quesos', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tabla_quesos' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tacos', '00000000-0000-0000-0000-000000000001', 'Tacos', 'tacos', '', 'physical', 1350, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tacos.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tacos');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tacos', 'cat-restaurant-carnes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tacos' AND category_id = 'cat-restaurant-carnes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tapa_aceitunas', '00000000-0000-0000-0000-000000000001', 'Tapa aceitunas', 'tapa_aceitunas', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tapa_aceitunas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tapa_aceitunas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tapa_aceitunas', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tapa_aceitunas' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tapa_bravas', '00000000-0000-0000-0000-000000000001', 'Tapa bravas', 'tapa_bravas', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tapa_bravas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tapa_bravas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tapa_bravas', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tapa_bravas' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tapa_croquetas', '00000000-0000-0000-0000-000000000001', 'Tapa croquetas', 'tapa_croquetas', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tapa_croquetas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tapa_croquetas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tapa_croquetas', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tapa_croquetas' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tapa_jamon', '00000000-0000-0000-0000-000000000001', 'Tapa jamón', 'tapa_jamon', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tapa_jamon.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tapa_jamon');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tapa_jamon', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tapa_jamon' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tapa_queso', '00000000-0000-0000-0000-000000000001', 'Tapa queso', 'tapa_queso', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tapa_queso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tapa_queso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tapa_queso', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tapa_queso' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tapa_queso_manchego', '00000000-0000-0000-0000-000000000001', 'Tapa queso manchego', 'tapa_queso_manchego', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tapa_queso_manchego.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tapa_queso_manchego');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tapa_queso_manchego', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tapa_queso_manchego' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tapa_tortilla', '00000000-0000-0000-0000-000000000001', 'Tapa tortilla', 'tapa_tortilla', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tapa_tortilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tapa_tortilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tapa_tortilla', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tapa_tortilla' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tarrina_1l', '00000000-0000-0000-0000-000000000001', 'Tarrina 1l', 'tarrina_1l', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tarrina_1l.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tarrina_1l');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tarrina_1l', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tarrina_1l' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tarrina_500ml', '00000000-0000-0000-0000-000000000001', 'Tarrina 500ml', 'tarrina_500ml', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tarrina_500ml.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tarrina_500ml');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tarrina_500ml', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tarrina_500ml' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tarta_chocolate', '00000000-0000-0000-0000-000000000001', 'Tarta chocolate', 'tarta_chocolate', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tarta_chocolate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tarta_chocolate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tarta_chocolate', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tarta_chocolate' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tarta_manzana', '00000000-0000-0000-0000-000000000001', 'Tarta manzana', 'tarta_manzana', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tarta_manzana.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tarta_manzana');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tarta_manzana', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tarta_manzana' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tarta_matcha', '00000000-0000-0000-0000-000000000001', 'Tarta matcha', 'tarta_matcha', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/tarta_matcha.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tarta_matcha');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tarta_matcha', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tarta_matcha' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tarta_queso', '00000000-0000-0000-0000-000000000001', 'Tarta queso', 'tarta_queso', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tarta_queso.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tarta_queso');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tarta_queso', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tarta_queso' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tarta_zanahoria', '00000000-0000-0000-0000-000000000001', 'Tarta zanahoria', 'tarta_zanahoria', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tarta_zanahoria.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tarta_zanahoria');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tarta_zanahoria', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tarta_zanahoria' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-te_negro', '00000000-0000-0000-0000-000000000001', 'Té negro', 'te_negro', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/te_negro.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'te_negro');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-te_negro', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-te_negro' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-te_rojo', '00000000-0000-0000-0000-000000000001', 'Té rojo', 'te_rojo', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/te_rojo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'te_rojo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-te_rojo', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-te_rojo' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-te_turco', '00000000-0000-0000-0000-000000000001', 'Té turco', 'te_turco', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/te_turco.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'te_turco');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-te_turco', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-te_turco' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-te_verde', '00000000-0000-0000-0000-000000000001', 'Té verde', 'te_verde', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/te_verde.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'te_verde');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-te_verde', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-te_verde' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-te_verde_japones', '00000000-0000-0000-0000-000000000001', 'Té verde japonés', 'te_verde_japones', '', 'physical', 180, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/te_verde_japones.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'te_verde_japones');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-te_verde_japones', 'cat-restaurant-cafes'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-te_verde_japones' AND category_id = 'cat-restaurant-cafes');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tempura_gambas', '00000000-0000-0000-0000-000000000001', 'Tempura gambas', 'tempura_gambas', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tempura_gambas.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tempura_gambas');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tempura_gambas', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tempura_gambas' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tempura_helado', '00000000-0000-0000-0000-000000000001', 'Tempura helado', 'tempura_helado', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tempura_helado.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tempura_helado');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tempura_helado', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tempura_helado' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tempura_roll', '00000000-0000-0000-0000-000000000001', 'Tempura roll', 'tempura_roll', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tempura_roll.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tempura_roll');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tempura_roll', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tempura_roll' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tempura_verduras', '00000000-0000-0000-0000-000000000001', 'Tempura verduras', 'tempura_verduras', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tempura_verduras.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tempura_verduras');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tempura_verduras', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tempura_verduras' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tinto_verano', '00000000-0000-0000-0000-000000000001', 'Tinto verano', 'tinto_verano', '', 'physical', 320, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/tinto_verano.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tinto_verano');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tinto_verano', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tinto_verano' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tiramisu', '00000000-0000-0000-0000-000000000001', 'Tiramisú', 'tiramisu', '', 'physical', 450, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tiramisu.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tiramisu');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tiramisu', 'cat-restaurant-postres'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tiramisu' AND category_id = 'cat-restaurant-postres');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tonica', '00000000-0000-0000-0000-000000000001', 'Tónica', 'tonica', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/tonica.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tonica');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tonica', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tonica' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tortilla_espanola', '00000000-0000-0000-0000-000000000001', 'Tortilla española', 'tortilla_espanola', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tortilla_espanola.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tortilla_espanola');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tortilla_espanola', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tortilla_espanola' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tostada_aguacate', '00000000-0000-0000-0000-000000000001', 'Tostada aguacate', 'tostada_aguacate', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tostada_aguacate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tostada_aguacate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tostada_aguacate', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tostada_aguacate' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tostada_mantequilla', '00000000-0000-0000-0000-000000000001', 'Tostada mantequilla', 'tostada_mantequilla', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tostada_mantequilla.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tostada_mantequilla');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tostada_mantequilla', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tostada_mantequilla' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-tostada_tomate', '00000000-0000-0000-0000-000000000001', 'Tostada tomate', 'tostada_tomate', '', 'physical', 280, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/tostada_tomate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'tostada_tomate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-tostada_tomate', 'cat-restaurant-desayunos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-tostada_tomate' AND category_id = 'cat-restaurant-desayunos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-uramaki_aguacate', '00000000-0000-0000-0000-000000000001', 'Uramaki aguacate', 'uramaki_aguacate', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/uramaki_aguacate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'uramaki_aguacate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-uramaki_aguacate', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-uramaki_aguacate' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-vegetariano_roll', '00000000-0000-0000-0000-000000000001', 'Vegetariano roll', 'vegetariano_roll', '', 'physical', 950, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/vegetariano_roll.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'vegetariano_roll');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-vegetariano_roll', 'cat-restaurant-japones'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-vegetariano_roll' AND category_id = 'cat-restaurant-japones');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-verduras_plancha', '00000000-0000-0000-0000-000000000001', 'Verduras plancha', 'verduras_plancha', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/verduras_plancha.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'verduras_plancha');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-verduras_plancha', 'cat-restaurant-tapas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-verduras_plancha' AND category_id = 'cat-restaurant-tapas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-vermut', '00000000-0000-0000-0000-000000000001', 'Vermut', 'vermut', '', 'physical', 320, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/vermut.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'vermut');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-vermut', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-vermut' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-vino_blanco_copa', '00000000-0000-0000-0000-000000000001', 'Vino blanco copa', 'vino_blanco_copa', '', 'physical', 320, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/vino_blanco_copa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'vino_blanco_copa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-vino_blanco_copa', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-vino_blanco_copa' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-vino_rosado_copa', '00000000-0000-0000-0000-000000000001', 'Vino rosado copa', 'vino_rosado_copa', '', 'physical', 320, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/vino_rosado_copa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'vino_rosado_copa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-vino_rosado_copa', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-vino_rosado_copa' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-vino_tinto_copa', '00000000-0000-0000-0000-000000000001', 'Vino tinto copa', 'vino_tinto_copa', '', 'physical', 320, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/vino_tinto_copa.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'vino_tinto_copa');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-vino_tinto_copa', 'cat-restaurant-vinos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-vino_tinto_copa' AND category_id = 'cat-restaurant-vinos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-wheat_beer', '00000000-0000-0000-0000-000000000001', 'Wheat beer', 'wheat_beer', '', 'physical', 250, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/wheat_beer.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'wheat_beer');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-wheat_beer', 'cat-restaurant-cervezas'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-wheat_beer' AND category_id = 'cat-restaurant-cervezas');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-whisky_cola', '00000000-0000-0000-0000-000000000001', 'Whisky cola', 'whisky_cola', '', 'physical', 650, 0, 1000000000, 0, 'restaurant.alcohol', 'media:public/img/hospitality/whisky_cola.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'whisky_cola');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-whisky_cola', 'cat-restaurant-cocteles'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-whisky_cola' AND category_id = 'cat-restaurant-cocteles');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-wrap_falafel', '00000000-0000-0000-0000-000000000001', 'Wrap falafel', 'wrap_falafel', '', 'physical', 700, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/wrap_falafel.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'wrap_falafel');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-wrap_falafel', 'cat-restaurant-kebabs'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-wrap_falafel' AND category_id = 'cat-restaurant-kebabs');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-wrap_pollo', '00000000-0000-0000-0000-000000000001', 'Wrap pollo', 'wrap_pollo', '', 'physical', 500, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/wrap_pollo.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'wrap_pollo');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-wrap_pollo', 'cat-restaurant-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-wrap_pollo' AND category_id = 'cat-restaurant-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-wrap_vegetal', '00000000-0000-0000-0000-000000000001', 'Wrap vegetal', 'wrap_vegetal', '', 'physical', 500, 0, 1000000000, 0, 'restaurant.food', 'media:public/img/hospitality/wrap_vegetal.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'wrap_vegetal');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-wrap_vegetal', 'cat-restaurant-bocadillos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-wrap_vegetal' AND category_id = 'cat-restaurant-bocadillos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-zumo_naranja', '00000000-0000-0000-0000-000000000001', 'Zumo naranja', 'zumo_naranja', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/zumo_naranja.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'zumo_naranja');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-zumo_naranja', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-zumo_naranja' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-zumo_pina', '00000000-0000-0000-0000-000000000001', 'Zumo piña', 'zumo_pina', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/zumo_pina.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'zumo_pina');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-zumo_pina', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-zumo_pina' AND category_id = 'cat-restaurant-refrescos');
INSERT INTO inventory_product (id, hub_id, name, sku, description, product_type, price, cost, stock, low_stock_threshold, tax_category_key, image, created_at, updated_at)
SELECT 'prod-restaurant-zumo_tomate', '00000000-0000-0000-0000-000000000001', 'Zumo tomate', 'zumo_tomate', '', 'physical', 220, 0, 1000000000, 0, 'restaurant.drink', 'media:public/img/hospitality/zumo_tomate.webp', '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product WHERE hub_id = '00000000-0000-0000-0000-000000000001' AND sku = 'zumo_tomate');
INSERT INTO inventory_product_categories (product_id, category_id)
SELECT 'prod-restaurant-zumo_tomate', 'cat-restaurant-refrescos'
WHERE NOT EXISTS (SELECT 1 FROM inventory_product_categories WHERE product_id = 'prod-restaurant-zumo_tomate' AND category_id = 'cat-restaurant-refrescos');

-- Cajeros demo (login por PIN). rol='employee' (rol de operador YA existente en los 27 módulos:
-- vender, abrir/cerrar caja, facturar). PINs 1111/2222 NO rotan — los protege el device-trust.
INSERT INTO hub_user (id, name, pin_hash, role, cloud_user_id, is_active, created_at)
SELECT 'user-restaurant-cashier1', 'Cajero 1', 'cashier1-seed-salt:9d81582af594e1cc780151726e43aceb5da668e780bf455ca41b6bfc0a7074ca', 'employee', NULL, 1, '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM hub_user WHERE name = 'Cajero 1');
INSERT INTO staff_member (id, hub_id, first_name, last_name, user_id, status, is_bookable, created_at, updated_at)
SELECT 'staff-restaurant-cashier1', '00000000-0000-0000-0000-000000000001', 'Cajero', 'Uno', 'user-restaurant-cashier1', 'active', 0, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_member WHERE id = 'staff-restaurant-cashier1');
INSERT INTO hub_user (id, name, pin_hash, role, cloud_user_id, is_active, created_at)
SELECT 'user-restaurant-cashier2', 'Cajero 2', 'cashier2-seed-salt:fe8ab1c960ef7d0abbbd1c7598ed2036f7aabc2408571edfdaff16d6bc1bdb0f', 'employee', NULL, 1, '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM hub_user WHERE name = 'Cajero 2');
INSERT INTO staff_member (id, hub_id, first_name, last_name, user_id, status, is_bookable, created_at, updated_at)
SELECT 'staff-restaurant-cashier2', '00000000-0000-0000-0000-000000000001', 'Cajero', 'Dos', 'user-restaurant-cashier2', 'active', 0, '2026-01-01T00:00:00+00:00', '2026-01-01T00:00:00+00:00'
WHERE NOT EXISTS (SELECT 1 FROM staff_member WHERE id = 'staff-restaurant-cashier2');
