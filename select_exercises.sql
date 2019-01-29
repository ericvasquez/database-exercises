USE codeup_test_db;

SELECT name AS 'The name of all albums by Pink Floyd' FROM albums WHERE artist LIKE '%Pink Floyd%';

SELECT release_date AS 'The year Sgt. Pepper''s Lonely Hearts Club Band was released' FROM albums WHERE name LIKE '%Sgt. Pepper''s Lonely Hearts Club Band%';

SELECT genre AS 'The genre for Nevermind' FROM albums WHERE name LIKE '%Nevermind%';

SELECT name AS 'The albums released in the 1990s' FROM albums WHERE release_date BETWEEN 1990 AND 1999;

SELECT name AS 'The albums that had less than 20 million certified sales' FROM albums WHERE sales <= 20;

SELECT name AS 'The albums with the genre of Rock' FROM albums WHERE genre LIKE '%Rock%';
