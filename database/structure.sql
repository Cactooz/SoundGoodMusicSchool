CREATE TABLE contact_person (
 contact_person_id SERIAL NOT NULL,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100),
 phone VARCHAR(15) NOT NULL,
 email VARCHAR(100) UNIQUE
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (contact_person_id);


CREATE TABLE genre (
 genre_id SERIAL NOT NULL,
 name VARCHAR(100) UNIQUE NOT NULL
);

ALTER TABLE genre ADD CONSTRAINT PK_genre PRIMARY KEY (genre_id);


CREATE TABLE instructor (
 instructor_id SERIAL NOT NULL,
 personal_number VARCHAR(12) UNIQUE NOT NULL,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100),
 ensemble BIT(1) NOT NULL,
 phone VARCHAR(15) NOT NULL,
 email VARCHAR(100) UNIQUE,
 street VARCHAR(100),
 house INT,
 city VARCHAR(100),
 zip VARCHAR(10)
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instructor_instrument (
 instructor_instrument_id SERIAL NOT NULL,
 instrument VARCHAR(100) UNIQUE NOT NULL
);

ALTER TABLE instructor_instrument ADD CONSTRAINT PK_instructor_instrument PRIMARY KEY (instructor_instrument_id);


CREATE TABLE instrument_brand (
 instrument_brand_id SERIAL NOT NULL,
 name VARCHAR(100) UNIQUE NOT NULL
);

ALTER TABLE instrument_brand ADD CONSTRAINT PK_instrument_brand PRIMARY KEY (instrument_brand_id);


CREATE TABLE instrument_type (
 instrument_type_id SERIAL NOT NULL,
 type VARCHAR(100) UNIQUE NOT NULL
);

ALTER TABLE instrument_type ADD CONSTRAINT PK_instrument_type PRIMARY KEY (instrument_type_id);


CREATE TABLE lesson_instrument (
 lesson_instrument_id SERIAL NOT NULL,
 instrument VARCHAR(100) UNIQUE NOT NULL
);

ALTER TABLE lesson_instrument ADD CONSTRAINT PK_lesson_instrument PRIMARY KEY (lesson_instrument_id);


CREATE TABLE lesson_skill_level (
 lesson_skill_level_id SERIAL NOT NULL,
 skill_level VARCHAR(20) UNIQUE NOT NULL
);

ALTER TABLE lesson_skill_level ADD CONSTRAINT PK_lesson_skill_level PRIMARY KEY (lesson_skill_level_id);


CREATE TABLE lesson_type (
 lesson_type_id SERIAL NOT NULL,
 type VARCHAR(20) UNIQUE NOT NULL
);

ALTER TABLE lesson_type ADD CONSTRAINT PK_lesson_type PRIMARY KEY (lesson_type_id);


CREATE TABLE price_type (
 price_type_id SERIAL NOT NULL,
 skill_level VARCHAR(20) UNIQUE NOT NULL
);

ALTER TABLE price_type ADD CONSTRAINT PK_price_type PRIMARY KEY (price_type_id);


CREATE TABLE skill_level (
 skill_level_id SERIAL NOT NULL,
 skill_level VARCHAR(20) NOT NULL
);

ALTER TABLE skill_level ADD CONSTRAINT PK_skill_level PRIMARY KEY (skill_level_id);


CREATE TABLE student (
 student_id SERIAL NOT NULL,
 personal_number VARCHAR(12) UNIQUE NOT NULL,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100),
 enrolled BIT(1) NOT NULL,
 phone VARCHAR(15),
 email VARCHAR(100) UNIQUE,
 street VARCHAR(100),
 house INT,
 city VARCHAR(100),
 zip VARCHAR(10),
 contact_person_id INT
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE student_instrument (
 student_instrument_id SERIAL NOT NULL,
 instrument VARCHAR(100) UNIQUE NOT NULL
);

ALTER TABLE student_instrument ADD CONSTRAINT PK_student_instrument PRIMARY KEY (student_instrument_id);


CREATE TABLE student_skill (
 student_id INT NOT NULL,
 skill_level_id INT NOT NULL,
 student_instrument_id INT NOT NULL
);

ALTER TABLE student_skill ADD CONSTRAINT PK_student_skill PRIMARY KEY (student_id,skill_level_id,student_instrument_id);


CREATE TABLE teaches_instrument (
 instructor_id INT NOT NULL,
 instructor_instrument_id INT NOT NULL
);

ALTER TABLE teaches_instrument ADD CONSTRAINT PK_teaches_instrument PRIMARY KEY (instructor_id,instructor_instrument_id);


