-- Creating a new database named 'friendss'
CREATE DATABASE friendss;

-- Switching to the 'friendss' database
USE friendss;

-- Creating a table 'friends' with a column 'name' of type VARCHAR with a maximum length of 10 characters
CREATE TABLE friends (name VARCHAR(10));

-- Inserting records into the 'friends' table
INSERT INTO friends (name) VALUES ('tom'), ('juan pable'), ('james');

-- Selecting all records from the 'friends' table
SELECT * FROM friends;
-- Here, all names are under 10 characters

-- Creating a table 'states' with a column 'abbr' of type CHAR with a fixed length of 2 characters
CREATE TABLE states (abbr CHAR(2));

-- Inserting records into the 'states' table
INSERT INTO states (abbr) VALUES ('CA'),('NY');

-- Attempting to insert a value ('x') longer than the specified length into the 'states' table
INSERT INTO states (abbr) VALUES ('x');
-- This will result in an error: Data too long for column abbr

-- Attempting to insert a value ('asdjsadasdsdasd') longer than the specified length into the 'friends' table
INSERT INTO friends (name) VALUES ('asdjsadasdsdasd');
-- This will result in an error: Data too long for column name

-- Dropping the 'parent' table if it exists
DROP TABLE IF EXISTS parent;

-- Creating a table 'parent' with a column 'children' of type TINYINT
CREATE TABLE parent (children TINYINT);

-- Inserting records into the 'parent' table
INSERT INTO parent (children) VALUES (2), (7), (0);

-- Attempting to insert a value (200) larger than the range allowed for TINYINT into the 'parent' table
INSERT INTO parent (children) VALUES (200);
-- This will result in an error: Out of range value for column 'children'

-- Dropping the 'parent' table if it exists
DROP TABLE IF EXISTS parent;

-- Creating an unsigned 'parent' table with a column 'children' of type TINYINT UNSIGNED
CREATE TABLE parent (children TINYINT UNSIGNED);

-- Attempting to insert a negative value (-1) into the 'parent' table
INSERT INTO parent (children) VALUES (-1);
-- This will result in an error: Out of range value for column 'children'

-- Creating a table 'products' with a column 'price' of type DECIMAL(5,2)
CREATE TABLE products (price DECIMAL (5,2));

-- Inserting records into the 'products' table
INSERT INTO products (price) VALUES (4.50);

-- Selecting all records from the 'products' table
SELECT * FROM products;

-- Attempting to insert a value (456.99) larger than the range allowed for DECIMAL(5,2) into the 'products' table
INSERT INTO products (price) VALUES (456.99);
-- This will result in an error: Out of range value for column 'price'

-- Attempting to insert a value (8345.2) with more decimal places than allowed into the 'products' table
INSERT INTO products (price) VALUES (8345.2);
-- This will give a warning: Data truncated for column 'price'

-- Selecting all records from the 'products' table
SELECT * FROM products;

-- Creating a table 'nums' with columns 'X' of type FLOAT and 'y' of type DOUBLE
CREATE TABLE nums (X FLOAT, y DOUBLE);

-- Inserting records into the 'nums' table
INSERT INTO nums (x,y) VALUES (1.123, 1.123);

-- Selecting all records from the 'nums' table
SELECT * FROM nums;

-- Inserting a value (1.12345678) with more precision than allowed into the 'nums' table
INSERT INTO nums (x,y) VALUES (1.12345678, 1.12345678);

-- Selecting all records from the 'nums' table
SELECT * FROM nums;

-- Inserting a value (1.12345678) with more precision than allowed into the 'nums' table
INSERT INTO nums (x,y) VALUES (1.12345678, 1.1234567834343434343);

-- Selecting all records from the 'nums' table
SELECT * FROM nums;

-- Creating a table 'people' with columns 'name', 'birthdate', 'birthtime', and 'birthdt' of various date and time data types
CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME);

-- Inserting records into the 'people' table
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES ('Elton', '2000-12-23', '11:00:00','2000-12-23 11:00:00');

-- Selecting all records from the 'people' table
SELECT * FROM people;

