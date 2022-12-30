--Copy student data
INSERT INTO student(student_id, personal_number, first_name, last_name, phone, email, street, house, city, zip)
SELECT student_id, personal_number, first_name, last_name, phone, email, street, house, city, zip
FROM dblink('dbname=sgms user=postgres password=pass',
'SELECT student_id, personal_number, first_name, last_name, phone, email, street, house, city, zip
FROM student INNER JOIN person ON student_id=person_id')
AS COPY (student_id INT, personal_number VARCHAR(12), first_name VARCHAR(100), last_name VARCHAR(100),
phone VARCHAR(15), email VARCHAR(100), street VARCHAR(100), house INT, city VARCHAR(100), zip VARCHAR(10))
ON CONFLICT (student_id) DO NOTHING;

--Copy lesson data
INSERT INTO lesson(lesson_id, date, start_time, end_time, lesson_type, price)
SELECT lesson_id, date, start_time, end_time, lesson_type, price
FROM dblink('dbname=sgms user=postgres password=pass',
'SELECT lesson_id, date, start_time, end_time, lesson_type, price FROM
(SELECT timeslot_id AS lesson_id, ''individual'' AS lesson_type, price_list_id FROM individual_lesson
UNION
SELECT timeslot_id AS lesson_id, ''group'' AS lesson_type, price_list_id FROM group_lesson
UNION 
SELECT timeslot_id AS lesson_id, ''ensemble'' AS lesson_type, price_list_id FROM ensemble) AS l
INNER JOIN timeslot ON l.lesson_id=timeslot_id
INNER JOIN price_list AS p ON l.price_list_id=p.price_list_id
ORDER BY lesson_id')
AS COPY (lesson_id INT, date DATE, start_time TIME(4), end_time TIME(4), lesson_type VARCHAR(100), price INT)
ON CONFLICT (lesson_id) DO NOTHING;

--Copy lesson students data
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
