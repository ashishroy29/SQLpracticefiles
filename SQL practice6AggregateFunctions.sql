-- Counting the total number of books in the 'book_shop' database
USE book_shop;
SELECT COUNT(*) FROM books;

-- Counting the total number of books where 'author_fname' is not NULL
SELECT COUNT(author_fname) FROM books;

-- Inserting two new rows into the 'books' table
INSERT INTO books () VALUES ();
INSERT INTO books () VALUES ();

-- Selecting all rows from the 'books' table
SELECT * FROM books;

-- Counting the total number of books after insertion
SELECT COUNT(*) FROM books;

-- Counting the total number of distinct 'author_fname' values
SELECT COUNT(DISTINCT author_fname) FROM books;

-- Counting the total number of distinct 'released_year' values
SELECT COUNT(DISTINCT released_year) FROM books;

-- Counting the total number of distinct 'author_lname' values
SELECT COUNT(DISTINCT author_lname) FROM books;

-- Counting the total number of books with 'the' in the title
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

-- Grouping by 'author_lname' and counting the occurrence of each 'author_lname'
SELECT author_lname, COUNT(author_lname) FROM books GROUP BY author_lname;

-- Grouping by 'author_lname', counting the occurrence of each 'author_lname', and ordering by the count in descending order
SELECT author_lname, COUNT(*) AS books_written FROM books GROUP BY author_lname ORDER BY books_written DESC;

-- Counting the occurrences of each 'released_year'
SELECT released_year, count(*) FROM books GROUP BY released_year;

-- Finding the minimum and maximum 'released_year' without grouping
SELECT MIN(released_year) FROM books;
SELECT MAX(released_year) FROM books;

-- Finding the maximum number of pages
SELECT MAX(pages) FROM books;

-- Finding the author with the minimum 'author_lname'
SELECT MIN(author_lname) FROM books;

-- Finding the author with the minimum and maximum 'author_lname'
SELECT MIN(author_lname), MAX(author_lname) FROM books;

-- Selecting the book with the maximum number of pages
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-- Selecting the maximum number of pages and the corresponding title
SELECT max(pages), title FROM books;

-- Selecting the title and pages of the book with the maximum number of pages
SELECT title, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);

-- Inserting a new row and finding the minimum 'released_year'
INSERT INTO books (title, pages) VALUES ('my life in words',634);
SELECT MIN(released_year) FROM books;

-- Finding the title and released year of the book with the minimum 'released_year'
SELECT title, released_year FROM books WHERE released_year = (SELECT MIN(released_year) FROM books);

-- Grouping by 'author_lname' and 'author_fname', and counting the occurrences of each combination
SELECT author_fname, author_lname , COUNT(*) FROM books GROUP BY author_lname, author_fname;

-- Grouping by concatenated author names and counting the occurrences
SELECT CONCAT(author_fname,' ', author_lname) AS Author, COUNT(*) FROM books GROUP BY Author;

-- Finding the year each author published their first book
SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname, author_fname;

-- Finding statistics for each author including count of books written, latest release year, first release year, and longest page count
SELECT 
    author_lname,
    author_fname,
    COUNT(*) as books_written,
    MAX(released_year) AS latest_release,
    MIN(released_year) AS First_release,
    MAX(pages) AS longest_page_count
FROM
    books
GROUP BY
    author_lname, author_fname;

-- Finding the sum of all pages in the books
SELECT SUM(pages) FROM books;

-- Finding the sum of pages for each author
SELECT author_lname, SUM(pages) FROM books GROUP BY author_lname;

-- Finding the average of 'released_year', 'pages', and 'stock_quantity'
SELECT AVG(released_year) FROM books;
SELECT AVG(pages) FROM books;
SELECT AVG(stock_quantity) FROM books;

-- Finding the average 'stock_quantity' and count of books for each 'released_year'
SELECT released_year, AVG(stock_quantity), COUNT(*) FROM books GROUP BY released_year;

-- Exercise questions
-- Counting the total number of books
SELECT COUNT(title) AS number_of_books FROM books;

-- Counting the total number of books and grouping by 'released_year'
SELECT COUNT(*) AS number_of_books, released_year FROM books GROUP BY released_year;

-- Finding the sum of 'stock_quantity'
SELECT SUM(stock_quantity) FROM books;

-- Finding the average 'released_year' for each author
SELECT CONCAT(author_lname,' ',author_fname) AS Author, AVG(released_year) AS Average_releasedyear FROM books GROUP BY Author;

-- Finding the author and pages of the book with the maximum number of pages
SELECT CONCAT(author_fname,' ', author_lname) AS author, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);

-- Finding statistics for each year including count of books, and average pages
SELECT released_year AS year, COUNT(title) AS '# books', AVG(pages) AS 'avg pages' FROM books GROUP BY released_year ORDER BY released_year ASC;
