USE codeup_test_db;


SELECT name AS 'All Albums' FROM albums;
UPDATE albums SET sales = sales*10;
SELECT * FROM albums;

SELECT name AS 'All Albums Released before 1990' FROM albums WHERE release_date <1990;
UPDATE albums SET release_date = release_date-100 WHERE release_date <1990 ;
SELECT * FROM albums;


SELECT name AS 'The name of all albums by Michael Jackson' FROM albums WHERE artist LIKE '%Michael Jackson%';
UPDATE albums SET artist = 'Peter Jackson' WHERE artist LIKE '%Michael Jackson%';
SELECT * FROM albums;
