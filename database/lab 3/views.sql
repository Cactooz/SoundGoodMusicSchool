--Number of lessons by month
CREATE VIEW all_lessons AS
SELECT EXTRACT(YEAR FROM date) AS year,
EXTRACT(MONTH FROM date) AS month,
COUNT(timeslot_id) AS total,
SUM(CASE WHEN timeslot_id IN (SELECT timeslot_id FROM individual_lesson) THEN 1 ELSE 0 END) AS individual,
SUM(CASE WHEN timeslot_id IN (SELECT timeslot_id FROM group_lesson) THEN 1 ELSE 0 END) AS group,
SUM(CASE WHEN timeslot_id IN (SELECT timeslot_id FROM ensemble) THEN 1 ELSE 0 END) AS ensemble
FROM timeslot
GROUP BY year, month
ORDER BY month;

--Get number of siblings
CREATE VIEW total_siblings AS
SELECT COUNT(*) AS students, siblings
FROM (SELECT student_id, SUM(CASE WHEN student_id IN (SELECT student_id FROM student) THEN 1 ELSE 0 END) AS siblings
FROM sibling GROUP BY student_id) AS x
GROUP BY siblings
UNION SELECT COUNT(*), 0
FROM student WHERE student_id
NOT IN (SELECT student_id from sibling)
ORDER BY siblings;
