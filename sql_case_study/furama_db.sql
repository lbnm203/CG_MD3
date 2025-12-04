create database if not exists furama_db;
-- drop database furama_db;

use furama_db;


create table vi_tris (
	id_vi_tri int auto_increment,
    ten_vi_tri varchar(50),
    primary key (id_vi_tri)
);

create table trinh_dos (
	id_trinh_do int auto_increment,
    ten_trinh_do varchar(50),
    primary key (id_trinh_do)
);

create table bo_phans (
	id_bo_phan int auto_increment,
    ten_bo_phan varchar(50),
    primary key (id_bo_phan)
);

create table nhan_viens (
	id_nhan_vien int auto_increment,
    ten_nhan_vien varchar(100) ,
    ngay_sinh date,
    so_cmnd varchar(50),
    luong int,
    so_dien_thoai varchar(50),
    email varchar(50), 
    dia_chi varchar(100),
    id_vi_tri int,
    id_trinh_do int,
    id_bo_phan int,
    unique (so_cmnd, so_dien_thoai, email),
    primary key (id_nhan_vien),
    foreign key (id_vi_tri) references vi_tris(id_vi_tri),
    foreign key (id_bo_phan) references bo_phans(id_bo_phan),
    foreign key (id_trinh_do) references trinh_dos(id_trinh_do)
);

create table kieu_thues (
	id_kieu_thue int auto_increment,
    ten_kieu_thue varchar(50),
    primary key (id_kieu_thue)
);

create table loai_dich_vu (
	id_loai_dich_vu int auto_increment,
    ten_loai_dich_vu varchar(50),
    primary key (id_loai_dich_vu)
);

create table dich_vus (
	id_dich_vu int auto_increment,
    ten_dich_vu varchar(50),
    dien_tich int,
    chi_phi_thue int,
    so_nguoi_toi_da int,
    tieu_chuan_phong varchar(50),
    mo_ta_tien_nghi_khac varchar(100),
    dien_tich_ho_boi decimal(10,2),
    so_tang int,
    id_kieu_thue int,
    id_loai_dich_vu int,
    primary key (id_dich_vu),
    foreign key (id_kieu_thue) references kieu_thues(id_kieu_thue),
    foreign key (id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu)
);

create table loai_khach_hang (
	id_loai_khach_hang int auto_increment,
    ten_loai_khach_hang varchar(50),
    primary key (id_loai_khach_hang)
);

create table khach_hangs (
	id_khach_hang int auto_increment,
    ten_khach_hang varchar(50),
    ngay_sinh_khach_hang date,
    gioi_tinh bit(1) default b'0',
    so_cmnd varchar(50),
    so_dien_thoai varchar(50),
    email varchar(50),
    dia_chi varchar(50),
    id_loai_khach_hang int,
    unique(so_cmnd, so_dien_thoai, email),
    primary key (id_khach_hang),
    foreign key (id_loai_khach_hang) references loai_khach_hang(id_loai_khach_hang)
);

create table dich_vu_di_kem (
	id_dich_vu_di_kem int auto_increment,
    ten_dich_vu_di_kem varchar(50),
    gia_dich_vu int,
    don_vi varchar(50),
    trang_thai varchar(50),
    primary key (id_dich_vu_di_kem)
);

create table hop_dongs (
	id_hop_dong int auto_increment,
    ngay_lam_hop_dong date,
    ngay_ket_thuc_hop_dong date,
    tien_dat_coc int,
    tong_tien int,
    id_khach_hang int,
    id_nhan_vien int,
    id_dich_vu int,
    primary key (id_hop_dong),
    foreign key (id_khach_hang) references khach_hangs(id_khach_hang),
    foreign key (id_nhan_vien) references nhan_viens(id_nhan_vien),
    foreign key (id_dich_vu) references dich_vus(id_dich_vu)
);

create table hop_dong_chi_tiet (
	id_hop_dong_chi_tiet int auto_increment,
    so_luong int,
    id_hop_dong int,
    id_dich_vu_di_kem int,
    primary key (id_hop_dong_chi_tiet),
    foreign key (id_hop_dong) references hop_dongs(id_hop_dong),
    foreign key (id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem)
);

