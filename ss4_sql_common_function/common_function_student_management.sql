use student_management_2;

select * from subjects;
-- 1. 	Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select sub_name, credit
from subjects
where credit = (
	select max(credit)
    from subjects
);

select * from marks;
-- 2.	Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.sub_name,  mark
from subjects s 
join marks m on s.sub_id = m.sub_id
where mark = (
	select max(mark)
    from marks
);

select * from students;
-- 3.	Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.student_id, s.student_name, avg(mark) as "AvgScore"
from students s 
join marks m on s.student_id = m.student_id
group by s.student_id, s.student_name
order by AvgScore desc

