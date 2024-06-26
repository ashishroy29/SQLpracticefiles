-- Selects all books except those released in 2017
SELECT * FROM books WHERE released_year != 2017;

-- Selects titles and author last names of books not written by Neil Gaiman
SELECT title, author_lname FROM books WHERE author_lname != 'Gaiman';

-- Selects titles of books containing spaces
SELECT title FROM books WHERE title LIKE '% %';

-- Selects titles of books not containing spaces
SELECT title FROM books WHERE title NOT LIKE '% %';

-- Selects titles and authors whose first name starts with 'da'
SELECT title, author_fname, author_lname FROM books WHERE author_fname LIKE 'da%';

-- Selects titles and authors whose first name does not start with 'da'
SELECT title, author_fname, author_lname FROM books WHERE author_fname NOT LIKE 'da%';

-- Selects titles of books not containing the letter 'e'
SELECT title FROM books WHERE title NOT LIKE '%e%';

-- Selects titles of books not containing the letter 'a'
SELECT title FROM books WHERE title NOT LIKE '%a%';

-- Selects all books released after 2005
SELECT * FROM books WHERE released_year > 2005;

-- Selects all books with more than 500 pages
SELECT * FROM books WHERE pages > 500;

-- Checks if 99 is greater than 1 (returns true)
SELECT 99 > 1;

-- Checks if 80 is greater than 100 (returns false)
SELECT 80 > 100;

-- Selects titles, pages, and release years of books with more than 500 pages
SELECT title, pages, released_year FROM books WHERE pages > 500;

-- Checks if 1 is greater than NULL (returns NULL)
SELECT 1 > NULL;

-- Selects titles and release years of books released before 2000
SELECT title, released_year FROM books WHERE released_year < 2000;

-- Selects titles and release years of books released before 2000, ordered by release year
SELECT title, released_year FROM books WHERE released_year < 2000 ORDER BY released_year;

-- Selects titles and pages of books with less than 200 pages
SELECT title, pages FROM books WHERE pages < 200;

-- Selects titles and release years of books released after 2010
SELECT title, released_year FROM books WHERE released_year > 2010;

-- Selects titles and release years of books released in or after 2010
SELECT title, released_year FROM books WHERE released_year >= 2010;

-- Selects titles and release years of books released before 2010
SELECT title, released_year FROM books WHERE released_year < 2010;

-- Selects titles and release years of books released in or before 2010
SELECT title, released_year FROM books WHERE released_year <= 2010;

-- Selects all books written by Eggers
SELECT * FROM books WHERE author_lname = 'Eggers';

-- Selects all books released after 2010
SELECT * FROM books WHERE released_year > 2010;

-- Selects all books written by Eggers and released after 2010
SELECT * FROM books WHERE author_lname = 'Eggers' AND released_year > 2010;

-- Selects titles, author last names, and release years of books released after 2010 and written by Eggers
SELECT title, author_lname, released_year FROM books WHERE released_year > 2010 AND author_lname = 'Eggers';

-- Selects titles, author last names, and release years of books released after 2010, written by Eggers, and containing 'novel' in title
SELECT title, author_lname, released_year FROM books WHERE released_year > 2010 AND author_lname = 'Eggers' AND title LIKE '%novel%';

-- Selects titles and pages of books with title length greater than 30 characters and more than 500 pages
SELECT title, pages FROM books WHERE CHAR_LENGTH(title) > 30 AND pages > 500;

-- Selects titles, author last names, and release years of books written by Eggers or released after 2010
SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Eggers' OR released_year > 2010;

-- Selects titles, author last names, and release years of books released after 2010, written by Eggers, or containing 'novel' in title
SELECT title, author_lname, released_year FROM books WHERE released_year > 2010 OR author_lname = 'Eggers' OR title LIKE '%novel%';

-- Selects titles and pages of books with less than 200 pages or containing 'stories' in title
SELECT title, pages FROM books WHERE pages < 200 OR title LIKE '%stories%';

USE book_shop;

-- BETWEEN function
SELECT title, released_year FROM books WHERE released_year >= 2004 AND released_year <= 2015;

SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;

SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2014;

SELECT title, pages FROM books WHERE pages BETWEEN 200 AND 300;

SELECT title, pages FROM books WHERE pages NOT BETWEEN 200 AND 300;

-- Comparing dates, time, datestamp, datetimestamp etc
USE friendss;

SELECT * FROM people;

SELECT * FROM people WHERE birthdate < '2005-01-01';

SELECT * FROM people WHERE YEAR(birthdate) < 2005;

SELECT * FROM people WHERE birthtime > '09:00:00';

SELECT * FROM people WHERE birthtime > '12:00:00';

SELECT * FROM people WHERE HOUR(birthtime) > 12;

-- Cast function
SELECT CAST('09:00:00' AS TIME);

SELECT * FROM people WHERE birthtime BETWEEN '12:00:00' AND '16:00:00';

SELECT * FROM people WHERE birthtime BETWEEN CAST('12:00:00' AS TIME) AND CAST('16:00:00' AS TIME);

SELECT * FROM people WHERE  HOUR(birthtime) BETWEEN 12 AND 16;

USE book_shop;

-- IN operator
SELECT title, author_lname FROM books WHERE author_lname = 'Carver' OR author_lname = 'Lahari' OR author_lname = 'Smith';

-- Instead of using OR so many times, just use in
SELECT title, author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT title, author_lname FROM books WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');

SELECT title, released_year FROM books WHERE released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016);

SELECT title, released_year FROM books WHERE released_year IN (2000,2002,2004,2006,2008,2010,2012,2014,2016);

SELECT title, released_year FROM books WHERE released_year>=2000 AND released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016);

-- WE can use % sign operator which is modulo
SELECT 10 % 4;

SELECT 17 % 6;

SELECT 18 % 2;

SELECT title, released_year FROM books WHERE released_year>=2000 AND released_year % 2 != 0;

SELECT title, released_year FROM books WHERE released_year>=2000 AND released_year % 2 = 1;

-- CASE STATEMENTS
SELECT title, released_year,
	CASE
		WHEN released_year >= 2000 THEN 'Mordern Lit'
        ELSE '20th Century Lit'
	END AS GENRE
FROM books;


SELECT title, stock_quantity,
	CASE
		WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
	END AS STOCK
FROM books;

SELECT title, stock_quantity,
	CASE
		WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
	END AS STOCK
FROM books;

SELECT title, stock_quantity,
	CASE
		WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
	END AS STOCK
FROM books;

-- IS NULL operator ( how to target null rows)
SELECT * FROM books WHERE author_lname IS NULL;

SELECT * FROM books WHERE author_lname IS NOT NULL;

SELECT * FROM books WHERE author_lname IS NULL;

DELETE FROM books WHERE author_lname is NULL;

-- Exercise Questions
SELECT * FROM books;

SELECT * FROM books WHERE released_year < 1980;

SELECT * FROM books WHERE author_lname = 'Eggers' OR author_lname = 'Chabon';

SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;

SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

SELECT * FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

SELECT title, author_lname,
	CASE
		WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title = 'Just Kids' THEN 'Memoir'
        WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
        ELSE 'Novel'
	END AS 'TYPE'
FROM books;


SELECT author_fname, author_lname,
	CASE
		WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*),' ', 'books')
	END AS 'count'
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;