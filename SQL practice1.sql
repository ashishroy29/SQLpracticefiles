-- Using the data base
USE petshop;

-- Creating table named cats
CREATE TABLE cats(
	name varchar(50),
    age int
);

-- To check the table
DESC cats; 

-- Inserting values into table 

-- First Cat 
INSERT INTO cats(name, age) VALUES ("Blue Steele", 5);

-- Second Cat 
INSERT INTO cats(name, age) VALUES ("Jenkins", 7);

-- Selecting the table
SELECT * FROM cats;

-- Selecting particular rows in the table
SELECT * FROM cats WHERE name = "Jenkins"; 

-- Here we can see that the order what we are putting the data in doesn't matter, Its onlt the right data should be inserted in that order.
INSERT INTO cats(age, name) VALUES (2, "Beth"); 

-- Selecting the table
SELECT * FROM cats;

-- what happens if we put incorrect data into the order
INSERT INTO cats(name, age) VALUES (9,"Ashish");
-- Here it gives an error stating that In-correct integer value has been provided. (These are rules and not guidelines)

-- Selecting the table
SELECT * FROM cats;

-- Multiple Inserts
INSERT INTO cats(name, age)
VALUES ("Meatball",5),
("Turkey",1),
("Potato Face",15);

-- Selecting the table
SELECT * FROM cats;

-- EXCERCISE No 1
-- Creating table named people
CREATE TABLE people(
	first_name varchar(20),
	last_name varchar(20),
	age int);

-- Inserting data into the table
INSERT INTO people(
	first_name,
    last_name,
    age)
		VALUES (
        "Tina",
        "Belcher",
        13);
	
-- Inserting data into the table
INSERT INTO people(
	first_name,
    last_name,
    age)
		VALUES (
        "Bob",
        "Belcher",
        42);
        
-- Multiple Inserts
INSERT INTO people VALUES
("Linda","Belcher",45),
("Philip","Frond",38),
("Calvin","Fishchoeder",70);

-- Selecting the table
SELECT * FROM people;

-- What is NOT NULL in SQL
DESC cats;

-- Here you can see that there is a Null Columm, What does that mean? = It means that NULL VALUES are permitted in that column (NULL MEANS THER IS NO VALUE AT ALL)
INSERT INTO cats(name) VALUES ("Todd");

-- Selecting the table
SELECT * FROM cats;

-- inserting null into the table
INSERT INTO cats() VALUES ();

-- Selecting the table
SELECT * FROM cats;

rollback;

-- Not null is a constraint
--  Create a new table for NOT NULL

CREATE TABLE cats2 (name varchar(20) NOT NULL, age int NOT NULL);

DESC cats2;

INSERT INTO cats2 (name) VALUES ("Bilbo");

-- Here we can see that the table is empty
SELECT * FROM cats2;

-- Adding all the values so that it executes
INSERT INTO cats2 (name, age) VALUES ("Bilbo", 19);

-- Selecting the table
SELECT * FROM cats2;

-- EXAMPLE : We use not null because there would be certain colomns which does not allow null values such as Primary key and ID's

-- Quotation : Always use single quotes to wrap around the texts, Because when you start using other SQL Databases it may cause problems

-- Example:
CREATE TABLE shops (name varchar(100));
INSERT INTO shops (name) VALUES ('Shoe Emporium');

-- Here is an example of when to use back slash
INSERT INTO shops (name) VALUES ('Mario\'s Pizza');


-- DEFAULT VALUE , Setting Default Values
CREATE TABLE cats3 (name varchar(50) DEFAULT 'unnamed', age int DEFAULT 99);
-- Inserting values
INSERT INTO cats3(age) VALUES (2);
-- You can see that it will create a default word.
SELECT * FROM cats3;
-- If you dont add any other value then?
INSERT INTO cats3 () VALUES ();
-- you can see that the default value kicksin
SELECT * FROM cats3;
-- Checking the desc
DESC cats3;

