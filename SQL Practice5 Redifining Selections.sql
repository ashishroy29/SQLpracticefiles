-- Continuation of books

-- Using created database
USE book_shop;

-- SELECTING books table
SELECT * from books;

-- Inserting new values of books
INSERT INTO books (
  title, author_fname, author_lname, 
  released_year, stock_quantity, pages
) 
VALUES 
  (
    '10% Happier', 'Dan', 'Harris', 2014, 
    29, 256
  ), 
  (
    'fake_book', 'Freida', 'Harris', 2001, 
    287, 428
  ), 
  (
    'Lincoln In The Bardo', 'George', 
    'Saunders', 2017, 1000, 367
  );
  
  
-- Distinct Clause (removing all the duplicate values and only keeping the uniques ones)
SELECT DISTINCT author_lname FROM books;

-- selecting the unique release year from books.
SELECT DISTINCT released_year FROM books;

-- SELECT unique first and last names from the table books
SELECT DISTINCT CONCAT(author_fname,' ',author_lname) FROM books;

-- Another Way
SELECT DISTINCT author_fname, author_lname FROM books;

-- LEARNING ORDERBY function

-- Inserting a row into the table and then finding the order by
-- Example 1
INSERT INTO books (title, author_lname) VALUES ('my life', 'Abel');

SELECT * from books;

SELECT author_lname FROM books ORDER BY author_lname;

-- ORDER BY is by default always Ascending order
SELECT book_id, author_fname, author_lname FROM books ORDER BY author_lname;

SELECT book_id, author_fname, author_lname FROM books ORDER BY author_fname;

SELECT book_id, author_fname, author_lname FROM books ORDER BY author_fname DESC;

SELECT book_id, author_fname, author_lname FROM books ORDER BY author_fname ASC;

SELECT title, pages FROM books ORDER BY pages DESC;

SELECT title, pages, released_year FROM books ORDER BY released_year;

-- Another way of executing order by
SELECT title, pages, released_year FROM books ORDER BY 2;

-- we can actually order by multiple columns also
SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname;

SELECT author_fname, released_year, title FROM books;

SELECT author_lname, released_year, title FROM books ORDER BY author_lname ASC;

SELECT author_lname, released_year, title FROM books ORDER BY author_lname, released_year DESC;

SELECT author_lname, released_year, title FROM books ORDER BY author_lname, released_year ASC;

SELECT CONCAT(author_fname, ' ' , author_lname) AS author FROM books ORDER BY author;

-- LIMIT function
-- Limit function controls the number of answers we get back

SELECT title FROM books LIMIT 3;

SELECT title FROM books LIMIT 1;

SELECT title FROM books LIMIT 10;

SELECT * FROM books LIMIT 1;

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 5;

SELECT title, released_year FROM books 
ORDER BY released_year DESC;

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1;

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 14;

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,5;

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,3;

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1,3;

-- The 2 numbers we can see here is just saying index number (give values starting row 0 and how many rows you want is the second number you want to retrive)
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,3;

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 10,1;

SELECT title FROM books LIMIT 5;

SELECT title FROM books LIMIT 5, 123219476457;
 
SELECT title FROM books LIMIT 5, 50;

SELECT author_fname, author_lname FROM books WHERE author_fname = 'David';

SELECT author_fname, author_lname FROM books WHERE author_fname LIKE '%da%';

SELECT author_fname, author_lname FROM books WHERE author_fname LIKE '%da';

SELECT author_fname, author_lname FROM books WHERE author_fname LIKE 'da%';

SELECT * FROM books WHERE title LIKE ':';

SELECT * FROM books WHERE title LIKE '%:%';

-- This will help us find all the names which has 4 character 
SELECT * FROM books WHERE author_fname LIKE '____';

-- This will help us find all the names which has 5 character
SELECT * FROM books WHERE author_fname LIKE '_____';

SELECT * FROM books WHERE author_fname LIKE '%';

SELECT * FROM books WHERE author_fname LIKE '_a_';

-- When there is special character then we can use it this way
SELECT * FROM books WHERE title LIKE '%\%%';

SELECT * FROM books WHERE title LIKE '%\_%';

DESC books;

-- Practice Questions

SELECT title FROM books WHERE title LIKE '%stories%';

SELECT * from books;

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;

SELECT 
    CONCAT(title, ' - ', released_year) AS summary 
FROM books ORDER BY released_year DESC LIMIT 3;

SELECT DISTINCT
CONCAT(title, ' - ', released_year) AS summary
FROM books
ORDER BY released_year DESC
LIMIT 3;

SELECT
CONCAT(title, ' - ', released_year) AS summary
FROM
(
    SELECT DISTINCT
    title,
    released_year
    FROM books
) AS distinct_books
ORDER BY released_year DESC
LIMIT 3;



SELECT 
    CONCAT(title, ' - ', released_year) AS summary
FROM
    (SELECT DISTINCT
        title, released_year
    FROM
        books) AS distinct_book
ORDER BY released_year DESC
LIMIT 3;

SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

SELECT title, released_year, stock_quantity FROM (SELECT DISTINCT title, released_year, stock_quantity FROM books) AS distinctbooks ORDER BY stock_quantity LIMIT 3;

DELETE FROM books WHERE title = 'my life';

SELECT title, released_year, stock_quantity FROM (SELECT DISTINCT title, released_year, stock_quantity FROM books) AS distinctbooks ORDER BY stock_quantity, title LIMIT 3;

SELECT title, author_lname FROM books ORDER BY author_lname, title;

SELECT CONCAT(UPPER('my favourite author is '), UPPER(author_fname),' ', UPPER(author_lname), '!') AS yell FROM books ORDER BY author_lname;