INSERT INTO vi_tris (ten_vi_tri) VALUES
('Quản lý'),
('Nhân viên');


INSERT INTO trinh_dos (ten_trinh_do) VALUES
('Trung cấp'),
('Cao đẳng'),
('Đại học'),
('Sau đại học');


INSERT INTO bo_phans (ten_bo_phan) VALUES
('Sales'),
('Hành chính'),
('Phục vụ'),
('Quản lý'),
('Kỹ thuật');


INSERT INTO nhan_viens
(ten_nhan_vien, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, id_vi_tri, id_trinh_do, id_bo_phan)
VALUES
('Nguyễn Văn An','1990-03-12','023456789',15000000,'0905123456','an.nguyen@example.com','Hà Nội',2,3,1),
('Trần Thị Bình','1992-07-22','045678912',12000000,'0904987654','binh.tran@example.com','Đà Nẵng',2,2,2),
('Lê Công Minh','1988-11-02','067891234',18000000,'0905678912','minh.le@example.com','Hồ Chí Minh',1,4,4),
('Phạm Thị Ngọc','1995-05-15','098123456',11000000,'0912345678','ngoc.pham@example.com','Huế',1,2,3),
('Hoàng Văn Tuấn','1991-01-30','091234567',13000000,'0932123456','tuan.hoang@example.com','Hải Phòng',2,3,5),
('Đỗ Thị Hạnh','1993-06-10','082345671',10500000,'0933456123','hanh.do@example.com','Hà Nội',2,2,1),
('Dương Văn Hải','1987-09-18','075612349',17000000,'0912789456','hai.duong@example.com','Quảng Nam',1,3,4),
('Nguyễn Thị Lan','1998-12-25','092134567',9800000,'0903432121','lan.nguyen@example.com','Cần Thơ',1,1,3),
('Trịnh Hoài Nam','1990-04-11','065432781',15500000,'0909098787','nam.trinh@example.com','Hà Nội',1,3,5),
('Võ Thị Thu','1994-10-07','089123405',11500000,'0911002200','thu.vo@example.com','Quảng Ngãi',1,2,2),
('Ngô Văn Vinh','1989-02-16','076541239',16000000,'0934432123','vinh.ngo@example.com','HCM',2,4,4),
('Trần Đức Toàn','1997-03-05','082156734',10000000,'0904123987','toan.tran@example.com','Đà Lạt',1,1,3),
('Lê Quang Huy','1993-08-19','091236547',14500000,'0914678901','huy.le@example.com','Hải Dương',1,3,5),
('Phạm Thu Hà','1996-12-13','078945612',10900000,'0915890134','ha.pham@example.com','Huế',1,2,1),
('Đinh Văn Cường','1988-05-24','067845219',17500000,'0935789012','cuong.dinh@example.com','HCM',1,4,4),
('Nguyễn Mai Anh','1999-09-09','092345761',9500000,'0905567890','anh.nguyen@example.com','Hà Nội',2,1,3),
('Phan Thị Trúc','1992-11-29','081234679',9800000,'0935345623','truc.phan@example.com','Bình Định',2,2,2),
('Hồ Văn Kiệt','1990-01-10','078965432',15000000,'0909023456','kiet.ho@example.com','Đà Nẵng',1,3,5),
('Vũ Đức Mạnh','1991-02-17','065432198',15800000,'0916789345','manh.vu@example.com','Hà Nội',1,4,4),
('Trương Thị Vy','1995-05-08','087654231',10800000,'0912349090','vy.truong@example.com','Nha Trang',2,2,1),
('Phạm Quốc Hưng','1989-12-22','092178543',16500000,'0932221133','hung.pham@example.com','HCM',1,4,4),
('Nguyễn Minh Long','1997-06-14','089456712',10200000,'0907889900','long.nguyen@example.com','Cần Thơ',1,1,3),
('Ngô Thị Hậu','1994-04-26','076541782',9800000,'0933459881','hau.ngo@example.com','Hải Phòng',2,2,2),
('Đoàn Văn Lộc','1993-07-03','078213654',14800000,'0914598732','loc.doan@example.com','Huế',1,3,5),
('Bùi Thị Trâm','1996-03-19','091236548',11200000,'0902319876','tram.bui@example.com','Hà Nội',2,2,1),
('Đặng Thanh Tùng','1988-10-01','065781234',17200000,'0937645123','tung.dang@example.com','HCM',1,4,4),
('Nguyễn Tố Nga','1999-08-22','092345876',9700000,'0909854565','nga.to@example.com','Quảng Trị',1,1,3),
('Trần Công Đạt','1992-02-04','078436521',10700000,'0931254789','dat.tran@example.com','Đà Nẵng',2,2,2),
('Hoàng Thị Yến','1994-09-16','091234678',11500000,'0917432112','yen.hoang@example.com','Hà Nội',2,3,5),
('Nguyễn Tấn Tài','1991-11-11','067891256',16200000,'0938765432','tai.nguyen@example.com','HCM',1,4,4);

