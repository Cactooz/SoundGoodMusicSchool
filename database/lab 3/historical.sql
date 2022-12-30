CREATE TABLE lesson (
 lesson_id INT UNIQUE NOT NULL,
 date DATE NOT NULL,
 start_time TIME(4) NOT NULL,
 end_time TIME(4) NOT NULL,
 lesson_type VARCHAR(100) NOT NULL,
 price INT NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (lesson_id);


CREATE TABLE student (
 student_id INT UNIQUE NOT NULL,
 personal_number VARCHAR(12) UNIQUE NOT NULL,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100),
 phone VARCHAR(15),
 email VARCHAR(100) UNIQUE,
 street VARCHAR(100),
 house INT,
 city VARCHAR(100),
 zip VARCHAR(10)
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE booked_students (
 lesson_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE booked_students ADD CONSTRAINT PK_booked_students PRIMARY KEY (lesson_id,student_id);


ALTER TABLE booked_students ADD CONSTRAINT FK_booked_students_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);
ALTER TABLE booked_students ADD CONSTRAINT FK_booked_students_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


CREATE extension dblink;
