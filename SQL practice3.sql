-- SUPER CRUD EXCERCISE

-- Creating a new Database
CREATE DATABASE shirts_db;

-- Using the database
USE shirts_db;

-- Creating a table named shirts
CREATE TABLE shirts (
    shirt_id INT AUTO_INCREMENT,
    article VARCHAR(30) NOT NULL DEFAULT 'Data Not Available',
    color VARCHAR(30) NOT NULL DEFAULT 'Data Not Available',
    shirt_size VARCHAR(30) NOT NULL DEFAULT 'Data Not Available',
    last_worn INT NOT NULL,
    PRIMARY KEY (shirt_id)
);

-- Describing the table
DESC shirts;

-- Inserting values into table
INSERT INTO shirts (article, color, shirt_size, last_worn) VALUES
	('t-shirt', 'white', 'S', 10),
	('t-shirt', 'green', 'S', 200),
	('polo shirt', 'black', 'M', 10),
	('tank top', 'blue', 'S', 50),
	('t-shirt', 'pink', 'S', 0),
	('polo shirt', 'red', 'M', 5),
	('tank top', 'white', 'S', 200),
	('tank top', 'blue', 'M', 15);
    
    
-- Selecting the table to view
SELECT * from shirts;

-- Inserting another row of shirt
INSERT INTO shirts (article, color, shirt_size, last_worn) VALUES ('polo shirt', 'purple', 'M', 50);

-- Selecting the table to view
SELECT * from shirts;

-- print out only the Article and color from the enitre set of shirts
SELECT article, color FROM shirts;

-- display all shirts except shirt_id for the medium shirts
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size = 'M';

-- Update all polo shirts to size L
UPDATE shirts SET shirt_size = 'L' WHERE article = 'polo shirt';

-- Selecting the table to view
SELECT * from shirts;

-- Update the shirt which was worn 15 days ago and make it 0
UPDATE shirts SET last_worn = 0 WHERE last_worn = 15;

-- Selecting the table to view
SELECT * from shirts;

-- Update all white shirts to size XS and color to off white
UPDATE shirts SET shirt_size = 'XS', color = 'off white' WHERE color = 'white';

-- Selecting the table to view
SELECT * from shirts;

-- Remove all the old shirts worn 200 days ago
DELETE FROM shirts WHERE last_worn = 200;

-- Selecting the table to view
SELECT * from shirts;

-- Remove all Tank Tops
DELETE FROM shirts WHERE article = 'tank top';

-- Selecting the table to view
SELECT * from shirts;

-- Deleting all the shirts
DELETE FROM shirts;

-- Selecting the table to view
SELECT * from shirts;

-- Describing shirts
DESC shirts;

-- Removing the table shirts
DROP TABLE shirts;

-- Selecting the table to view
SELECT * from shirts;

-- Dropping database
DROP DATABASE shirts_db;