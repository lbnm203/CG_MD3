create database if not exists product_db;

use product_db;

create table products (
	id int auto_increment,
    product_code varchar(50),
    product_name varchar(50),
    product_price int,
    product_amount int,
    product_description varchar(100),
    product_status varchar(50),
    primary key (id)
);

INSERT INTO products (product_code, product_name, product_price, product_amount, product_description, product_status) VALUES
('P001', 'Laptop Acer Aspire 5', 15000000, 10, 'Laptop văn phòng 15.6 inch', 'active'),
('P002', 'Laptop Dell Vostro 3400', 18500000, 7, 'Laptop học tập - làm việc', 'active'),
('P003', 'Chuột Logitech M331', 350000, 50, 'Chuột không dây siêu êm', 'active'),
('P004', 'Bàn phím DareU DK87', 750000, 30, 'Bàn phím cơ 87 phím', 'active'),
('P005', 'Tai nghe Sony WH-CH510', 1200000, 18, 'Tai nghe Bluetooth 35 giờ pin', 'active'),
('P006', 'Máy in Canon LBP2900', 3200000, 5, 'Máy in laser trắng đen', 'active'),
('P007', 'Ổ cứng HDD WD 1TB', 1250000, 20, 'Ổ cứng HDD 3.5inch WD', 'active'),
('P008', 'Ổ cứng SSD Kingston 240GB', 650000, 25, 'SSD tốc độ cao SATA', 'active'),
('P009', 'Màn hình LG 24MP88', 3800000, 12, 'Màn hình 24 inch viền mỏng', 'active'),
('P010', 'Màn hình Samsung 27AM500', 5200000, 8, 'Màn hình 27 inch Smart Monitor', 'active'),
('P011', 'USB SanDisk 32GB', 220000, 40, 'USB 3.0 tốc độ cao', 'active'),
('P012', 'Loa Bluetooth JBL Go 3', 780000, 14, 'Loa mini chống nước chuẩn IP67', 'active'),
('P013', 'Quạt tản nhiệt Cooler Master', 450000, 22, 'Tản nhiệt CPU hiệu suất cao', 'active'),
('P014', 'Webcam Logitech C270', 650000, 16, 'Webcam HD 720p', 'active'),
('P015', 'Bộ phát WiFi TP-Link C6', 890000, 9, 'WiFi AC1200 tốc độ cao', 'active'),
('P016', 'Router Xiaomi AX3000', 1250000, 11, 'Router băng tần kép WiFi 6', 'active'),
('P017', 'Pin sạc dự phòng Anker 10k', 650000, 19, 'Sạc nhanh PowerIQ', 'active'),
('P018', 'Camera Yoosee 1080P', 450000, 27, 'Camera xoay 360 độ', 'active'),
('P019', 'Máy hút bụi cầm tay Deerma', 900000, 13, 'Máy hút bụi gia đình', 'active'),
('P020', 'Nồi chiên không dầu Lock&Lock', 1450000, 6, 'Dung tích 5.5L, chống dính', 'active');

select * from products;

-- 1.  Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index idx_product_code on products(product_code);

-- 2. Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create unique index idx_product_name_price on products(product_name, product_price);

-- 3.  Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where product_code like "P00%";

-- drop index idx_product_code on products;
-- drop index idx_product_name_price on products;


-- 5. Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view view_product as
select product_code, product_name, product_price, product_status
from products;

select * from view_product;

-- 6. Tiến hành sửa đổi view
create or replace view view_product as
select product_code, product_name, product_price, product_status
from products
where product_code like "P00%";

-- 7.  Tiến hành xoá view
drop view view_product;

-- 8. Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure sp_get_info()
begin
	select *
    from products;
end //

delimiter ;

call sp_get_info();

-- 9. Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure sp_add_product(
	in p_product_code varchar(50),
    in p_product_name varchar(50),
    in p_product_price int,
    in p_product_amount int,
    in p_product_description varchar(100),
    in p_product_status varchar(50)
)
begin
	insert into products (product_code, product_name, product_price, product_amount, product_description, product_status)
    value (p_product_code, p_product_name, p_product_price, p_product_amount, p_product_description, p_product_status);
end //

delimiter ;

call sp_add_product('P021', 'Quạt mini để bàn', 150000, 20, 'Quạt mini tiện dụng', 'active');

-- 10. Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure sp_update_product(
	in p_id int,
	in p_product_code varchar(50),
    in p_product_name varchar(50),
    in p_product_price int,
    in p_product_amount int,
    in p_product_description varchar(100),
    in p_product_status varchar(50)
)
begin
	update products
    set 
		product_code = p_product_code,
        product_name = p_product_name,
        product_price = p_product_price,
        product_amount = p_product_amount,
        product_description = p_product_description, 
        product_status = p_product_status
	where id = p_id;
end //

delimiter ;

call sp_update_product(4, 'P004', 'Bàn phím Akko Moonlight', 350000, 10, 'Bàn phím cơ 70 phím', 'inactive');

-- 11. Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure sp_delete_product (in p_id int)
begin
	delete from products
    where id = p_id;
end //

delimiter ;

call sp_delete_product(21);