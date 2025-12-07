use furama_db;


-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các 
-- ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select id_nhan_vien, ten_nhan_vien, so_cmnd, so_dien_thoai, email, dia_chi
from nhan_viens
where (ten_nhan_vien like "H%"
	or ten_nhan_vien like "T%"
    or ten_nhan_vien like "K%")
    and length(ten_nhan_vien) <= 15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select id_khach_hang, ten_khach_hang, dia_chi, timestampdiff(year, ngay_sinh_khach_hang, curdate()) as Tuoi
from khach_hangs
where timestampdiff(year, ngay_sinh_khach_hang, curdate()) between 18 and 50
	and	(dia_chi like "%Da Nang%"
		or dia_chi like "%Quang Tri%") ;

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp 
-- xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select kh.id_khach_hang, kh.ten_khach_hang, count(hd.id_hop_dong) as SoLanDat
from khach_hangs kh
join loai_khach_hang lkh on kh.id_loai_khach_hang = lkh.id_loai_khach_hang
left join hop_dongs hd on kh.id_khach_hang = hd.id_khach_hang
where ten_loai_khach_hang like "%Diamond%"
group by kh.id_khach_hang, kh.ten_khach_hang
order by SoLanDat asc;


-- 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 
-- (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) 
-- cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.id_khach_hang, kh.ten_khach_hang, lkh.ten_loai_khach_hang, hd.id_hop_dong, 
		dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc_hop_dong, 
        (ifnull(dv.chi_phi_thue, 0) + sum(ifnull(hdct.so_luong * dvdk.gia_dich_vu, 0))) as TongTien

from khach_hangs kh
join loai_khach_hang lkh on kh.id_loai_khach_hang = lkh.id_loai_khach_hang
left join hop_dongs hd on kh.id_khach_hang = hd.id_khach_hang
left join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
left join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
left join dich_vus dv on hd.id_dich_vu = dv.id_dich_vu

group by kh.id_khach_hang, kh.ten_khach_hang, lkh.ten_loai_khach_hang, hd.id_hop_dong, 
		dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc_hop_dong;


-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng
--  được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
SELECT dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vus dv
JOIN loai_dich_vu ldv ON dv.id_loai_dich_vu = ldv.id_loai_dich_vu
WHERE dv.id_dich_vu NOT IN (
        SELECT id_dich_vu
        FROM hop_dongs
        WHERE YEAR(ngay_lam_hop_dong) = 2019
        AND MONTH(ngay_lam_hop_dong) IN (1, 2, 3)
    );

-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các 
-- loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.
select dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vus dv
join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
where dv.id_dich_vu in (
	select id_dich_vu
    from hop_dongs
    where year(ngay_lam_hop_dong) = 2024
) and dv.id_dich_vu not in (
	select id_dich_vu
    from hop_dongs
    where year(ngay_lam_hop_dong) = 2019
);

-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có 
-- bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong) as Thang, count(id_khach_hang) as SoLuongKhachHang, sum(tong_tien) as TongDoanhThu
from hop_dongs hd
where year(ngay_lam_hop_dong) = 2019
group by Thang
order by Thang;


-- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả hiển thị
-- bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count
-- các IDHopDongChiTiet).
select hd.id_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc_hop_dong, hd.tien_dat_coc, count(hdct.id_hop_dong_chi_tiet) as SoLuongDichVuDiKem
from hop_dongs hd
left join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
group by hd.id_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc_hop_dong, hd.tien_dat_coc;

-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond”
-- và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
select kh.ten_khach_hang, lkh.ten_loai_khach_hang, kh.dia_chi, dvdk.ten_dich_vu_di_kem
from khach_hangs kh
join loai_khach_hang lkh on kh.id_loai_khach_hang = lkh.id_loai_khach_hang
join hop_dongs hd on hd.id_khach_hang = kh.id_khach_hang
join hop_dong_chi_tiet hdct on hdct.id_hop_dong = hd.id_hop_dong
join dich_vu_di_kem dvdk on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
where lkh.ten_loai_khach_hang = "%Diamond%"
and (kh.dia_chi like "%Vinh%" or kh.dia_chi like "%Quang Ngai%");



-- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
-- (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng
-- cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).


-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị
-- bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.

SELECT hd.id_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.id_dich_vu_di_kem) AS SoLanSuDung
from hop_dong_chi_tiet hdct
join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
join hop_dongs hd on hdct.id_hop_dong = hd.id_hop_dong
join dich_vus dv on hd.id_dich_vu = dv.id_dich_vu
join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
where dvdk.id_dich_vu_di_kem in (
	select id_dich_vu_di_kem
    from hop_dong_chi_tiet
    group by id_dich_vu_di_kem
    having count(id_dich_vu_di_kem) = 1
)
group by hd.id_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem
order by hd.id_hop_dong;


-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới 
-- chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
DELETE FROM nhan_viens
WHERE id_nhan_vien NOT IN (
    SELECT DISTINCT id_nhan_vien
    FROM hop_dongs
    WHERE YEAR(ngay_lam_hop_dong) BETWEEN 2017 AND 2019
);
-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, chỉ cập nhật những khách hàng 
-- đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng).

-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.

-- 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao gồm 
-- ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
select id_nhan_vien, ten_nhan_vien, email, so_dien_thoai, ngay_sinh, dia_chi, 'Nhan Vien' AS phan_loai
from nhan_viens
union all
select id_khach_hang, ten_khach_hang, email, so_dien_thoai, ngay_sinh_khach_hang, dia_chi, 'Khach Hang' AS phan_loai
from khach_hangs