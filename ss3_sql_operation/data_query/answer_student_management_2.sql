use student_management_2;

-- 1.	Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * 
from students
where student_name like "h%";

-- 2.	Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from classes
where MONTH(start_date) = 12;

-- 3.	Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *
from subjects
where credit between 3 and 5;

-- 4.	Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET SQL_SAFE_UPDATES = 0;
update students
set class_id = 2
where student_name = "Hung";
SET SQL_SAFE_UPDATES = 1;

-- 5.	Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo 
-- điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.student_name, sb.sub_name, mark
from students s 
join marks m on s.student_id = m.student_id
join subjects sb on m.sub_id = sb.sub_id
order by mark desc, s.student_name asc;

