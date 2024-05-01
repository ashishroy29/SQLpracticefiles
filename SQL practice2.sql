-- Introducing CRUD (Create, Read, Update and Delete)
-- These are actions which can be performed for individual rows of data
-- We know how to insert data into the table (This is the 'C')

-- Creating new database
CREATE DATABASE cats;
-- This statement creates a new database named 'cats'.

USE cats;
-- This statement selects the 'cats' database for use in the subsequent statements.

-- Creating a table in the database
CREATE TABLE cats (
  cat_id INT AUTO_INCREMENT,
  name VARCHAR(100),
  breed VARCHAR(100),
  age INT,
  PRIMARY KEY (cat_id)
);
-- This statement creates a new table named 'cats' with columns 'cat_id' (auto-incrementing primary key), 'name', 'breed', and 'age'.

-- Inserting values into database
INSERT INTO cats(name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
-- This statement inserts multiple rows of data into the 'cats' table with values for the 'name', 'breed', and 'age' columns.

-- Selecting the table cats
SELECT *
FROM cats;
-- This statement selects and displays all rows and columns from the 'cats' table.

-- Describing Cats Table
DESC cats;
-- This statement describes the structure of the 'cats' table, showing the column names, data types, and other information.

-- R = 'Read' (Nothing but selecting, retrieving the information.)
SELECT name
FROM cats;
-- This statement selects and displays only the 'name' column from the 'cats' table.

SELECT MAX(age)
FROM cats;
-- This statement selects and displays the maximum value in the 'age' column from the 'cats' table.

SELECT name, age
FROM cats;
-- This statement selects and displays the 'name' and 'age' columns from the 'cats' table.

SELECT name, breed
FROM cats;
-- This statement selects and displays the 'name' and 'breed' columns from the 'cats' table.

-- WHERE clause (it can be used to update and delete as well)
SELECT *
FROM cats
WHERE age = 4;
-- This statement selects and displays all columns from the 'cats' table where the 'age' column is equal to 4.

SELECT name, age
FROM cats
WHERE age = 4 AND breed = 'Tabby';
-- This statement selects and displays the 'name' and 'age' columns from the 'cats' table where the 'age' is 4 and the 'breed' is 'Tabby'.

SELECT *
FROM cats;
-- This statement selects and displays all rows and columns from the 'cats' table.

SELECT name
FROM cats
WHERE age = 4;
-- This statement selects and displays the 'name' column from the 'cats' table where the 'age' is 4.

SELECT *
FROM cats
WHERE name = 'Egg';
-- This statement selects and displays all columns from the 'cats' table where the 'name' is 'Egg'.

SELECT cat_id
FROM cats;
-- This statement selects and displays the 'cat_id' column from the 'cats' table.

SELECT name, breed
FROM cats;
-- This statement selects and displays the 'name' and 'breed' columns from the 'cats' table.

SELECT name, age
FROM cats
WHERE breed = 'Tabby';
-- This statement selects and displays the 'name' and 'age' columns from the 'cats' table where the 'breed' is 'Tabby'.

SELECT cat_id, age
FROM cats
WHERE cat_id = age;
-- This statement selects and displays the 'cat_id' and 'age' columns from the 'cats' table where the 'cat_id' is equal to the 'age'.

-- Aliases
SELECT cat_id AS id, name
FROM cats;
-- This statement selects and displays the 'cat_id' column as 'id' and the 'name' column from the 'cats' table.

SELECT name AS kittyname
FROM cats;
-- This statement selects and displays the 'name' column as 'kittyname' from the 'cats' table.

-- Updating selected rows in a table or altering selected rows in the table. (UPDATE AND SET is a pair)
-- We are trying to say 2 things here: what are we trying to update and which row are we trying to update or performing the update.
SELECT *
FROM cats;
-- This statement selects and displays all rows and columns from the 'cats' table.

USE cats;
-- This statement selects the 'cats' database for use in the subsequent statements.

UPDATE cats
SET age = 14
WHERE name = 'Misty';
-- This statement updates the 'age' column to 14 for the row(s) where the 'name' is 'Misty' in the 'cats' table.

UPDATE cats
SET breed = 'Shorthair'
WHERE breed = 'Tabby';
-- This statement updates the 'breed' column to 'Shorthair' for the row(s) where the 'breed' is 'Tabby' in the 'cats' table.

-- Rule of thumb, first select everything and then update
UPDATE cats SET name = 'jack' WHERE name = 'jackson';
-- This statement updates the 'name' column to 'jack' for the row(s) where the 'name' is 'jackson' in the 'cats' table.

UPDATE cats SET breed = 'British Shorthair' WHERE name = 'Ringo';
-- This statement updates the 'breed' column to 'British Shorthair' for the row(s) where the 'name' is 'Ringo' in the 'cats' table.

UPDATE cats SET age = 12 WHERE breed = 'Maine Coon';
-- This statement updates the 'age' column to 12 for the row(s) where the 'breed' is 'Maine Coon' in the 'cats' table.

SELECT *
FROM cats;
-- This statement selects and displays all rows and columns from the 'cats' table.

-- Delete function
DELETE FROM cats WHERE name = 'Egg';
-- This statement deletes the row(s) where the 'name' is 'Egg' from the 'cats' table.

DELETE FROM cats WHERE cat_id=age;
-- This statement deletes the row(s) where the 'cat_id' is equal to the 'age' from the 'cats' table.

DELETE FROM cats;
-- This statement deletes all rows from the 'cats' table.