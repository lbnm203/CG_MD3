-- drop database sales_management;
create database if not exists sales_management;

use sales_management;

create table customers (
	customer_id int,
    customer_name varchar(100),
    age int,
    primary key (customer_id)
);

create table orders (
	order_id int,
    customer_id int,
    order_date date,
    order_total_price decimal(10,2),
    primary key (order_id),
    foreign key (customer_id) references customers(customer_id)
);

create table products (
	product_id int,
    product_name varchar(100),
    product_price decimal(10,2),
    primary key (product_id)
);

create table order_details (
	order_id int,
    product_id int,
    order_quantity int,
    primary key (order_id, product_id),
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);

