--------
--IMDB--
--------

--The amount of shows that have between 50 and 100 episodes
SELECT COUNT(*) FROM (SELECT show_title_id, COUNT(*) FROM episodes
GROUP BY show_title_id HAVING COUNT(*) >= 50 AND COUNT(*) < 100) AS s;

--Get worst rated Action,Comedy title
SELECT t.original_title, r.rating FROM ratings AS r INNER JOIN titles AS t
ON t.title_id = r.title_id WHERE t.genres='Action,Comedy'
ORDER BY r.rating LIMIT 1;

--Get the lowest rating ordered by most votes
SELECT title_id, rating, votes FROM ratings WHERE rating=1 ORDER BY votes DESC;

--Get the average rating of every movie with over 500000 votes
SELECT AVG(rating) FROM ratings WHERE votes >= 500000;

--Get amount of roles a person had in a title
SELECT person_id, title_id, COUNT(*)
AS count FROM crew
GROUP BY person_id, title_id
ORDER BY count DESC
LIMIT 10;

--Get movies where Samuel L. Jackson is an actor, newest first
SELECT t.original_title, t.premiered FROM titles AS t
INNER JOIN crew AS c ON t.title_id=c.title_id
INNER JOIN people AS p ON c.person_id=p.person_id
WHERE t.type='movie' AND p.name='Samuel L. Jackson' AND c.category='actor'
ORDER by t.premiered DESC;

--Top rated movies
SELECT t.primary_title, r.rating FROM titles AS t
INNER JOIN ratings AS r ON t.title_id=r.title_id
ORDER BY r.rating DESC LIMIT 25;
