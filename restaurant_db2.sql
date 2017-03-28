CREATE TABLE restaurant (
	id serial PRIMARY KEY,
	name varchar,
	address varchar,
	category varchar
);

CREATE TABLE reviewer (
	id serial PRIMARY KEY,
	name varchar,
	email varchar,
	karma integer CHECK (karma <= 7),
);

CREATE TABLE review (
	id serial PRIMARY KEY,
	reviewer_id integer REFERENCES reviewer (id),
	stars integer CHECK (stars <= 5),
	title varchar,
	review varchar,
	restaurant_id integer REFERENCES restaurant (id)
);

insert into restaurant values
	(default, 'Chipotle', '3424 Piedmont Rd NE, Atlanta, GA 30305', 'Mexican'),
	(default, 'Farm Burger', '3365 Piedmont Rd NE, Atlanta, GA 30305', 'Burgers'),
	(default, 'Wagaya', '339 14th St NW, Atlanta, GA 30318', 'Japanese'),
	(default, 'BarTaco', '3802 Roswell Rd NE, Atlanta, GA 30342', 'Mexican'),
	(default, 'Iron Age', '2131 Pleasant Hill Rd, Duluth, GA 30096', 'Korean'),
	(default, 'Fox Bros', '1238 DeKalb Ave NE, Atlanta, GA 30307', 'BBQ'),
	(default, 'NaanStop', '3420 Piedmont Rd NE, Atlanta, GA 30305', 'Indian')

insert into reviewer values 
	(default, 'Daniel B.', 'BigBoi_D_@gmail.com', 7),
	(default, 'Debra Lee', 'debramaelee@gmail.com', 5),
	(default, 'Sir Eats-A-Lot', 'ilovefood@food.com', 4),
	(default, 'Holly Smith', 'vegan_gurl@gmail.com', 2)

insert into review values
	-- DBs reviews
	(default, 1, 3, 'Quick and Filling', 'Great place for a quick lunch. Could use more variety of salsas and rice. Hit or miss because the guac can be soggy.', 1),
	(default, 1, 4, 'Nice Selection', 'The line moves faster than you think. Amazing selection of topping to customize your burger. The garlic fries are a must have.', 2),
	(default, 1, 5, 'Authentic Japanese Sushi', 'Sushi rolls and sashimi rolls are to die for. Fresh and tasty.', 3),
	(default, 1, 5, 'Hipster Tacos', 'Do not come here expecting authentic Mexican food. The drinks are fantastic.', 4),
	(default, 1, 5, 'AYCE Korean BBQ!', 'Wait is long but worth it. Amazing selection of meats for $25. Get the spicy pork bulgogi.', 5),
	(default, 1, 5, 'Best BBQ in Town', 'This is the best southern BBQ in the ATL. Great place to bring out-of-towners. Make sure to get the beef brisket and mac and cheese', 6),
	(default, 1, 3, 'Fast Food Indian', 'Kind of like an Indian-style chipotle where you can customize your order according to meat, toppings, and rice. Taste is OK but price is good', 7),
	
	--DL reviews
	(default, 2, 5, 'Best Ramen and Udon', 'This is my favorite spot for udon and ramen. Get the spicy tonkatsu ramen. It is spicy yet full of rich pork flavor.', 3),
	(default, 2, 1, 'Tiny Child Size Portions', 'The tacos and entrees here are not only TINY but they lack the proper taco toppings like cabbage, lettuce, or onions. The only redeeming food here are the chocolate dipped churros. They are pretty good.', 4),
	(default, 2, 5, 'Best Deal for AYCE KBBQ', 'Great selection of meats but could use more sides. Kimchi and rice are not default sides, which is kind of shocking. But cant argue because this is the best deal in town', 5),
	(default, 2, 4, 'Frito Pie', 'Get the Frito Pie, trust me!', 6),

	--vegans reviews
	(default, 4, 1, 'No Vegetarian Options', 'All this place has is meat. Meat is murder. BOO!', 5),
	(default, 4, 1, 'No Vegetarian Options', 'All this place has is meat. Meat is murder. BOO!', 6),
	(default, 4, 4, 'Plenty of choices', 'Great vegetarian options for people like me.', 7),
	(default, 4, 3, 'Only 2 vegetarian options', 'Only sofritas and cheese quesadilla which are just OK', 1),

	--Sir's reviews
	(default, 3, 5, 'YUMMY', 'I love food and this is food so it is good', 1),
	(default, 3, 5, 'DELICIOUS', 'I love food and this is food so it is good', 2),
	(default, 3, 5, 'MOUTH WATERING', 'I love food and this is food so it is good', 3),
	(default, 3, 5, 'SATISFYING', 'I love food and this is food so it is good', 4),
	(default, 3, 5, 'YUMMY IN MY BIG OLE TUMMY', 'I love food and this is food so it is good', 5),
	(default, 3, 5, 'SO FAT AND FULL', 'I love food and this is food so it is good', 6),
	(default, 3, 5, 'LOVE IT', 'I love food and this is food so it is good', 7)

