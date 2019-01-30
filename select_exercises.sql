USE codeup_test_db;



SELECT  'The name of all albums by Pink Floyd' AS 'Album Name';
SELECT name
FROM albums
WHERE artist LIKE '%Pink Floyd%';


SELECT 'The year Sgt. Pepper''s Lonely Hearts Club Band was released' AS 'Year';
SELECT release_date
FROM albums
WHERE name LIKE '%Sgt. Pepper''s Lonely Hearts Club Band%';

SELECT 'The genre for Nevermind' AS 'Genre';
SELECT genre
FROM albums
WHERE name LIKE '%Nevermind%';

SELECT 'The albums released in the 1990s' AS 'Album Name';
SELECT name
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;

SELECT 'The albums that had less than 20 million certified sales' AS 'AlbumName';
SELECT name
FROM albums
WHERE sales <= 20;

SELECT 'The albums with the genre of Rock' AS 'Album Name';
SELECT name
FROM albums
WHERE genre LIKE '%Rock%';
