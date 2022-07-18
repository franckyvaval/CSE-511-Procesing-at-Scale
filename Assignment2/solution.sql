CREATE TABLE query1 AS 
SELECT g.name, COUNT(*) AS moviecount
FROM hasagenre
JOIN genres g USING (genreid)
GROUP BY name;

CREATE TABLE query2 AS
SELECT g.name AS name, AVG(rating) AS rating
FROM movies m
JOIN hasagenre USING (movieid)
JOIN genres g USING (genreid)
JOIN ratings r USING (movieid)
GROUP BY g.name;

CREATE TABLE query3 AS
SELECT m.name AS title, COUNT(*) AS countofratings
FROM movies m
JOIN ratings r USING (movieid)
GROUP BY m.name
HAVING COUNT(*) > 9;

CREATE TABLE query4 AS 
SELECT m.movieid AS movieid, m.name AS title
FROM movies m
JOIN hasagenre h USING (movieid)
JOIN genres g USING (genreid)
WHERE g.name = 'Comedy';

CREATE TABLE query5 AS
SELECT m.name AS title, AVG(rating) AS average
FROM movies m
JOIN ratings r USING (movieid)
GROUP BY m.name;

CREATE TABLE query6 AS
SELECT AVG(r.rating) AS average
FROM movies m
JOIN ratings r USING (movieid)
JOIN hasagenre h USING (movieid)
JOIN genres g USING (genreid)
WHERE g.name = 'Comedy';

CREATE TABLE query7 AS
SELECT AVG(r.rating) AS average
FROM ratings r
JOIN (SELECT movieid
	  FROM movies m
	  	JOIN hasagenre h USING (movieid)
	  	JOIN genres g USING (genreid)
	  	WHERE g.name IN ('Comedy', 'Romance')
	  	GROUP BY m.movieid
	  	HAVING COUNT(*) = 2) sub
USING (movieid);

CREATE TABLE query8 AS
SELECT AVG(r.rating) AS average
FROM ratings r
JOIN (SELECT movieid
	  FROM movies m 
	  JOIN hasagenre h USING (movieid)
	  JOIN genres g USING (genreid)
	  WHERE g.name in ('Comedy', 'Romance')
	  GROUP BY m.movieid
	  HAVING array_agg(g.name) = '{Romance}') sub
USING (movieid);

CREATE TABLE query9 AS
SELECT movieid, rating
FROM ratings
WHERE ratings.userid = :v1;



























