-- Inserting more records into the 'people' table
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES ('Lulu', '1985-04-11', '9:45:10','1985-04-11 9:45:10');
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES ('Juan', '2020-08-15', '23:59:00','2020-08-15 23:59:00');

-- Selecting all records from the 'people' table
SELECT * FROM people;

-- Inserting a record into the 'people' table with current date and time
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES ('Hazel', CURDATE(), CURTIME(), NOW());

-- Selecting all records from the 'people' table
SELECT * FROM people;

-- Demonstrating various date and time functions
SELECT birthdate, DAY(birthdate), DAYOFWEEK(birthdate), DAYOFYEAR(birthdate) FROM people;
SELECT birthdate, MONTHNAME(birthdate) FROM people;
SELECT birthdate, WEEK(birthdate) FROM people;
SELECT birthtime, MONTHNAME(birthtime) FROM people;
SELECT birthtime, YEAR(birthtime) FROM people;
SELECT name, birthdt, YEAR(birthdt), MONTHNAME(birthdt) FROM people;
SELECT name, birthtime, HOUR(birthtime) FROM people;
SELECT name, birthtime, MINUTE(birthtime) FROM people;
SELECT name, birthtime, SECOND(birthtime) FROM people;
SELECT birthdt, HOUR(birthdt) FROM people;
SELECT birthdt, DATE(birthdt), TIME(birthdt) FROM people;

-- Formatting date and time using DATE_FORMAT function
SELECT CONCAT(MONTHNAME(birthdate), ' ' , DAY(birthdate) , ' ', YEAR(birthdate)) FROM people;
SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;
SELECT birthdt, DATE_FORMAT(birthdt, '%H %i') FROM people;
SELECT birthdt, DATE_FORMAT(birthdt, '%r') FROM people;
SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON : %r') FROM people;

-- Calculating the number of days between birthdate and current date
SELECT birthdate, DATEDIFF(CURDATE() , birthdate) FROM people;
SELECT birthdt, DATEDIFF(CURDATE() , birthdt) FROM people;

-- Adding and subtracting dates using DATE_ADD and DATE_SUB functions
SELECT DATE_ADD(CURDATE(), INTERVAL 1 YEAR);
SELECT DATE_SUB(CURDATE(), INTERVAL 1 MONTH);
SELECT birthdate, DATE_ADD(birthdate, INTERVAL 18 YEAR) FROM people;

-- Demonstrating TIMESTAMP data type
SELECT TIMESTAMP('2022-10-05 17:53:28');

-- Creating a table 'captions' with a column 'created_at' having default value as current timestamp
CREATE TABLE captions(
text VARCHAR(150),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

-- Inserting records into the 'captions' table
INSERT INTO captions (text) VALUES ('just mekasdasdas'), ('beautiful');

-- Selecting all records from the 'captions' table
SELECT * FROM captions;

-- Creating a table 'captions2' with columns 'created_at' and 'updated_at' having default and auto-update values as current timestamp
CREATE TABLE captions2(
text VARCHAR(150),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

-- Inserting records into the 'captions2' table
INSERT INTO captions2 (text) VALUES ('i love life');

-- Selecting all records from the 'captions2' table
SELECT * FROM captions2;

-- Updating records in the 'captions2' table to demonstrate auto-update of 'updated_at' timestamp
UPDATE captions2 SET text = 'i love lifeeee';
UPDATE captions2 SET text = 'i love lifeeee!!!!!!!!!!!!';

-- Creating a table 'inventory' for managing inventory items
CREATE TABLE inventory(
	item_name VARCHAR(150),
    price DECIMAL(8,2),
    quantity INT);

-- Creating a table 'tweets' for storing tweets with username and creation timestamp
CREATE TABLE tweets(
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);

-- Inserting records into the 'tweets' table
INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');

-- Selecting all records from the 'tweets' table
SELECT * FROM tweets;

-- Inserting another record into the 'tweets' table
INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');

-- Selecting all records from the 'tweets' table
SELECT * FROM tweets;
