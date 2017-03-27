CREATE TABLE restaurant (
	id serial PRIMARY KEY,
	name varchar,
	distance numeric,
	stars integer CHECK (stars <= 5),
	category varchar,
	favorite_dish varchar,
	does_takeout boolean,
	last_time_eaten_there date
);

-- Write INSERT statements to enter data into the restaurant table. You can paste the statements into the psql shell.
insert into restaurant values(default,'Chipotle', 0.1, 4, 'Mexican', 'Burrito', 't', '2017-03-27');
insert into restaurant values(default, 'Farm Burger', 0.1, 5, 'Burgers', 'Tres Leches Shake', 't', '2017-03-19');
insert into restaurant values(default, 'Wagaya', 8.7, 5, 'Japanese', 'Ramen', 'n', '2017-3-24');
insert into restaurant values(default, 'BarTaco', 5, 2, 'Mexican', 'Churro', 'n', '2017-03-22');
insert into restaurant values(default, 'Iron Age', 16.7, 5, 'Korean', 'Pork Belly', 'n', '2017-03-21');
insert into restaurant values(default, 'Fox Bros', 6.5, 5, 'BBQ', 'Frito Pie', 'y', '2017-01-30');
insert into restaurant values(default, 'NaanStop', 0.2, 4, 'Indian', 'Curry', 'y', '2017-02-05');

-- 	Write queries to get:
-- The names of the restaurants that you gave a 5 stars to
select name from restaurant where stars = '5';

-- The favorite dishes of all 5-star restaurants
select favorite_dish from restaurant;

-- The the id of a restaurant by a specific restaurant name, say 'NaanStop'
select id from restaurant where name = 'NaanStop';

-- restaurants in the category of 'BBQ'
select name from restaurant where category = 'BBQ';

-- restaurants that do take out
select name from restaurant where does_takeout = 'y';

-- restaurants that do take out and is in the category of 'BBQ'
select name from restaurant where does_takeout = 'y' and category = 'BBQ'; 

-- restaurants within 2 miles
select name from restaurant where distance <= 2;

-- restaurants you haven't ate at in the last week
select name from restaurant where last_time_eaten_there BETWEEN DATE '1991-03-20' AND DATE '2017-03-20';

-- restaurants you haven't ate at in the last week and has 5 stars
select name from restaurant where last_time_eaten_there BETWEEN DATE '1991-03-20' AND DATE '2017-03-20' AND stars = '5';








