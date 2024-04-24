-- This is used to show databases present here
show databases;

-- This is used to create a database
CREATE DATABASE pet_shop;

CREATE DATABASE SlimeStore;

CREATE DATABASE Chicken_coop;

-- This is used to Drop Database
DROP DATABASE SlimeStore;

DROP DATABASE pet_shop;

DROP DATABASE chicken_coop;

-- This is again used to check for the databases present
show databases;

-- This command is used to USE The databases which has been created
USE chicken_coop;

-- This is used to Check which database we are currently present in
SELECT DATABASE();

-- This is again a flow of how things work here in SQL.
CREATE DATABASE petshop;
USE petshop;

-- This command is used to Create tables in a Data base
CREATE TABLE cats(
	name VARCHAR(50),
	age INT
);
    
CREATE TABLE dogs(
	name VARCHAR(50),
	breed VARCHAR(50),
	age INT
);
    
-- This command is used to SELECT CERTAIN DATA
SELECT * from petshop.cats;

-- This command is used to check the table available in SQL
SHOW TABLES;

-- This is know more information about the tables
SHOW COLUMNS FROM cats;

SHOW COLUMNS FROM dogs;

-- Same thing as above another way
DESCRIBE cats;

DESC cats;

-- For commenting in SQL we need to use Control + /

-- This is used to delete table
SHOW TABLES;

DROP TABLES cats;

DROP TABLES dogs;



-- Create a pastries table
-- 1. IT should include 2 columns: name and quantity. Name is 50 Characters max.
-- 2. Inspect your table/columns in the CLI
-- 3. Delete your table

-- This can also be considered as a general flow for any creation of databases

CREATE DATABASE Pastries_Main;

USE Pastries_Main;

SELECT DATABASE();

CREATE TABLE pastries(
	name varchar(50),
    quantity INT
);

SHOW TABLES;

SHOW COLUMNS FROM pastries;

DESC pastries;

DROP TABLES pastries;

DROP DATABASE Pastries_Main;