-- Question : is there a way we can only set Default and no requirement of NOT NULL, but in this case a user can assing "NULL" as a value, so its better to have both the conditions
CREATE TABLE cats4 (name varchar(100) NOT NULL DEFAULT 'unnamed', age int NOT NULL DEFAULT 99);

INSERT INTO cats4() VALUES();
-- selecting the database
SELECT * FROM cats4;

-- Now let's Try doing it by using the NULL Value which can be inserted by the user.
INSERT INTO cats4 (name,age) VALUES (NULL,NULL);
-- Here it gives an Error stating that "Column 'name' cannot be null.

DESC cats4;

-- PRIMARY KEY
-- Primary key is A Unique Identifier (its any sort of identifier)
CREATE TABLE unique_cats (
	cat_id int NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    age INT
    );
    
-- you can see that the key value is set to primary in this key column
DESC unique_cats;

-- Now lets try out if we can add duplicate values to primary key

INSERT INTO unique_cats(cat_id, name, age)
 VALUES 
 (1, 'bingo',2);

-- For the below it gives an error stating that "Duplicate entry '1' for key 'unique_cats.PRIMARY'.
INSERT INTO unique_cats(cat_id, name, age)
 VALUES 
 (1, 'bongo',3);
 
 -- Now if we do select option, then we can see that we cannnot see the 2nd row.
 SELECT * FROM unique_cats;
 
 -- There is another way which you can use to write the same
 CREATE TABLE unique_cats2(
 cats_id INT,
 name VARCHAR(100) NOT NULL,
 age INT NOT NULL,
 PRIMARY KEY (cats_id)
 );
 
 -- PRIMARY KEYS can never be null so there is no point in adding NOT NULL.
 
 -- Dropping the table
 DROP TABLE unique_cats;
 
 -- AUTO_INCREMENT, This is very useful because it will help to automatically add Primary keys and will not give any error.
 
 CREATE TABLE unique_cats(
	cat_id int AUTO_INCREMENT,
    name VARCHAR(100),
    age int,
    PRIMARY KEY (cat_id)
    );
    
    
-- Now as you can see below i dont have to specify any id, i can only specify name and age
INSERT INTO unique_cats (name, age) VALUES ('kat',29);

-- Checking the values
SELECT * FROM unique_cats;

-- Now as you can see below i dont have to specify any id, i can only specify name and age
INSERT INTO unique_cats (name, age) VALUES ('kat',29);
-- Now as you can see below i dont have to specify any id, i can only specify name and age
INSERT INTO unique_cats (name, age) VALUES ('kat',29);

-- Checking the values
SELECT * FROM unique_cats;

-- You can observe that the increments are being made automatically for the primary key

-- You can also write the code this way
CREATE TABLE uniqiue_cats4 (
	cats_id INT AUTO_INCREMENT PRIMARY KEY,
	name varchar(100),
    age int);
    
    
-- INSERTING VALUES
INSERT INTO uniqiue_cats4(name, age) VALUES ('kiran',3);
INSERT INTO uniqiue_cats4(name, age) VALUES ('kiran',3);
INSERT INTO uniqiue_cats4(name, age) VALUES ('kiran',3);


-- Selecting the database
SELECT * FROM uniqiue_cats4;

-- we can see that the increament is happening automatically
-- Primary aim of primary key is that it needs to be unique , if we try to add a duplicate value into the the row, it would not insert it

-- Challenge / Exercise
CREATE TABLE Employees (
	id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    age INT NOT NULL,
    current_status VARCHAR(100) NOT NULL DEFAULT 'employed');
    
DESC Employees;
    
-- Inserting values
INSERT INTO Employees (first_name, last_name, age) VALUES ('thomas', 'chicken_man', 83);

SELECT * FROM Employees;

INSERT INTO Employees (first_name, last_name, age) VALUES ('thomas', 'chicken_man',23);
INSERT INTO Employees (first_name, last_name, age) VALUES ('thomas', 'chicken_man',23);
INSERT INTO Employees (first_name, last_name, age) VALUES ('thomas', 'chicken_man',23);
INSERT INTO Employees (first_name, last_name, age) VALUES ('thomas', 'chicken_man',23);


SELECT * FROM Employees;