CREATE TABLE instrument (
 instrument_id SERIAL NOT NULL,
 id VARCHAR(10) UNIQUE NOT NULL,
 cost INT NOT NULL,
 instrument_type_id INT NOT NULL,
 instrument_brand_id INT
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_id);


CREATE TABLE price_list (
 price_id SERIAL NOT NULL,
 price INT NOT NULL,
 pay INT NOT NULL,
 discount INT NOT NULL,
 price_type_id INT,
 lesson_type_id INT NOT NULL
);

ALTER TABLE price_list ADD CONSTRAINT PK_price_list PRIMARY KEY (price_id);


CREATE TABLE rental (
 id VARCHAR(10) UNIQUE NOT NULL,
 start_date DATE NOT NULL,
 end_date DATE NOT NULL,
 student_id INT NOT NULL,
 instrument_id INT NOT NULL
);


CREATE TABLE sibling (
 student_id INT NOT NULL,
 sibling_id INT NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (student_id,sibling_id);


CREATE TABLE timeslot (
 timeslot_id SERIAL NOT NULL,
 date DATE NOT NULL,
 time TIME(4) NOT NULL,
 location VARCHAR(100),
 price_id INT,
 instructor_id INT NOT NULL
);

ALTER TABLE timeslot ADD CONSTRAINT PK_timeslot PRIMARY KEY (timeslot_id);


CREATE TABLE booked_students (
 timeslot_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE booked_students ADD CONSTRAINT PK_booked_students PRIMARY KEY (timeslot_id,student_id);


CREATE TABLE ensemble (
 min_students INT NOT NULL,
 max_students INT NOT NULL,
 timeslot_id INT NOT NULL,
 genre_id INT
);


CREATE TABLE group_lesson (
 max_students INT NOT NULL,
 timeslot_id INT NOT NULL,
 lesson_skill_level_id INT NOT NULL,
 lesson_instrument_id INT
);


CREATE TABLE lesson (
 timeslot_id INT NOT NULL,
 lesson_skill_level_id INT NOT NULL,
 lesson_instrument_id INT
);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (contact_person_id) REFERENCES contact_person (contact_person_id);


ALTER TABLE student_skill ADD CONSTRAINT FK_student_skill_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE student_skill ADD CONSTRAINT FK_student_skill_1 FOREIGN KEY (skill_level_id) REFERENCES skill_level (skill_level_id);
ALTER TABLE student_skill ADD CONSTRAINT FK_student_skill_2 FOREIGN KEY (student_instrument_id) REFERENCES student_instrument (student_instrument_id);


ALTER TABLE teaches_instrument ADD CONSTRAINT FK_teaches_instrument_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE teaches_instrument ADD CONSTRAINT FK_teaches_instrument_1 FOREIGN KEY (instructor_instrument_id) REFERENCES instructor_instrument (instructor_instrument_id);


ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);
ALTER TABLE instrument ADD CONSTRAINT FK_instrument_1 FOREIGN KEY (instrument_brand_id) REFERENCES instrument_brand (instrument_brand_id);


ALTER TABLE price_list ADD CONSTRAINT FK_price_list_0 FOREIGN KEY (price_type_id) REFERENCES price_type (price_type_id);
ALTER TABLE price_list ADD CONSTRAINT FK_price_list_1 FOREIGN KEY (lesson_type_id) REFERENCES lesson_type (lesson_type_id);


ALTER TABLE rental ADD CONSTRAINT FK_rental_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE rental ADD CONSTRAINT FK_rental_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE sibling ADD CONSTRAINT FK_sibling_1 FOREIGN KEY (sibling_id) REFERENCES student (student_id);


ALTER TABLE timeslot ADD CONSTRAINT FK_timeslot_0 FOREIGN KEY (price_id) REFERENCES price_list (price_id);
ALTER TABLE timeslot ADD CONSTRAINT FK_timeslot_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE booked_students ADD CONSTRAINT FK_booked_students_0 FOREIGN KEY (timeslot_id) REFERENCES timeslot (timeslot_id);
ALTER TABLE booked_students ADD CONSTRAINT FK_booked_students_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (timeslot_id) REFERENCES timeslot (timeslot_id);
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (genre_id) REFERENCES genre (genre_id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (timeslot_id) REFERENCES timeslot (timeslot_id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (lesson_skill_level_id) REFERENCES lesson_skill_level (lesson_skill_level_id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_2 FOREIGN KEY (lesson_instrument_id) REFERENCES lesson_instrument (lesson_instrument_id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (timeslot_id) REFERENCES timeslot (timeslot_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (lesson_skill_level_id) REFERENCES lesson_skill_level (lesson_skill_level_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_2 FOREIGN KEY (lesson_instrument_id) REFERENCES lesson_instrument (lesson_instrument_id);


