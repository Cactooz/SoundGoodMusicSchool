--------
--SGMS--
--------

--Get all student rentals
SELECT * FROM student NATURAL JOIN rental;

--Get all instruments rentals
SELECT * FROM instrument AS i INNER JOIN rental AS r
ON i.instrument_id=r.instrument_id;

--Get student contact person
SELECT * FROM contact_person AS c INNER JOIN student AS s
ON s.contact_person_id=c.contact_person_id;

--Get all instruments an instructor teaches
SELECT i.first_name, i.last_name, p.instrument
FROM instructor AS i
INNER JOIN teaches_instrument AS t ON i.instructor_id=t.instructor_id
INNER JOIN instructor_instrument AS p ON p.instructor_instrument_id=t.instructor_instrument_id;

--Get all instruments an instructor teaches, simpler
SELECT i.first_name, i.last_name, p.instrument
FROM instructor AS i
NATURAL JOIN teaches_instrument 
NATURAL JOIN instructor_instrument AS p;

--Get two siblings names
SELECT s.first_name, s2.first_name
FROM student AS s
INNER JOIN sibling AS si ON s.student_id=si.student_id
INNER JOIN student AS s2 ON si.sibling_id=s2.student_id;

--Get two siblings names, simpler
SELECT s.first_name, s2.first_name
FROM student AS s
NATURAL JOIN sibling AS si
INNER JOIN student AS s2 ON si.sibling_id=s2.student_id;

--Get all instruments for each student
SELECT s.first_name, s.last_name, si.instrument, sl.skill_level
FROM student AS s
INNER JOIN student_skill AS ssk ON s.student_id=ssk.student_id
INNER JOIN student_instrument AS si ON ssk.student_instrument_id=si.student_instrument_id
INNER JOIN skill_level AS sl ON ssk.skill_level_id=sl.skill_level_id;

--Get all instruments for each student, simpler
SELECT s.first_name, s.last_name, si.instrument, sk.skill_level
FROM student AS s
NATURAL JOIN student_skill
NATURAL JOIN student_instrument AS si
NATURAL JOIN skill_level AS sk;

--Find a specific price_id
SELECT price_id FROM price_list
WHERE price_type_id=(SELECT price_type_id FROM price_type WHERE skill_level ILIKE 'beginner')
AND lesson_type_id=(SELECT lesson_type_id FROM lesson_type WHERE type ILIKE 'lesson');

--Find all bookings for each student
SELECT s.first_name, s.last_name, t.date, t.time, p.price, l.type
FROM student AS s
NATURAL JOIN booked_students
NATURAL JOIN timeslot AS t
NATURAL JOIN price_list AS p
NATURAL JOIN lesson_type AS l
ORDER BY s.first_name;
