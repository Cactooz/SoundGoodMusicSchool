CREATE TABLE student (
 student_id SERIAL NOT NULL,
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


CREATE TABLE timeslot (
 timeslot_id SERIAL NOT NULL,
 date DATE NOT NULL,
 start_time TIME(4) NOT NULL,
 end_time TIME(4) NOT NULL
);

ALTER TABLE timeslot ADD CONSTRAINT PK_timeslot PRIMARY KEY (timeslot_id);


CREATE TABLE lesson (
 lesson_id SERIAL NOT NULL,
 lesson_type VARCHAR(100) NOT NULL,
 price INT NOT NULL,
 timeslot_id INT NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (lesson_id);


CREATE TABLE booked_students (
 lesson_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE booked_students ADD CONSTRAINT PK_booked_students PRIMARY KEY (lesson_id,student_id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (timeslot_id) REFERENCES timeslot (timeslot_id);


ALTER TABLE booked_students ADD CONSTRAINT FK_booked_students_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);
ALTER TABLE booked_students ADD CONSTRAINT FK_booked_students_1 FOREIGN KEY (student_id) REFERENCES student (student_id);