INSERT INTO kieu_thues (ten_kieu_thue) VALUES
('Ngày'),
('Giờ'),
('Tháng'),
('Năm');


INSERT INTO loai_dich_vu (ten_loai_dich_vu) VALUES
('Villa'),
('House'),
('Room');


INSERT INTO dich_vus
(ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac,
 dien_tich_ho_boi, so_tang, id_kieu_thue, id_loai_dich_vu)
VALUES
-- VILLA (1–10)
('Villa Sunlight', 250, 4500000, 6, 'Deluxe', 'Hồ bơi riêng, bếp đầy đủ', 45.00, 2, 1, 1),
('Villa Ocean View', 300, 5200000, 8, 'Premium', 'Hướng biển, sân BBQ', 55.00, 3, 1, 1),
('Villa Garden Breeze', 220, 4300000, 5, 'Deluxe', 'Sân vườn riêng, ghế tắm nắng', 40.00, 2, 1, 1),
('Villa Sunset Hill', 280, 6000000, 6, 'Suite', 'View hoàng hôn, phòng khách lớn', 60.00, 3, 2, 1),
('Villa Tropical Palm', 260, 4800000, 7, 'Premium', 'Hồ bơi vô cực, minibar cao cấp', 50.00, 2, 1, 1),
('Villa Sapphire', 310, 6500000, 8, 'Suite', 'Khu làm việc, phòng gym mini', 70.00, 3, 1, 1),
('Villa Emerald', 230, 4200000, 5, 'Deluxe', 'Bếp mở, sân tắm nắng', 38.50, 2, 1, 1),
('Villa Pearl', 270, 5600000, 6, 'Premium', 'Phòng tắm đá tự nhiên', 52.00, 3, 2, 1),
('Villa Coral Reef', 260, 5000000, 6, 'Deluxe', 'Giếng trời, phòng khách rộng', 48.00, 2, 1, 1),
('Villa Lotus', 240, 4700000, 5, 'Deluxe', 'Bồn tắm ngoài trời, sân vườn lớn', 44.00, 2, 1, 1),

-- HOUSE (11–20)
('House Maple', 120, 1500000, 4, 'Standard', 'Ban công rộng, bếp nhỏ', 0.00, 1, 1, 2),
('House Rosewood', 150, 1800000, 5, 'Standard', 'Giếng trời, sân để xe', 0.00, 2, 1, 2),
('House Sunflower', 140, 1700000, 4, 'Standard', 'Sân vườn nhỏ, nội thất cơ bản', 0.00, 1, 1, 2),
('House Mimosa', 160, 2100000, 6, 'Deluxe', 'Phòng khách rộng, ban công lớn', 0.00, 2, 1, 2),
('House Lavender', 130, 1600000, 4, 'Standard', 'Nội thất gỗ, cửa kính lớn', 0.00, 1, 1, 2),
('House Olive', 170, 2200000, 6, 'Deluxe', 'Bếp mở, phòng sinh hoạt chung', 0.00, 2, 1, 2),
('House Jasmine', 155, 1900000, 5, 'Standard', 'Ban công hướng vườn', 0.00, 1, 1, 2),
('House Pine', 180, 2400000, 6, 'Deluxe', 'Không gian rộng, phù hợp gia đình', 0.00, 2, 2, 2),
('House Daisy', 150, 1750000, 4, 'Standard', 'Thiết kế sáng, thoáng khí', 0.00, 1, 1, 2),
('House Orchid', 160, 2050000, 5, 'Deluxe', 'Bếp đầy đủ, cửa kính lớn', 0.00, 2, 1, 2),

