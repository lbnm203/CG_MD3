-- drop database bussiness_manangement;
create database if not exists bussiness_management;

use bussiness_management;

create table positions (
	position_id int,
    position_name varchar(100) not null,
    primary key (position_id)
);

create table experience (
	experience_id int,
    experience_name varchar(100) not null,
    primary key (experience_id)
);

create table departments (
	department_id int,
    department_name varchar(100) not null,
    primary key (department_id)
);

create table employees (
	employee_id int,
    employee_name varchar(100) not null,
    employee_dob date,
    employee_identity varchar(20) not null unique,
    employee_salary int,
    employee_phone varchar(20) unique,
    employee_email varchar(50) unique,
    employee_address varchar(100),
    position_id int,
    experience_id int,
    department_id int,
    primary key (employee_id),
    foreign key (position_id) references positions(position_id),
    foreign key (experience_id) references positions(experience_id),
    foreign key (department_id) references positions(department_id)
);

create table customer_types (
	type_id int,
    type_name varchar(50),
	primary key (type_id)	
);

create table customers (
	customer_id int,
    customer_name varchar(100) not null,
    customer_dob date,
    customer_gender bit(1) default b'0',
    customer_identity varchar(50) not null unique,
    customer_phone varchar(20) not null unique,
    customer_email varchar(50) not null unique,
    customer_address varchar(100),
    type_id int,
    primary key (customer_id),
    foreign key (type_id) references customer_types(type_id)
);