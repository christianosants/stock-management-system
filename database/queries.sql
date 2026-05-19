-- =====================================================
-- -PRODUTOS COM CATEGORIAS E FORNECEDORES
-- =====================================================

select 
    p.id,
    p.name AS product,
    c.name AS category,
    s.name AS supplier,
    p.quantity,
    p.price
FROM products p
INNER JOIN categories c
    ON p.category_id = c.id
INNER JOIN suppliers s
    ON p.supplier_id = s.id;


-- =====================================================
-- PRODUTOS COM CATEGORIAS E FORNECEDORES
-- =====================================================

select
    name,
    quantity
FROM products
WHERE quantity < 10;


-- =====================================================
-- VALOR TOTAL DO ESTOQUE
-- =====================================================

select 
    SUM(quantity * price) AS total_stock_value
FROM products;


-- =====================================================
-- HISTÓRICO DE MOVIMENTAÇÕES
-- =====================================================

select
    p.name AS product,
    u.name AS user,
    m.movement_type,
    m.quantity,
    m.movement_date
FROM movements m
INNER JOIN products p
    ON m.product_id = p.id
INNER JOIN users u
    ON m.user_id = u.id
ORDER BY m.movement_date DESC;


-- =====================================================
-- PRODUTOS DEVOLVIDOS
-- =====================================================

select 
    p.name,
    rl.quantity,
    rl.reason,
    rl.status
FROM reverse_logistics rl
INNER JOIN products p
    ON rl.product_id = p.id;

