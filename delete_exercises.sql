USE codeup_test_db;
SELECT name AS 'The albums released after 1991' FROM albums WHERE release_date >1991;
DELETE FROM albums WHERE release_date >1991;

SELECT name AS 'The albums with the genre of Disco' FROM albums WHERE genre LIKE '%Disco%';
DELETE FROM albums WHERE genre LIKE '%Disco%';

SELECT name AS 'The name of all albums by Whitney Houston' FROM albums WHERE artist LIKE '%Whitney Houston%';
SELECT FROM albums WHERE artist LIKE '%Whitney Houston%';


