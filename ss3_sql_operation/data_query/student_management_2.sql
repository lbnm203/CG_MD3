create database if not exists student_management_2;
-- drop database student_management_2;
use student_management_2;

create table classes (
	class_id int auto_increment,
    class_name varchar(60) not null,
    start_date datetime not null,
    class_status bit,
    primary key (class_id)
);

create table students (
	student_id int auto_increment,
    student_name varchar(30) not null,
    address varchar(50),
    phone varchar(20),
    student_status bit,
    class_id int not null,
    primary key (student_id),
    foreign key (class_id) references classes(class_id)
);

create table subjects (
	sub_id int auto_increment,
    sub_name varchar(30) not null,
    credit tinyint not null default 1 check (credit >= 1),
    subject_status bit default 1,
    primary key (sub_id)
);


create table marks (
	mark_id int auto_increment,
    sub_id int not null,
    student_id int not null,
    mark float default 0 check (mark between 0 and 100),
    exam_time tinyint default 1,
    primary key (mark_id),
    foreign key (sub_id) references subjects(sub_id),
    foreign key (student_id) references students(student_id)
);

select * from classes;
select * from students;
select * from subjects;
select * from marks;

insert into classes (class_name, start_date, class_status)
values 
	("A1", "2008/12/20", 1),
    ("A2", "2008/12/22", 1),
    ("B3", current_date(), 0);

INSERT INTO students (student_name, address, phone, student_status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO students (student_name, address, student_status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO students (student_name, address, phone, student_status, class_id) 
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subjects
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);


INSERT INTO marks (sub_id, student_id, mark, exam_time)
VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 
 