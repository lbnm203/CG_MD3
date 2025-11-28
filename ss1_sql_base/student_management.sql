CREATE DATABASE IF NOT EXISTS student_management;

USE student_management;


CREATE TABLE student (
	student_id INT,
    student_name VARCHAR(200),
    age INT,
    student_country VARCHAR(50)
);

CREATE TABLE class (
	class_id INT,
    class_name VARCHAR(200)
);

CREATE TABLE teacher (
	teacher_id INT,
    teacher_name VARCHAR(200),
    age INT,
    teacher_country VARCHAR(200)
);







