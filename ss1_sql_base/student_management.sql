CREATE DATABASE IF NOT EXISTS student_management;

USE student_management;

CREATE TABLE students (
	student_id INT,
    student_name VARCHAR(200),
    age INT,
    student_country VARCHAR(50),
    PRIMARY KEY (student_id)
);

CREATE TABLE classes (
	class_id INT,
    class_name VARCHAR(200),
    PRIMARY KEY (class_id)
);

CREATE TABLE teachers (
	teacher_id INT,
    teacher_name VARCHAR(200),
    age INT,
    teacher_country VARCHAR(200),
    PRIMARY KEY (teacher_id)
);






