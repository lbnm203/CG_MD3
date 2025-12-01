-- drop database order_management;
create database if not exists order_management;

use order_management;

create table deliveries (
	delivery_id int,
    delivery_date date,
    primary key (delivery_id)
);

create table materials (
	material_id int,
    material_name varchar(200) not null,
    primary key (material_id)
);

create table delivery_material (
	delivery_id int,
    material_id int,
    delivery_price decimal(10,2),
    num_delivery int,
    primary key(delivery_id, material_id),
    foreign key (delivery_id) references deliveries(delivery_id),
    foreign key (material_id) references materials(material_id)
);

create table receipts (
	receipt_id int,
    receipt_date date,
    primary key (receipt_id)
);

create table material_receipt (
	material_id int,
    receipt_id int,
    receipt_price decimal(10, 2),
    num_receipt int,
    primary key (material_id, receipt_id),
    foreign key (material_id) references materials(material_id),
    foreign key (receipt_id) references receipts(receipt_id)
);

create table suppliers (
	supplier_id int,
    supplier_name varchar(200) not null,
    address varchar(200),
    phone_number varchar(50),
    primary key (supplier_id)
);

create table orders (
	order_id int,
	order_date date,
    supplier_id int,
    primary key (order_id),
    foreign key (supplier_id) references suppliers(supplier_id)
);

create table material_order (
	material_id int,
    order_id int,
    primary key (material_id, order_id),
	foreign key (material_id) references materials(material_id),
    foreign key (order_id) references orders(order_id)
);