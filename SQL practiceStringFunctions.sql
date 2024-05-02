-- String functions (We can work here with texts)
-- Working with strings and its functions.
-- STRING Functions

CREATE DATABASE book_shop;

-- Using the Database
USE book_shop;

-- Creating a table 
CREATE TABLE books (
  book_id INT NOT NULL AUTO_INCREMENT, 
  title VARCHAR(100), 
  author_fname VARCHAR(100), 
  author_lname VARCHAR(100), 
  released_year INT, 
  stock_quantity INT, 
  pages INT, 
  PRIMARY KEY (book_id)
);

-- Inserting values into the table
INSERT INTO books (
  title, author_fname, author_lname, 
  released_year, stock_quantity, pages
) 
VALUES 
  (
    'The Namesake', 'Jhumpa', 'Lahiri', 
    2003, 32, 291
  ), 
  (
    'Norse Mythology', 'Neil', 'Gaiman', 
    2016, 43, 304
  ), 
  (
    'American Gods', 'Neil', 'Gaiman', 
    2001, 12, 465
  ), 
  (
    'Interpreter of Maladies', 'Jhumpa', 
    'Lahiri', 1996, 97, 198
  ), 
  (
    'A Hologram for the King: A Novel', 
    'Dave', 'Eggers', 2012, 154, 352
  ), 
  (
    'The Circle', 'Dave', 'Eggers', 2013, 
    26, 504
  ), 
  (
    'The Amazing Adventures of Kavalier & Clay', 
    'Michael', 'Chabon', 2000, 68, 634
  ), 
  (
    'Just Kids', 'Patti', 'Smith', 2010, 
    55, 304
  ), 
  (
    'A Heartbreaking Work of Staggering Genius', 
    'Dave', 'Eggers', 2001, 104, 437
  ), 
  (
    'Coraline', 'Neil', 'Gaiman', 2003, 
    100, 208
  ), 
  (
    'What We Talk About When We Talk About Love: Stories', 
    'Raymond', 'Carver', 1981, 23, 176
  ), 
  (
    "Where I'm Calling From: Selected Stories", 
    'Raymond', 'Carver', 1989, 12, 526
  ), 
  (
    'White Noise', 'Don', 'DeLillo', 1985, 
    49, 320
  ), 
  (
    'Cannery Row', 'John', 'Steinbeck', 
    1945, 95, 181
  ), 
  (
    'Oblivion: Stories', 'David', 'Foster Wallace', 
    2004, 172, 329
  ), 
  (
    'Consider the Lobster', 'David', 
    'Foster Wallace', 2005, 92, 343
  );
  
-- CONCAT is the first function we are studing. (Combine data for cleaner output)

-- It will take whatever we give to it and give us a single piece of string (for each row)
SELECT 
  CONCAT('h', 'e', 'l', 'l');
  
-- Concat practice questions
SELECT 
  CONCAT(author_fname, '!!!') 
FROM 
  books;
  
-- Concat the first and the last name
SELECT 
  CONCAT(author_fname, author_lname) 
FROM 
  books;
  
-- Concat the first and the last name with space
SELECT 
  CONCAT(author_fname, ' ', author_lname) AS author_fullname 
FROM 
  books;
  
-- CONCAT_WS (This will help in provinding sepeartors. (WS here is also called as with seperator)
SELECT 
  CONCAT_WS(' ', author_fname, author_lname) AS full_name 
FROM 
  books;
  
-- Example 3:
SELECT 
  CONCAT_WS(
    '-', title, author_fname, author_lname
  ) 
FROM 
  books;
  
-- Substring takes a single larger string and returns a smaller portion of that string (maybe the first 5 characters, The last character, The middle 10 characters

-- there are 3 arguments which we need to specify in a substring (we need to provide a character first, then the starting character number and finally the length of the substring)
SELECT 
  SUBSTRING('Hello World', 1, 4);
  
-- Example 2 of Substring
SELECT 
  SUBSTRING('Hello World', 1, 6);
  
-- Example 3 of Substring
SELECT 
  SUBSTRING('Hello World', 1, 7);
  
-- Example 4 give me only ello
SELECT 
  SUBSTRING('Hello World', 2, 4);
  
-- Example 4, This starts from 7th character and gives the entire string till the end)
SELECT 
  SUBSTRING('Hello World', 7);
  
-- Example 4, This starts from 7th character and gives the entire string till the end)
SELECT 
  SUBSTRING('Hello World', 7, 2);
  
