CREATE TABLE artist (
	id serial PRIMARY KEY,
	name varchar,

);

CREATE TABLE album (
	id serial PRIMARY KEY,
	artist varchar REFERENCES artist (id),
	year date

);

CREATE TABLE song (
	id serial PRIMARY KEY,
	writer varchar REFERENCES writer (id),
	name varchar
);

CREATE TABLE track (
	id serial PRIMARY KEY,
	album varchar REFERENCES album (id),
	song varchar REFERENCES song (id),
	duration numeric
);

CREATE TABLE writer (
	id serial PRIMARY KEY,
	name varchar
);

