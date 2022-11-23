---------
--ENUMS--
---------

INSERT INTO instrument_type (type) VALUES
('guitar'),
('piano'),
('flute'),
('drum'),
('trumpet'),
('bass'),
('saxophone');

INSERT INTO instructor_instrument (instrument) VALUES
('guitar'),
('piano'),
('flute'),
('drum'),
('trumpet'),
('bass'),
('saxophone');

INSERT INTO student_instrument (instrument) VALUES
('guitar'),
('piano'),
('flute'),
('drum'),
('trumpet'),
('bass'),
('saxophone');

INSERT INTO lesson_instrument (instrument) VALUES
('guitar'),
('piano'),
('flute'),
('drum'),
('trumpet'),
('bass'),
('saxophone');

INSERT INTO instrument_brand (name) VALUES
('Fender'),
('Ibanez'),
('Yamaha'),
('Stuart & Sons'),
('Tama'),
('Sonor'),
('Bach'),
('Gibson'),
('Selmer Paris');

INSERT INTO skill_level (skill_level) VALUES
('beginner'),
('intermediate'),
('advanced');

INSERT INTO lesson_skill_level (skill_level) VALUES
('beginner'),
('intermediate'),
('advanced');

INSERT INTO price_type (skill_level) VALUES
('beginner'),
('intermediate'),
('advanced');

INSERT INTO lesson_type (type) VALUES
('lesson'),
('group_lesson'),
('ensemble');

INSERT INTO price_list (price, pay, discount, price_type_id, lesson_type_id) VALUES
(250, 200, 10, 
(SELECT price_type_id FROM price_type WHERE skill_level ILIKE 'beginner'),
(SELECT lesson_type_id FROM lesson_type WHERE type ILIKE 'lesson')),
(250, 200, 10,
(SELECT price_type_id FROM price_type WHERE skill_level ILIKE 'intermediate'),
(SELECT lesson_type_id FROM lesson_type WHERE type ILIKE 'lesson')),
(400, 350, 10,
(SELECT price_type_id FROM price_type WHERE skill_level ILIKE 'advanced'),
(SELECT lesson_type_id FROM lesson_type WHERE type ILIKE 'lesson')),
(150, 300, 10, 
(SELECT price_type_id FROM price_type WHERE skill_level ILIKE 'beginner'),
(SELECT lesson_type_id FROM lesson_type WHERE type ILIKE 'group_lesson')),
(150, 300, 10, 
(SELECT price_type_id FROM price_type WHERE skill_level ILIKE 'intermediate'),
(SELECT lesson_type_id FROM lesson_type WHERE type ILIKE 'group_lesson')),
(200, 450, 10, 
(SELECT price_type_id FROM price_type WHERE skill_level ILIKE 'advanced'),
(SELECT lesson_type_id FROM lesson_type WHERE type ILIKE 'group_lesson')),
(200, 400, 10, null, (SELECT lesson_type_id FROM lesson_type WHERE type ILIKE 'ensemble'));

