USE albums_db;
SHOW tables;
SELECT 
    *
FROM
    albums;
-- albums	CREATE TABLE `albums` (
--   `id` int unsigned NOT NULL AUTO_INCREMENT,
--   `artist` varchar(240) DEFAULT NULL,
--   `name` varchar(240) NOT NULL,
--   `release_date` int DEFAULT NULL,
--   `sales` float DEFAULT NULL,
--   `genre` varchar(240) DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1

-- q3.
	-- a. How many rows are in the albums table? ------ 31
	-- b. How many unique artist names are in the albums table? ------23
SELECT 
    COUNT(DISTINCT artist)
FROM
    albums;

	-- c. What is the primary key for the albums table? ------ PRIMARY KEY (`id`)
	-- d. What is the oldest release date for any album in the albums table?
		-- What is the most recent release date? ------ the oldest: 1967; most recent: 2011
SELECT 
    MIN(release_date) AS oldest, MAX(release_date) AS mostrecent
FROM
    albums;
    
-- q4.
	-- a. The name of all albums by Pink Floyd
    -- The Dark Side of the Moon, The Wall
SELECT 
    name
FROM
    albums
WHERE
    artist = 'Pink Floyd';
   
   -- b. The year Sgt. Pepper's Lonely Hearts Club Band was released ------ 1967
SELECT 
    release_date
FROM
    albums
WHERE
    name = 'Sgt. Pepper\'s Lonely Hearts Club Band';
	
    -- c. The genre for the album Nevermind ------ Grunge, Alternative rock
SELECT 
    genre
FROM
    albums
WHERE
    name = 'Nevermind';
    
    -- d. Which albums were released in the 1990s
SELECT 
    name
FROM
    albums
WHERE
    1990 <= release_date < 2000;
    
	-- e. Which albums had less than 20 million certified sales
SELECT 
    name
FROM
    albums
WHERE
    sales < 20000000;
    
    -- f. All the albums with a genre of "Rock".
    -- Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT 
    name
FROM
    albums
WHERE
    genre = 'Rock';
    -- becauce we're looking for the exact match. 'Rock' <> 'Hard rock', 'Rock' <> 'Progressive rock'.