-- Example 4, This starts from 7th character and gives the entire string till the end)
SELECT 
  SUBSTRING('Hello World', 5);
  
-- Example 4, This stars from the end
SELECT 
  SUBSTRING('Hello World', -3);
  
-- Using it on the data books
SELECT 
  title 
FROM 
  books;
-- SUBSTR() is also the same
SELECT 
  SUBSTRING(title, 1, 15) 
FROM 
  books;
  
-- First character of the authors last name
SELECT 
  SUBSTR(author_lname, 1, 1) AS Initial, 
  author_lname 
FROM 
  books;
  
-- Combining functions with substring and concat
SELECT 
  CONCAT(
    SUBSTRING(title, 1, 10), 
    '...'
  ) AS short_title 
FROM 
  books;
  
-- Combining 2 initials using substring and concat functions
SELECT 
  CONCAT(
    SUBSTR(author_fname, 1, 1), 
    '.', 
    SUBSTR(author_lname, 1, 1), 
    '.'
  ) AS author_initials 
FROM 
  books;

-- Replace function (this is if we want to replace something in text)
SELECT REPLACE('Hello World', 'Hell', '@##$%#') as replace_function;

-- 2nd Example
SELECT REPLACE('cheese bread coffee milk',' ', ' and ');


-- Replace is case sensitive, so whatever you do, it need to be case sensitive.
SELECT REPLACE(' I am Colt' , 'colt', 'Mr. Steele');
-- As we can see nothing changes

-- Replace is case sensitive, so whatever you do, it need to be case sensitive.
SELECT REPLACE(' I am colt' , 'colt', 'Mr. Steele');
-- since we took care of the case sensitive factor, it has changed

-- Replace everyspace with '-' instead of ' ' (Space)
SELECT REPLACE(title, ' ', '-') FROM books;
-- We are just retriving the titles and showcasing the answers here that's all

-- Reverse function
SELECT REVERSE(title) FROM books;

-- Example 2:
SELECT REVERSE(author_fname) FROM books;

-- Combining Reverse and concat
SELECT CONCAT(author_fname, ' ' , REVERSE(author_fname)) FROM books;

-- Function to check the number of characters in a string.
SELECT CHAR_LENGTH('Hello World');

-- Select the character length of the column title
SELECT 
    title,
    CHAR_LENGTH(title) AS Length_of_Characters
FROM
    books;
    
-- Combination of concat and author last name
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' char') FROM books;

SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

-- Function for selecting upper and lower case
SELECT UPPER('Hello World');
 
SELECT LOWER('Hello World');
 
SELECT UPPER(title) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;

-- INSERT FUNCTION
SELECT INSERT('HELLO BOBBY',6,0,'There');

-- INSERT FUNCTION
SELECT INSERT('HELLO BOBBY',6,4,'There');

-- INSERT FUNCTION (character, the position you want to replace, how many character you want to replace,
--  if you dont want to replace any character then type 0, and last what you want to replace it with)
SELECT INSERT('HELLO BOBBY',6,7,'There');


-- LEFT function
SELECT LEFT('omg haha!', 3);

-- RIGHT function
SELECT RIGHT('omg haha!',4);

-- Excercise
SELECT 
    LEFT(author_lname, 1)
FROM
    books;

-- TRIM (this removes the leading and trailing spaces.
SELECT TRIM('     HELLO   ');

SELECT REPEAT('ha', 4);


SELECT TRIM('.........ashish...');

SELECT TRIM(LEADING '.' FROM '.........ashish...');

SELECT TRIM(TRAILING '.' FROM '.........ashish...');


SELECT UPPER(REVERSE('Why does my cat loot at me with such hatred'));

SELECT
	REPLACE
		(
		CONCAT('I', ' ', 'like',' ', 'cats'), ' ', '-');
        
        
SELECT REPLACE(title, ' ', '->') AS title FROM books;


SELECT author_fname AS forwards, REVERSE(author_fname) AS backwards FROM books;


SELECT CONCAT(UPPER(author_fname), ' ', UPPER(author_lname)) AS 'full name in caps' FROM books;


SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;

SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books;


SELECT 
    CONCAT(LEFT(title, 10), '...') AS 'short title',
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock ') AS quantity
FROM
    books;
    
    
-- Using substring
SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS short_title,
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books;