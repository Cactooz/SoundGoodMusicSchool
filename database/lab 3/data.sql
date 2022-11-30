---------
--ENUMS--
---------

INSERT INTO instrument (instrument) VALUES
('guitar'),
('piano'),
('flute'),
('drum'),
('trumpet'),
('bass'),
('saxophone');

INSERT INTO instrument_brand (brand_name) VALUES
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

INSERT INTO lesson_type (lesson_type) VALUES
('lesson'),
('group_lesson'),
('ensemble');

INSERT INTO price_list (price, pay, discount, skill_level_id, lesson_type_id) VALUES
(250, 200, 10, 
(SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'beginner'),
(SELECT lesson_type_id FROM lesson_type WHERE lesson_type ILIKE 'lesson')),
(250, 200, 10,
(SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'intermediate'),
(SELECT lesson_type_id FROM lesson_type WHERE lesson_type ILIKE 'lesson')),
(400, 350, 10,
(SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'advanced'),
(SELECT lesson_type_id FROM lesson_type WHERE lesson_type ILIKE 'lesson')),
(150, 300, 10, 
(SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'beginner'),
(SELECT lesson_type_id FROM lesson_type WHERE lesson_type ILIKE 'group_lesson')),
(150, 300, 10, 
(SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'intermediate'),
(SELECT lesson_type_id FROM lesson_type WHERE lesson_type ILIKE 'group_lesson')),
(200, 450, 10, 
(SELECT skill_level_id FROM skill_level WHERE skill_level ILIKE 'advanced'),
(SELECT lesson_type_id FROM lesson_type WHERE lesson_type ILIKE 'group_lesson')),
(200, 400, 10, null, (SELECT lesson_type_id FROM lesson_type WHERE lesson_type ILIKE 'ensemble'));

INSERT INTO physical_instrument (id, cost, instrument_id, instrument_brand_id) VALUES
('ig001', 100,
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'guitar'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Fender')),
('ig002', 100, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'guitar'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Ibanez')),
('ig003', 150, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'guitar'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Ibanez')),
('ig004', 150, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'guitar'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Ibanez')),
('ig005', 150, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'guitar'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Yamaha')),
('ig006', 175, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'guitar'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Yamaha')),
('ig007', 175, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'guitar'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Yamaha')),
('ip001', 400, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'piano'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Yamaha')),
('ip002', 400, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'piano'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Yamaha')),
('ip003', 400, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'piano'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Yamaha')),
('ip004', 325, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'piano'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Stuart & Sons')),
('if001', 69, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'flute'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Yamaha')),
('id001', 425, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'drum'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Tama')),
('id002', 450, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'drum'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Sonor')),
('id003', 450, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'drum'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Sonor')),
('it001', 375, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'trumpet'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Bach')),
('it002', 375, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'trumpet'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Bach')),
('it003', 325, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'trumpet'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Yamaha')),
('ib001', 300, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'bass'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Fender')),
('ib002', 300, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'bass'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Fender')),
('ib003', 375, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'bass'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Gibson')),
('ib004', 350, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'bass'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Yamaha')),
('is001', 350, 
(SELECT instrument_id FROM instrument WHERE instrument ILIKE 'saxophone'),
(SELECT instrument_brand_id FROM instrument_brand WHERE brand_name ILIKE 'Selmer Paris'));

INSERT INTO genre (genre) VALUES
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