-- List all the reviews for a given restaurant given a specific restaurant ID.
select * from review where restaurant_id = 1;
select * from review where restaurant_id = 2;
select * from review where restaurant_id = 3;
select * from review where restaurant_id = 4;
select * from review where restaurant_id = 5;
select * from review where restaurant_id = 6;
select * from review where restaurant_id = 7

-- List all the reviews for a given restaurant, given a specific restaurant name.
select * from review, restaurant where review.restaurant_id = restaurant.id AND restaurant.name = 'Chipotle';
select * from review, restaurant where review.restaurant_id = restaurant.id AND restaurant.name = 'Farm Burger';
select * from review, restaurant where review.restaurant_id = restaurant.id AND restaurant.name = 'Wagaya';
select * from review, restaurant where review.restaurant_id = restaurant.id AND restaurant.name = 'BarTaco';
select * from review, restaurant where review.restaurant_id = restaurant.id AND restaurant.name = 'Iron Age';
select * from review, restaurant where review.restaurant_id = restaurant.id AND restaurant.name = 'Fox Bros';
select * from review, restaurant where review.restaurant_id = restaurant.id AND restaurant.name = 'NaanStop';
--EQUIVALENT
select * from review inner join restaurant on review.restaurant_id = restaurant.id where restaurant.name = 'Chipotle';

-- List all the reviews for a given reviewer, given a specific author name.
select * from review, reviewer where review.reviewer_id = reviewer.id AND reviewer.name = 'Daniel B.';
select * from review, reviewer where review.reviewer_id = reviewer.id AND reviewer.name = 'Debra Lee';
select * from review, reviewer where review.reviewer_id = reviewer.id AND reviewer.name = 'Sir Eats-A-Lot';
select * from review, reviewer where review.reviewer_id = reviewer.id AND reviewer.name = 'Holly Smith';
--EQUIVALENT
select * from review inner join reviewer on review.reviewer_id = reviewer.id AND reviewer.name = 'Daniel B.';

-- List all the reviews along with the restaurant they were written for. In the query result, select the restaurant name and the review text.
select restaurant.name, review.review from review, restaurant where review.restaurant_id = restaurant.id;

-- Get the average stars by restaurant. The result should have the restaurant name and its average star rating.
select restaurant.name, avg(review.stars) from review, restaurant where review.restaurant_id = restaurant.id group by restaurant.id;

-- Get the number of reviews written for each restaurant. The result should have the restaurant name and its review count.
select restaurant.name, count(review.review) from review, restaurant where review.restaurant_id = restaurant.id group by restaurant.id;

-- List all the reviews along with the restaurant, and the reviewer's name. The result should have the restaurant name, the review text, and the reviewer name. Hint: you will need to do a three-way join - i.e. joining all three tables together.
select review.review, restaurant.name, reviewer.name 
from review, restaurant, reviewer
where review.restaurant_id = restaurant.id AND review.reviewer_id = reviewer.id;
--EQUIVALENT
select review.review, restaurant.name, reviewer.name 
from reviewer
inner join review on review.reviewer_id = review.id
inner join restaurant on review.restaurant_id = restaurant.id 


-- Get the average stars given by each reviewer. (reviewer name, average star rating)
select reviewer.name, avg(review.stars) from review, reviewer where review.reviewer_id = reviewer.id group by reviewer.name;


-- Get the lowest star rating given by each reviewer. (reviewer name, lowest star rating)
select reviewer.name, min(review.stars) from review, reviewer where review.reviewer_id = reviewer.id group by reviewer.name;

-- Get the number of restaurants in each category. (category name, restaurant count)
select restaurant.category, count(restaurant.category) from restaurant group by restaurant.category;

-- Get number of 5 star reviews given by restaurant. (restaurant name, 5-star count)
select restaurant.name, count(review.stars) from review, restaurant where review.restaurant_id = restaurant.id AND review.stars = 5 group by restaurant.name;

-- Get the average star rating for a food category. (category name, average star rating)
select restaurant.category, avg(review.stars) from review, restaurant where review.restaurant_id = restaurant.id group by restaurant.category;














