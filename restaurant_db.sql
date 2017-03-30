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
insert into restaurant values
	(default,'Chipotle', 0.1, 4, 'Mexican', 'Burrito', 't', '2017-03-27'),
	(default, 'Farm Burger', 0.1, 5, 'Burgers', 'Tres Leches Shake', 't', '2017-03-19'),
	(default, 'Wagaya', 8.7, 5, 'Japanese', 'Ramen', 'n', '2017-3-24'),
	(default, 'BarTaco', 5, 2, 'Mexican', 'Churro', 'n', '2017-03-22'),
	(default, 'Iron Age', 16.7, 5, 'Korean', 'Pork Belly', 'n', '2017-03-21'),
	(default, 'Fox Bros', 6.5, 5, 'BBQ', 'Frito Pie', 'y', '2017-01-30'),
	(default, 'NaanStop', 0.2, 4, 'Indian', 'Curry', 'y', '2017-02-05')

-- 	Write queries to get:
-- The names of the restaurants that you gave a 5 stars to
\! echo "5 star restaurant names:"
select name from restaurant where stars = 5;

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
select name from restaurant where last_time_eaten_there BETWEEN '1991-03-20' AND '2017-03-20';

-- restaurants you haven't ate at in the last week and has 5 stars
select name from restaurant where last_time_eaten_there BETWEEN  '1991-03-20' AND '2017-03-20' AND stars = '5';

-- list restaurants by the closest distance.
select * from restaurant order by distance;

-- list the top 2 restaurants by distance.
select * from restaurant order by distance limit 2;

-- list the top 2 restaurants by stars.
select * from restaurant order by stars desc limit 2;

-- list the top 2 restaurants by stars where the distance is less than 2 miles.
select * from restaurant where distance <=2 order by stars desc;

-- count the number of restaurants in the db.
select count(*) from restaurant;

-- count the number of restaurants by category.
select category, count(*) from restaurant group by category;

-- get the average stars per restaurant by category.
select category, avg(stars) from restaurant group by category;

-- get the max stars of a restaurant by category.
select category, max(stars) from restaurant group by category;






