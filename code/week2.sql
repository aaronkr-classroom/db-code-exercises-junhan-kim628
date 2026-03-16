CREATE DATABASE ut;

CREATE TABLE animals(
	id bigserial,
	name varchar(20),
	age integer,
	kind varchar(20),
	dob date,
	location varchar(50)
);

TABLE animals; -- SELECT * FROM animals;

INSERT INTO animals (name, age, kind, dob, location)
VALUES ('Cat', 		45, 'tiger',	'2010-10-10', 'Seoul, Korea'),
	   ('Pooh', 	13, 'bear', 	'1931-01-03', 'England'),
	   ('Togo', 	13, 'dog', 		'1987-12-13', 'Alaska, USA'),
	   ('Jasper', 	12, 'dog', 		'2014-05-13', 'USA');
