
CREATE TABLE album (
	id serial PRIMARY KEY,
	name varchar,
	artist_id integer REFERENCES people (id),
	year date
);

CREATE TABLE song (
	id serial PRIMARY KEY,
	name varchar,
	writer_id integer REFERENCES people (id)
);

CREATE TABLE track (
	id serial PRIMARY KEY,
	album integer REFERENCES album (id),
	song integer REFERENCES song (id),
	duration numeric
);

CREATE TABLE people (
	id serial PRIMARY KEY,
	name varchar
);

insert into people values
	-- (default, 'person name')
	-- ARTISTS
	(default, 'Jacoo') 2
	(default, 'XI') 3
	(default, 'Nym') 4
	(default, 'Ed Harrison') 5
	(default, 'Nujabes') 6

	--WRITERS 
	(default, 'Jacoo Music') 7
	(default, 'Legit Liquid') 8
	(default, 'Beastly Mudkip') 9
	(default, 'Justin') 10
	(default, 'Konectt') 11

insert into song values 
	-- (default, 'song name', song key)
	(default, 'In the shadows... looking for a light', 7),
	(default, 'Breathe', 7),
	(default, 'Eternity', 7),
	(default, 'Dreamcatcher', 7),
	(default, 'Withering', 7),
	(default, 'Sunrise Plaza', 7),

	(default, 'Akasha', 8),
	(default, 'ADpiano', 8),
	(default, 'Vanitas', 8),
	(default, 'Agartha', 8),

	(default, 'Sleep', 9),
	(default, 'Duel at Diablo', 9),
	(default, 'Lesser Known Good', 9),
	(default, 'Thistle feat. Emancipato', 9),

	(default, 'Annul', 10),
	(default, 'Departure', 10),
	(default, 'Tin Soldiers', 10),
	(default, 'Scrap IO', 10),
	(default, 'Tachi', 10),
	(default, 'Automata', 10),
	(default, 'Imbrium', 10),

	(default, 'Yes ft Pase Rock', 11),
	(default, 'Another Reflection', 11),
	(default, 'Tsurugi No Mai', 11),
	(default, 'Lady Brown', 11),
	(default, 'Reflection Eternal', 11),
	(default, 'Counting Stars', 11);

insert into album values 
	-- (default, 'album name', artist key, date)
	 (default, 'Dark', 2, '1960-12-21'),
	 (default, 'Light', 2, '1965-7-14'),
	 (default, 'Water', 3, '1970-4-18'),
	 (default, 'Fire', 3, '1975-10-16'),
	 (default, 'Electric', 4, '1980-10-2'),
	 (default, 'Ground', 4, '1985-8-4'),
	 (default, 'Dragon', 5, '1990-6-3'),
	 (default, 'Steel', 5, '1995-3-5'),
	 (default, 'Fairy', 6, '1972-12-1'),
	 (default, 'Poison', 6, '1962-9-3');

insert into track values 
	-- (default, album key, song key, duration)
	(default, 1, 1, 2.34),
	(default, 1, 2, 2.15),
	(default, 1, 3, 2.20),
	(default, 1, 4, 2.58),
	(default, 2, 5, 2.39),
	(default, 2, 6, 3.18),
	(default, 2, 7, 3.56),
	(default, 2, 8, 3.00),
	(default, 3, 9, 3.50),
	(default, 3, 10, 3.40),
	(default, 3, 11, 4.28),
	(default, 3, 12, 4.08),
	(default, 4, 13, 4.52),
	(default, 4, 14, 4.30),
	(default, 4, 15, 4.53),
	(default, 5, 16, 4.30),
	(default, 5, 17, 5.16),
	(default, 6, 18, 5.38),
	(default, 6, 19, 5.42),
	(default, 7, 20, 5.43),
	(default, 7, 21, 5.34),
	(default, 8, 22, 1.32),
	(default, 8, 23, 1.52),
	(default, 9, 24, 1.56),
	(default, 9, 25, 6.22),
	(default, 10, 26, 6.04),
	(default, 10, 27, 6.08);

-- What are tracks for a given album?
select id from track where album = 1;

-- What are the albums produced by a given artist?
select * from album
where artist_id = 2;

-- What is the track with the longest duration?
select track.id, track.duration
from track
order by track.duration desc limit 1;

-- What are the albums released in the 60s? 70s? 80s? 90s?
select * 
from album
where year between '1960-01-01' AND '1970-01-01';
select * 
from album
where year between '1970-01-01' AND '1980-01-01';
select * 
from album
where year between '1980-01-01' AND '1990-01-01';
select * 
from album
where year between '1990-01-01' AND '2000-01-01';

-- How many albums did a given artist produce in the 90s?
select artist_id, count(*) 
from album 
where year between '1990-01-01' AND '2000-01-01' 
group by artist_id;

-- What is each artist's latest album?
select * from album
where year in 
(select distinct max(year) 
from album group by artist_id);

-- List all albums along with its total duration based on summing the duration of its tracks.
select album.name, sum(track.duration) as album_sum
from track, album
where album.id = track.album
group by album.name;

-- What is the album with the longest duration?
select album.name, sum(track.duration) as album_sum
from track, album
where album.id = track.album
group by album.name
order by album_sum desc limit 1;

-- Who are the 5 most prolific artists based on the number of albums they have recorded?
select people.name, count(album.id) as album_count
from album, people
where album.artist_id = people.id
group by people.name
order by album_count
desc limit 5;

-- What are all the tracks a given artist has recorded?
select track.id, album, artist_id, people.name
from track
full outer join album
on track.album = album.id 
full outer join people
on album.artist_id = people.id
where artist_id = 2

-- What are the top 5 most often recorded songs?

-- Who are the top 5 song writers whose songs have been most often recorded?
select people.name, count(song.id) as songs
from song, people
where song.writer_id = people.id
group by people.name
order by songs desc limit 5;

-- Who is the most prolific song writer based on the number of songs he has written?
select people.name, count(song.id) as songs
from song, people
where song.writer_id = people.id
group by people.name
order by songs desc limit 1;

-- What songs has a given artist recorded?


-- Who are the song writers whose songs a given artist has recorded?
-- Who are the artists who have recorded a given song writer's songs?