-- ROOM (21–30)
('Room Standard A1', 35, 600000, 2, 'Standard', 'Tivi, minibar', 0.00, 1, 1, 3),
('Room Standard A2', 30, 550000, 2, 'Standard', 'Điều hòa, máy sấy tóc', 0.00, 1, 1, 3),
('Room Deluxe B1', 40, 750000, 3, 'Deluxe', 'View vườn, bàn làm việc', 0.00, 1, 1, 3),
('Room Deluxe B2', 45, 800000, 3, 'Deluxe', 'Ban công nhỏ, tủ lạnh mini', 0.00, 1, 1, 3),
('Room Premium C1', 50, 950000, 4, 'Premium', 'Bồn tắm đứng, sofa nhỏ', 0.00, 1, 2, 3),
('Room Premium C2', 55, 1000000, 4, 'Premium', 'View hồ bơi, minibar cao cấp', 0.00, 1, 1, 3),
('Room Suite D1', 60, 1300000, 4, 'Suite', 'Phòng ngủ + phòng khách', 0.00, 1, 1, 3),
('Room Suite D2', 70, 1500000, 4, 'Suite', 'Bồn tắm lớn, sofa dài', 0.00, 1, 2, 3),
('Room Standard A3', 28, 500000, 2, 'Standard', 'Wifi mạnh, tivi treo tường', 0.00, 1, 1, 3),
('Room Deluxe B3', 42, 780000, 3, 'Deluxe', 'View sân vườn, bàn làm việc', 0.00, 1, 1, 3);


select * from dich_vus;

INSERT INTO loai_khach_hang (ten_loai_khach_hang) VALUES
('Diamond'),
('Platinum'),
('Gold'),
('Silver'),
('Member');


