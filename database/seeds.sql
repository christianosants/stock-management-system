
-- =====================================================
-- USERS
-- =====================================================

INSERT INTO users (name, email, password, user_type)
VALUES
('Administrador', 'admin@stockdb.com', 'admin123', 'admin'),

('Carlos Silva', 'carlos@stockdb.com', 'carlos123', 'common'),

('Ana Souza', 'ana@stockdb.com', 'ana123', 'common'),

('Mariana Costa', 'mariana@stockdb.com', 'mariana123', 'common'),

('Lucas Oliveira', 'lucas@stockdb.com', 'lucas123', 'common');

-- =====================================================
-- CATEGORIES
-- =====================================================

INSERT INTO categories (name, description)
VALUES
('Peripherals', 'Computer peripherals and accessories'),

('Hardware', 'Internal computer hardware'),

('Monitors', 'Gaming and office monitors'),

('Storage', 'SSD, HD and external storage devices'),

('Networking', 'Routers, switches and network equipment'),

('Notebooks', 'Laptops and notebooks');

-- =====================================================
-- SUPPLIERS
-- =====================================================


INSERT INTO suppliers (name, telephone, email, address)
VALUES
('Tech Distribuidora', '11999990001', 'contact@techdist.com', 'São Paulo - SP'),

('Mega Hardware', '11999990002', 'sales@megahardware.com', 'Rio de Janeiro - RJ'),

('Global Electronics', '11999990003', 'support@globalelec.com', 'Curitiba - PR'),

('InfoParts', '11999990004', 'commercial@infoparts.com', 'Campinas - SP'),

('Prime Tech', '11999990005', 'contact@primetech.com', 'Belo Horizonte - MG');


-- =====================================================
-- PRODUCTS
-- =====================================================


INSERT INTO products
(name, code, description, quantity, price, category_id, supplier_id)
VALUES

(
'Mouse Gamer RGB',
'MS-GMR-001',
'RGB gaming mouse 7200 DPI',
25,
129.90,
7,
1
),

(
'Mechanical Keyboard',
'KB-MEC-002',
'Mechanical keyboard switch blue ABNT2',
18,
299.90,
7,
2
),

(
'SSD Kingston 1TB',
'SSD-KNG-003',
'NVMe PCIe 4.0 SSD',
12,
499.90,
8,
4
),

(
'LG UltraGear 24',
'MNT-LG-004',
'24 inch IPS Full HD 144Hz monitor',
8,
899.90,
9,
3
),

(
'Notebook Lenovo IdeaPad',
'NTB-LNV-005',
'Ryzen 5 notebook with 16GB RAM',
5,
3499.90,
12,
2
),

(
'TP-Link Router AX1800',
'RTR-TP-006',
'Wi-Fi 6 dual band router',
10,
379.90,
11,
1
),

(
'Memory RAM 16GB',
'RAM-016-007',
'DDR4 3200MHz RAM memory',
20,
249.90,
8,
4
),

(
'RTX 4060 GPU',
'GPU-RTX-008',
'NVIDIA RTX 4060 graphics card',
4,
2899.90,
8,
5
);



-- =====================================================
-- MOVEMENTS
-- =====================================================

INSERT INTO movements
(product_id, user_id, movement_type, quantity, observation)
VALUES

(
9,
1,
'entry',
10,
'Initial stock replenishment'
),

(
10,
2,
'exit',
2,
'Sale completed'
),

(
11,
3,
'entry',
5,
'New SSD units received'
),

(
12,
2,
'exit',
1,
'Monitor sold to customer'
),

(
13,
1,
'exit',
1,
'Notebook sold'
),

(
14,
4,
'entry',
3,
'Router stock adjustment'
),

(
15,
5,
'exit',
4,
'RAM sold in promotion'
),

(
16,
3,
'reverse',
1,
'Customer returned defective mouse'
);



-- =====================================================
-- REVERSE LOGISTICS
-- =====================================================

INSERT INTO reverse_logistics
(product_id, user_id, quantity, reason, status)
VALUES

(
9,
3,
1,
'Mouse sensor defect',
'pending'
),

(
10,
2,
1,
'Customer canceled purchase',
'returned_to_stock'
),

(
11,
1,
2,
'SSD read failure',
'discarded'
),

(
12,
4,
1,
'Monitor dead pixel issue',
'pending'
),

(
13,
1,
1,
'Notebook returned by customer',
'returned_to_stock'
);
