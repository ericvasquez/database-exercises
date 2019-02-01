DROP DATABASE IF EXISTS adlister_db;
create database if not exists adlister_db;
use adlister_db;

drop table if exists categories;
CREATE TABLE if not exists categories (
     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
     name VARCHAR(50) NOT NULL,
     primary key (id)
);

INSERT INTO categories (name)
VALUES ('Give Away');
INSERT INTO categories (name)
VALUES ('Help Wanted');
INSERT INTO categories (name)
VALUES ('Job Seeking');


 drop table if exists  users;
CREATE TABLE if not exists users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email  VARCHAR(100) NOT NULL,
    primary key (id)
);

INSERT INTO users (name, password, email)
VALUES ('Osmosis_Jones', 'fyre-sauce','ojones@example.com'),
       ('Rick_Flair', 'natureboy','natureboy@wcw.com'),
       ('Rey_Mysterio', 'reymist','mistermisty@wcw.com'),
       ('James_McMurder', 'pleadthefifth','fordranger@emptyapartment.com');

drop table if exists posts;
CREATE TABLE if not exists posts (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INTEGER UNSIGNED NOT NULL,
    title VARCHAR(50) NOT NULL,
    category INTEGER UNSIGNED NOT NULL,
    date DATE NOT NULL,
    description TEXT NOT NULL,
    primary key (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (category) REFERENCES categories(id)
);

INSERT INTO posts (user_id, title, category, date, description)
VALUES (1, 'Antibodies and Viral Pathogens',1, curdate(), 'Sometimes, we get sick. Sometimes we need help getting sick. Get sick with me. Osmosis Jones');
INSERT INTO posts (user_id, title, category, date, description)
VALUES (4, 'Cooking with Exotic Meats', 2, curdate(), 'So I have a freezer full of... well, let\'s call them pork chops. Not sure how to cook them. Help wanted. No cell phones.');
INSERT INTO posts (user_id, title, category, date, description)
VALUES(4, 'Freelance Deadlifter', 3, curdate(), 'You ever see someone deadlift with perfect form? The human body is a beautiful thing. I do bachelorette parties and children\'s birthday parties. Call me. No pictures.');


# For a given ad, what is the email address of the user that created it?
select users.name, email
from users
JOIN posts ON posts.user_id = users.id
where posts.id = 3;

# For a given ad, what category, or categories, does it belong to?
select posts.id, posts.title, categories.name
from posts
JOIN categories ON categories.id = posts.id
where posts.id = 3;

# For a given category, show all the ads that are in that category.
select posts.title AS ' Post Title ', categories.name AS Category
from posts
JOIN categories on categories.id = posts.id
where posts.category = 3;

# For a given user, show all the ads they have posted.
select users.name, posts.date, posts.title, categories.name, posts.description
from users
JOIN posts ON posts.user_id = users.id
JOIN categories ON categories.id = posts.id
where posts.user_id = 4;
