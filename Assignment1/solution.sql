CREATE TABLE users (userid INT PRIMARY KEY, 
					name TEXT not null);

CREATE TABLE movies (movieid INT PRIMARY KEY, 
					 name TEXT not null);

CREATE TABLE taginfo (tagid INT PRIMARY KEY,
					  content TEXT UNIQUE);

CREATE TABLE genres (genreid INT PRIMARY KEY,
					 name TEXT UNIQUE);

CREATE TABLE ratings (userid INT REFERENCES users(userid),
					  movieid INT REFERENCES movies(movieid),
					  rating NUMERIC check (0 <= rating and 5 >= rating),
					  timestamp BIGINT,
					  PRIMARY KEY (userid, movieid));

CREATE TABLE tags (userid INT REFERENCES users(userid),
				   movieid INT REFERENCES movies(movieid),
				   tagid INT REFERENCES taginfo(tagid),
				   timestamp BIGINT,
				   PRIMARY KEY (userid, movieid, tagid));

CREATE TABLE hasagenre (movieid INT REFERENCES movies(movieid),
						genreid INT REFERENCES genres(genreid),
						PRIMARY KEY (movieid, genreid));