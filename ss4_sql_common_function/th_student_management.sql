use student_management_2;

select * from students;

insert into students (student_name, address, student_status, class_id)
values ('Lan', 'Ha Noi', 0, 1);

-- SET SQL_SAFE_UPDATES = 0;
-- delete from students
-- where student_name = "Lan";
-- SET SQL_SAFE_UPDATES = 1;

-- SET SQL_SAFE_UPDATES = 0;
-- update students
-- set student_id = 4
-- where student_name = "Lan";
-- SET SQL_SAFE_UPDATES = 1;


select address, count(student_id) as 'So luong SV'
from students
group by address;

select count(student_id) as 'So luong SV'
from students

-- Bước 3: Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
select s.student_id, student_name, avg(mark) as dtb
from students s
join marks m on s.student_id = m.student_id
group by s.student_id, student_name
having dtb > 15;


select s.student_id, s.student_name, avg(m.mark) as dtb
from students s
join marks m on s.student_id = m.student_id
group by s.student_id, student_name
having avg(mark) = (
	select max(avg_mark)
    from (
		select avg(mark) as avg_mark
        from marks
        group by student_id
    ) as t
); 
