--Copy student data
INSERT INTO student(student_id, personal_number, first_name, last_name, phone, email, street, house, city, zip)
SELECT student_id, personal_number, first_name, last_name, phone, email, street, house, city, zip
FROM dblink('dbname=sgms user=postgres password=pass',
'SELECT student_id, personal_number, first_name, last_name, phone, email, street, house, city, zip
FROM student INNER JOIN person ON student_id=person_id')
AS COPY (student_id INT, personal_number VARCHAR(12), first_name VARCHAR(100), last_name VARCHAR(100),
phone VARCHAR(15), email VARCHAR(100), street VARCHAR(100), house INT, city VARCHAR(100), zip VARCHAR(10))
ON CONFLICT (student_id) DO NOTHING;

--Copy individual lesson data
INSERT INTO lesson(lesson_id, date, start_time, end_time, lesson_type, price)
SELECT lesson_id, date, start_time, end_time, lesson_type, price
FROM dblink('dbname=sgms user=postgres password=pass',
'SELECT timeslot_id AS lesson_id, date, start_time, end_time, ''individual'' AS lesson_type, price
FROM individual_lesson NATURAL JOIN timeslot NATURAL JOIN price_list;')
AS COPY (lesson_id INT, date DATE, start_time TIME(4), end_time TIME(4), lesson_type VARCHAR(100), price INT)
ON CONFLICT (lesson_id) DO NOTHING;

--Copy group lesson data
INSERT INTO lesson(lesson_id, date, start_time, end_time, lesson_type, price)
SELECT lesson_id, date, start_time, end_time, lesson_type, price
FROM dblink('dbname=sgms user=postgres password=pass',
'SELECT timeslot_id AS lesson_id, date, start_time, end_time, ''group'' AS lesson_type, price
FROM group_lesson NATURAL JOIN timeslot NATURAL JOIN price_list;')
AS COPY (lesson_id INT, date DATE, start_time TIME(4), end_time TIME(4), lesson_type VARCHAR(100), price INT)
ON CONFLICT (lesson_id) DO NOTHING;

--Copy ensemble data
INSERT INTO lesson(lesson_id, date, start_time, end_time, lesson_type, price)
SELECT lesson_id, date, start_time, end_time, lesson_type, price
FROM dblink('dbname=sgms user=postgres password=pass',
'SELECT timeslot_id AS lesson_id, date, start_time, end_time, ''ensemble'' AS lesson_type, price
FROM ensemble NATURAL JOIN timeslot NATURAL JOIN price_list;')
AS COPY (lesson_id INT, date DATE, start_time TIME(4), end_time TIME(4), lesson_type VARCHAR(100), price INT)
ON CONFLICT (lesson_id) DO NOTHING;

--Copy group lesson and ensemble students data
INSERT INTO booked_students(lesson_id, student_id)
SELECT lesson_id, student_id
FROM dblink('dbname=sgms user=postgres password=pass',
'SELECT timeslot_id AS lesson_id, student_id
FROM ensemble NATURAL JOIN ensemble_student
UNION SELECT timeslot_id AS lesson_id, student_id
FROM group_lesson NATURAL JOIN group_lesson_student
UNION SELECT timeslot_id AS lesson_id, student_id
FROM individual_lesson
NATURAL JOIN timeslot ORDER BY lesson_id')
AS COPY (lesson_id INT, student_id INT)
ON CONFLICT (lesson_id, student_id) DO NOTHING;