INSERT INTO instrument (id, cost, instrument_type_id, instrument_brand_id) VALUES
('ig001', 100,
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'guitar'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Fender')),
('ig002', 100, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'guitar'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Ibanez')),
('ig003', 150, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'guitar'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Ibanez')),
('ig004', 150, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'guitar'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Ibanez')),
('ig005', 150, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'guitar'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Yamaha')),
('ig006', 175, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'guitar'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Yamaha')),
('ig007', 175, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'guitar'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Yamaha')),
('ip001', 400, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'piano'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Yamaha')),
('ip002', 400, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'piano'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Yamaha')),
('ip003', 400, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'piano'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Yamaha')),
('ip004', 325, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'piano'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Stuart & Sons')),
('if001', 69, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'flute'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Yamaha')),
('id001', 425, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'drum'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Tama')),
('id002', 450, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'drum'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Sonor')),
('id003', 450, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'drum'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Sonor')),
('it001', 375, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'trumpet'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Bach')),
('it002', 375, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'trumpet'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Bach')),
('it003', 325, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'trumpet'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Yamaha')),
('ib001', 300, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'bass'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Fender')),
('ib002', 300, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'bass'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Fender')),
('ib003', 375, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'bass'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Gibson')),
('ib004', 350, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'bass'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Yamaha')),
('is001', 350, 
(SELECT instrument_type_id FROM instrument_type WHERE type ILIKE 'saxophone'),
(SELECT instrument_brand_id FROM instrument_brand WHERE name ILIKE 'Selmer Paris'));

INSERT INTO genre (name) VALUES
('pop'),
('rock'),
('jazz'),
('house'),
('country'),
('blues'),
('classic'),
('hip-hop'),
('metal');

----------
--TABLES--
----------
INSERT INTO contact_person (first_name, last_name, phone, email) VALUES
('Yoda', null, '0739663269', 'yoda@jedi.com'),
('Palpatine', null, '0734186737', 'palpatine@sith.galaxy'),
('Din', 'Djarin', '0708115231', 'thisisthe@way.com'),
('Kit', 'Fisto', '0718698364', 'fisto@jedi.com');

INSERT INTO student (personal_number, first_name, last_name, enrolled, phone, email, street, house, city, zip, contact_person_id) VALUES
('193010304933', 'Jar Jar', 'Binks', '1', '0754565165', 'jar.jar@binks.mesa', 'Hollow Ridge Crossing', 114, 'Naboo', 59825, (
	SELECT contact_person_id FROM contact_person WHERE first_name ILIKE 'Yoda'
)),
('193209039191', 'Babu', 'Frik', '1', '0774037020', 'babu@frik.com', 'Briar Crest Crossing', 209, 'Kijmi', 15555, null),
('194012169050', 'Grogu', null, '1', null, null, null, null, null, null, (
	SELECT contact_person_id FROM contact_person WHERE last_name ILIKE 'Djarin'
)),
('194512184765', 'Ahsoka', 'Tano', '1', '0776160471', 'ahsoka@jedi.com', 'Jana Parkway', 37, 'Shili', 88485, (
	SELECT contact_person_id FROM contact_person WHERE last_name ILIKE 'Djarin'
)),
('191605135217', 'Jango', 'Fett', '1', null, null, 'Green Ridge Point', 246, 'Concord Dawn', 69817, (
	SELECT contact_person_id FROM contact_person WHERE last_name ILIKE 'Fisto'
)),
('178202269174', 'Kuiil', null, '1', '0702988324', 'kuiil@has.spoken', 'Luster Drive', 75, 'Arvala-7', 65023, (
	SELECT contact_person_id FROM contact_person WHERE last_name ILIKE 'Djarin'
)),
('193611172804', 'Padme', 'Amidala', '1', '0772261802', 'padme@amidala.naboo', 'Pankratz Park', 147, 'Naboo', 64094, null),
('193011117656', 'Admiral', 'Ackbar', '1', null, null, 'John Wall Crossing', 196, 'Mon Cala', 15000, (
	SELECT contact_person_id FROM contact_person WHERE first_name ILIKE 'Yoda'
)),
('194910232992', 'Cassian', 'Andor', '1', null, 'cassa@rogue.one', 'Droid Road', 11, 'Kenari ', 81054, null),
('191010107991', 'Mace', 'Windu', '0', null, 'mace@purple.com', 'Purple Street', 201, 'Haruun Kal', 80173, null),
('192808016410', 'Darth', 'Maul', '0', '0368034485', null, 'Clemons Center', 105, 'Dathomir', 94515, (
	SELECT contact_person_id FROM contact_person WHERE first_name ILIKE 'Palpatine'
));

INSERT INTO instructor (personal_number, first_name, last_name, ensemble, phone, email, street, house, city, zip) VALUES
('196212147075', 'Luke', 'Skywalker', '1', '0713263827', 'luke@skywalker.ta', 'Farm Twon', 68, 'Tatooine', 77574),
('192502217611', 'Obi-Wan', 'Kenobi', '0', '0700123435', 'obi@jedi.com', 'Sand Village', 171, 'Stewjon', 22779),
('195003278578', 'Han', 'Solo', '1', '0762317000', 'nevertell@me.odds', 'Autumn Leaf', 157, 'Corellia', 19460),
('196212147083', 'Leia', 'Organa', '0', '0743212187', 'leia.organa@senate.co', 'Royal House', 1, 'Alderaan', 25139),
('194103276632', 'Darth', 'Vader', '0', '0701225984', 'chosen_one@sith.galaxy', 'Fortress Vader', 73, 'Mustafar', 98089);

INSERT INTO rental (id, start_date, end_date, student_id, instrument_id) VALUES
(1, '2021-11-11', '2022-11-10', 2, 8),
(2, '2021-01-23', '2022-07-29', 2, 2),
(3, '2022-03-17', '2023-03-17', 5, 21);

INSERT INTO sibling (student_id, sibling_id) VALUES
(3,4),
(4,3);

INSERT INTO student_skill (student_id, skill_level_id, student_instrument_id) VALUES
(1, (SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'beginner'),
(SELECT student_instrument_id FROM student_instrument WHERE instrument ILIKE 'trumpet')),
(2, (SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'intermediate'),
(SELECT student_instrument_id FROM student_instrument WHERE instrument ILIKE 'guitar')),
(2, (SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'advanced'),
(SELECT student_instrument_id FROM student_instrument WHERE instrument ILIKE 'piano')),
(3, (SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'beginner'),
(SELECT student_instrument_id FROM student_instrument WHERE instrument ILIKE 'drum')),
(3, (SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'beginner'),
(SELECT student_instrument_id FROM student_instrument WHERE instrument ILIKE 'bass')),
(4, (SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'intermediate'),
(SELECT student_instrument_id FROM student_instrument WHERE instrument ILIKE 'piano')),
(5, (SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'advanced'),
(SELECT student_instrument_id FROM student_instrument WHERE instrument ILIKE 'bass')),
(6, (SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'advanced'),
(SELECT student_instrument_id FROM student_instrument WHERE instrument ILIKE 'piano')),
(6, (SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'intermediate'),
(SELECT student_instrument_id FROM student_instrument WHERE instrument ILIKE 'trumpet')),
(6, (SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'advanced'),
(SELECT student_instrument_id FROM student_instrument WHERE instrument ILIKE 'guitar')),
(7, (SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'intermediate'),
(SELECT student_instrument_id FROM student_instrument WHERE instrument ILIKE 'guitar')),
(8, (SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'intermediate'),
(SELECT student_instrument_id FROM student_instrument WHERE instrument ILIKE 'flute')),
(8, (SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'beginner'),
(SELECT student_instrument_id FROM student_instrument WHERE instrument ILIKE 'trumpet'));

INSERT INTO teaches_instrument (instructor_id, instructor_instrument_id) VALUES
(1, (SELECT instructor_instrument_id FROM instructor_instrument WHERE instrument ILIKE 'flute')),
(1, (SELECT instructor_instrument_id FROM instructor_instrument WHERE instrument ILIKE 'trumpet')),
(2, (SELECT instructor_instrument_id FROM instructor_instrument WHERE instrument ILIKE 'drum')),
(2, (SELECT instructor_instrument_id FROM instructor_instrument WHERE instrument ILIKE 'bass')),
(2, (SELECT instructor_instrument_id FROM instructor_instrument WHERE instrument ILIKE 'guitar')),
(3, (SELECT instructor_instrument_id FROM instructor_instrument WHERE instrument ILIKE 'guitar')),
(3, (SELECT instructor_instrument_id FROM instructor_instrument WHERE instrument ILIKE 'bass')),
(4, (SELECT instructor_instrument_id FROM instructor_instrument WHERE instrument ILIKE 'piano')),
(5, (SELECT instructor_instrument_id FROM instructor_instrument WHERE instrument ILIKE 'drum')),
(5, (SELECT instructor_instrument_id FROM instructor_instrument WHERE instrument ILIKE 'piano'));

INSERT INTO timeslot (date, time, location, price_id, instructor_id) VALUES
('2022-12-20', '18:00', null,
(SELECT price_id FROM price_list WHERE lesson_type_id=
(SELECT lesson_type_id FROM lesson_type WHERE type ILIKE 'ensemble')), 3),
('2022-12-20', '18:00', null, null, 2),
('2023-01-11', '17:30', null,
(SELECT price_id FROM price_list WHERE lesson_type_id=
(SELECT lesson_type_id FROM lesson_type WHERE type ILIKE 'ensemble')), 1),
('2023-01-22', '17:00', null, null, 4),
('2023-01-22', '19:00', null, null, 4),
('2023-01-23', '16:15', null, null, 5);

INSERT INTO ensemble (min_students, max_students, timeslot_id, genre_id) VALUES
(3, 10, 1, (SELECT genre_id FROM genre WHERE name ILIKE 'jazz')),
(4, 8, 3, (SELECT genre_id FROM genre WHERE name ILIKE 'rock'));

INSERT INTO lesson (timeslot_id, lesson_skill_level_id, lesson_instrument_id) VALUES
(2, (SELECT lesson_skill_level_id FROM lesson_skill_level WHERE skill_level ILIKE 'beginner'),
(SELECT lesson_instrument_id FROM lesson_instrument WHERE instrument ILIKE 'bass')),
(6, (SELECT lesson_skill_level_id FROM lesson_skill_level WHERE skill_level ILIKE 'intermediate'), null);

INSERT INTO group_lesson (max_students, timeslot_id, lesson_skill_level_id, lesson_instrument_id) VALUES
(4, 4, (SELECT lesson_skill_level_id FROM lesson_skill_level WHERE skill_level ILIKE 'intermediate'),
(SELECT lesson_instrument_id FROM lesson_instrument WHERE instrument ILIKE 'piano')),
(3, 5, (SELECT lesson_skill_level_id FROM lesson_skill_level WHERE skill_level ILIKE 'advanced'),
(SELECT lesson_instrument_id FROM lesson_instrument WHERE instrument ILIKE 'piano'));

INSERT INTO booked_students (timeslot_id, student_id) VALUES
(1,2),
(1,3),
(1,1),
(3,6),
(3,8),
(3,5),
(3,4),
(3,2);