INSERT INTO khach_hangs
(ten_khach_hang, ngay_sinh_khach_hang, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, id_loai_khach_hang)
VALUES
('Nguyễn Thị Hồng', '1991-04-12', 0, '012345678', '0905123456', 'hong.nguyen@example.com', 'Hà Nội', 1),
('Trần Văn Dũng', '1988-09-22', 1, '023456789', '0906789123', 'dung.tran@example.com', 'Đà Nẵng', 2),
('Lê Thị Thuỳ', '1995-03-17', 0, '034567891', '0912345678', 'thuy.le@example.com', 'Hồ Chí Minh', 3),
('Phạm Công Hậu', '1992-11-03', 1, '045678912', '0909891234', 'hau.pham@example.com', 'Huế', 4),
('Hoàng Minh Quân', '1987-05-26', 1, '056789123', '0934556677', 'quan.hoang@example.com', 'Nha Trang', 5),
('Đỗ Thị Mai', '1994-07-15', 0, '067891234', '0912203344', 'mai.do@example.com', 'Hải Phòng', 1),
('Vũ Quốc Khánh', '1990-12-29', 1, '078912345', '0903344556', 'khanh.vu@example.com', 'Hà Nội', 2),
('Ngô Minh Ánh', '1998-10-08', 0, '089123456', '0935566778', 'anh.ngo@example.com', 'Quảng Nam', 3),
('Bùi Văn Duy', '1989-02-27', 1, '091234567', '0917788990', 'duy.bui@example.com', 'Cần Thơ', 4),
('Trịnh Thanh Vy', '1997-06-11', 0, '092345678', '0906677889', 'vy.trinh@example.com', 'Đà Lạt', 5),
('Đặng Thị Phượng', '1993-01-21', 0, '013456789', '0902456789', 'phuong.dang@example.com', 'Nghệ An', 1),
('Lê Anh Tuấn', '1986-08-14', 1, '024567891', '0932345901', 'tuan.le@example.com', 'Hà Nội', 2),
('Nguyễn Tố Loan', '1999-09-09', 0, '035678912', '0912456789', 'loan.to@example.com', 'Hồ Chí Minh', 3),
('Phan Đức Trọng', '1991-03-05', 1, '046789123', '0905647382', 'trong.phan@example.com', 'Huế', 4),
('Đoàn Minh Hương', '1996-12-20', 0, '057891234', '0937473829', 'huong.doan@example.com', 'Quảng Bình', 5),
('Trương Bá Lộc', '1988-04-07', 1, '068912345', '0913234765', 'loc.truong@example.com', 'Hà Nội', 1),
('Phạm Hà My', '1997-07-30', 0, '079123456', '0902121345', 'my.pham@example.com', 'Đà Nẵng', 2),
('Huỳnh Quốc Bảo', '1995-11-12', 1, '081234567', '0939876543', 'bao.huynh@example.com', 'Hồ Chí Minh', 3),
('Nguyễn Thanh Hà', '1993-02-09', 0, '093456781', '0919080706', 'ha.thanh@example.com', 'Hải Phòng', 4),
('Võ Nhật Tân', '1987-06-16', 1, '094567812', '0906765432', 'tan.vo@example.com', 'Đắk Lắk', 5),
('Đinh Thị Nguyệt', '1994-12-25', 0, '015678923', '0934321123', 'nguyet.dinh@example.com', 'Thanh Hóa', 1),
('Tô Văn Thịnh', '1989-08-18', 1, '026789134', '0915321876', 'thinh.to@example.com', 'Hà Nội', 2),
('Lưu Thị Quyên', '1996-10-28', 0, '037891245', '0906677123', 'quyen.luu@example.com', 'Bình Định', 3),
('Nguyễn Đức Lâm', '1992-05-13', 1, '048912356', '0938899234', 'lam.nguyen@example.com', 'Cần Thơ', 4),
('Trần Thị Tâm', '1998-01-06', 0, '059123467', '0904455234', 'tam.tran@example.com', 'Gia Lai', 5),
('Hoàng Văn Hữu', '1986-09-19', 1, '061234578', '0916765432', 'huu.hoang@example.com', 'Hà Nội', 1),
('Nguyễn Thị Hảo', '1997-02-23', 0, '072345689', '0934425678', 'hao.nguyen@example.com', 'Hồ Chí Minh', 2),
('Phùng Thanh Tùng', '1995-03-27', 1, '083456790', '0905998877', 'tung.phung@example.com', 'Đà Nẵng', 3),
('Trần Thanh Trúc', '1999-07-18', 0, '094567823', '0913556423', 'truc.tran@example.com', 'Huế', 4),
('Lương Minh Hậu', '1991-11-15', 1, '095678934', '0906778123', 'hau.luong@example.com', 'Hải Dương', 5);



INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, gia_dich_vu, don_vi, trang_thai) VALUES
('Thuê xe máy', 150000, 'chiếc', 'Còn'),
('Thuê xe đạp', 80000, 'chiếc', 'Còn'),
('Giặt ủi', 30000, 'kg', 'Còn'),
('Massage toàn thân', 500000, 'suất', 'Còn'),
('Xông hơi', 200000, 'lượt', 'Còn'),
('Đón sân bay', 350000, 'lượt', 'Còn'),
('Trả phòng muộn', 250000, 'lượt', 'Còn'),
('Ăn sáng', 120000, 'suất', 'Còn'),
('Bữa tối', 250000, 'suất', 'Còn'),
('Thuê ghế biển', 50000, 'ghế', 'Còn'),
('Thuê dù che', 70000, 'bộ', 'Còn'),
('BBQ ngoài trời', 800000, 'gói', 'Còn'),
('Tour tham quan', 900000, 'tour', 'Còn'),
('Phòng gym', 100000, 'ngày', 'Còn'),
('Phòng xông đá nóng', 150000, 'lượt', 'Còn'),
('Sân tennis', 200000, 'giờ', 'Còn'),
('Sân golf mini', 180000, 'giờ', 'Còn'),
('Dịch vụ trông trẻ', 300000, 'giờ', 'Còn'),
('Thuê áo phao', 30000, 'cái', 'Còn'),
('Thuê kayak', 200000, 'giờ', 'Còn'),
('Giặt giày', 70000, 'đôi', 'Còn'),
('Spa tay', 150000, 'suất', 'Còn'),
('Spa chân', 170000, 'suất', 'Còn'),
('Set hoa tặng', 250000, 'bó', 'Còn'),
('Nến trang trí', 200000, 'gói', 'Còn'),
('Sắp xếp phòng honeymoon', 350000, 'lần', 'Còn'),
('Bánh sinh nhật', 300000, 'bánh', 'Còn'),
('Trang trí sinh nhật', 600000, 'gói', 'Còn'),
('Dọn phòng extra', 50000, 'lần', 'Còn'),
('Thuê flycam', 1000000, 'giờ', 'Còn');


INSERT INTO hop_dongs (ngay_lam_hop_dong, ngay_ket_thuc_hop_dong, tien_dat_coc, tong_tien, id_nhan_vien, id_khach_hang, id_dich_vu) VALUES
-- 1. Khách Diamond thuê Villa 1 tháng
('2024-01-10', '2024-02-10', 5000000, 30000000, 1, 1, 1),

-- 2. Khách Platinum thuê Villa 7 ngày
('2024-03-05', '2024-03-12', 3000000, 12000000, 2, 2, 2),

-- 3. Khách Gold thuê House 3 ngày
('2024-04-01', '2024-04-04', 1000000, 4500000, 3, 3, 3),

-- 4. Khách Silver thuê Room theo giờ (8 tiếng)
('2024-05-18', '2024-05-18', 300000, 800000, 2, 4, 4),

-- 5. Khách Member thuê Room 5 ngày
('2024-06-20', '2024-06-25', 500000, 3500000, 1, 5, 4),

-- 6. Khách Diamond thuê Villa 1 năm
('2024-07-01', '2025-07-01', 15000000, 280000000, 3, 1, 2),

-- 7. Khách Gold thuê House 1 tháng
('2024-08-10', '2024-09-10', 2000000, 15000000, 1, 3, 3),

-- 8. Khách Platinum thuê Villa 3 tháng
('2024-09-15', '2024-12-15', 7000000, 75000000, 2, 2, 1);

SELECT id_nhan_vien FROM nhan_viens;

INSERT INTO hop_dong_chi_tiet (id_hop_dong, id_dich_vu_di_kem, so_luong) VALUES
-- Hợp đồng 1
(1, 1, 3),   -- 3 lần BBQ
(1, 3, 5),   -- Spa 5 lượt
(1, 5, 10),  -- Giặt ủi 10 lần

-- Hợp đồng 2
(2, 1, 1),
(2, 3, 2),

-- Hợp đồng 3
(3, 2, 2),   -- Thuê xe máy 2 ngày
(3, 5, 3),   -- Giặt ủi 3 lần

-- Hợp đồng 4
(4, 4, 1),   -- Đưa đón sân bay
(4, 5, 1),   -- Giặt ủi 1 lần

-- Hợp đồng 5
(5, 5, 4),   -- Giặt ủi 4 lần

-- Hợp đồng 6
(6, 1, 10),  -- BBQ hằng tháng
(6, 2, 12),  -- Thuê xe 12 tháng
(6, 3, 20),  -- Spa cao cấp
(6, 5, 30),  -- Giặt ủi nhiều

-- Hợp đồng 7
(7, 2, 5),   -- Thuê xe 5 ngày

-- Hợp đồng 8
(8, 1, 4),
(8, 3, 8),
(8, 4, 2);
