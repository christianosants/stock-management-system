create database stock_db;

use stock_db;

-- =====================================================
-- USERS
-- =====================================================
create table users(
	id int primary key auto_increment, 
	
	name varchar(100) not null,
	email varchar(150) not null unique,
	password varchar(255)not null,
	user_type enum('admin', 'common') not null, -- lista fixa e predefinida de opções
	
	active boolean default true, -- soft delete para manter o histórico
	creation_date DATETIME DEFAULT CURRENT_TIMESTAMP -- registro de tempo do momento de execução
);

-- =====================================================
-- CATEGORIES
-- =====================================================

create table categories(
	id int primary key auto_increment,
	
	name varchar(100) not null,
	description text, --  textos longos
	
	active boolean default true
);

-- =====================================================
-- SUPPLIERS
-- =====================================================

create table suppliers (
	id int primary key auto_increment,
	
	name varchar(150) not null,
	telephone varchar(20),
	email varchar(150),
	address varchar(255),
	
	active boolean default true
);

-- =====================================================
-- PRODUCTS
-- =====================================================

create table products(
	id int primary key auto_increment,
	
	category_id int not null,
	supplier_id int not null,
	
	name varchar(150) not null,
	code varchar(50)not null unique, 
	description text,
	quantity int not null default 0,
	price decimal(10,2)not null,
	
	
	active boolean default true,
	registration_date datetime default current_timestamp,
	removal_date datetime null, -- nulo pois pode haver produtos que nunca serão removidos
	reason_removal text null,
	
	-- foreign key 
	constraint fk_products_category -- referência para uma regra 
		foreign key (category_id) -- (quem é a chave)
		references categories(id), -- (de onde vem) tabela (indice)
		
	constraint fk_products_supplier
		foreign key (supplier_id)
		references suppliers(id)
);

-- =====================================================
-- MOVEMENTS
-- =====================================================

create table movements(
	id int primary key auto_increment,
	
	user_id int not null,
	product_id int not null,
	
	movement_type enum('entry','exit','reverse') not null,
	quantity int not null,
	observation text,
	
	movement_date datetime default current_timestamp,
	
	-- foreign key 
	constraint fk_movement_product
		foreign key (product_id)
		references products(id),
		
	constraint fk_movement_user
		foreign key (user_id)
		references users(id)
);

-- =====================================================
-- REVERSE LOGISTICS
-- =====================================================

create table reverse_logistics (
	id int primary key auto_increment,
	
	
	product_id int not null,
	user_id int not null,
	quantity int not null,
	
	reason text not null,
	status enum(
		'pending',
		'returned_to_stock',
		'discarded'
	) not null,
	
	registration_date datetime default current_timestamp,
	
	-- foreign key 
	constraint fk_reverse_product
		foreign key (product_id)
		references products(id),
		
	constraint fk_reverse_user
		foreign key (user_id)
		references users(id)
	
);


-- =====================================================
-- CONSTRAINTS
-- =====================================================

ALTER TABLE products 
ADD CONSTRAINT chk_products_quantity
CHECK (quantity >= 0); -- evita saldo negativo

ALTER TABLE movements
ADD CONSTRAINT chk_movements_quantity
CHECK (quantity > 0);

ALTER TABLE reverse_logistics
ADD CONSTRAINT chk_reverse_quantity
CHECK (quantity > 0);

