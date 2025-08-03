-- Create the database
CREATE DATABASE library_db;

-- Create Table
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    year_published INT,
    isAvailable BOOLEAN,
    price NUMERIC(8,2),
    publication VARCHAR(255)
);

-- Insert sample books
INSERT INTO books (title, author, year_published, isAvailable, price, publication) VALUES 
('The Great Book', 'John Smith', 1999, TRUE, 499.99, 'ABC'),
('1984', 'George Orwell', 1949, FALSE, 299.50, 'XYZ'),
('Modern Times', 'Charles Chaplin', 2005, TRUE, 699.00, 'XYZ'),
('Learning SQL', 'Alan Beaulieu', 2018, TRUE, 549.00, 'TechPress'),
('Clean Code', 'Robert C. Martin', 2008, FALSE, 599.99, 'XYZ'),
('The Pragmatic Programmer', 'Andrew Hunt', 1999, TRUE, 799.00, 'ABC'),
('Effective Java', 'Joshua Bloch', 2017, TRUE, 899.00, 'XYZ'),
('Python Crash Course', 'Eric Matthes', 2021, TRUE, 459.00, 'NoStarch'),
('Eloquent JavaScript', 'Marijn Haverbeke', 2020, FALSE, 520.00, 'XYZ'),
('Design Patterns', 'Erich Gamma', 2000, TRUE, 620.00, 'Pearson'),
('Introduction to Algorithms', 'Thomas H. Cormen', 2009, TRUE, 1050.00, 'MIT'),
('You Don’t Know JS', 'Kyle Simpson', 2015, TRUE, 350.00, 'XYZ'),
('Artificial Intelligence', 'Stuart Russell', 2010, FALSE, 980.00, 'Pearson'),
('Database Systems', 'Raghu Ramakrishnan', 2003, TRUE, 400.00, 'McGraw-Hill'),
('Web Development Basics', 'Jane Doe', 2022, TRUE, 275.00, 'XYZ');

-- Queries:

-- Query 1: Select all books published after 2000
SELECT FROM books WHERE year_published > 2000;

-- Query 2: Select books with a price less than 599.00, ordered by price descending
SELECT FROM books WHERE price < 599.00 ORDER BY price DESC;

-- Query 3: Select the top 3 most expensive books
SELECT FROM books ORDER BY price DESC LIMIT 3;

-- Query 4: Select 2 books, skipping the first 2, ordered by publication year descending
SELECT FROM books ORDER BY year_published DESC OFFSET 2 LIMIT 2;

-- Query 5: Select all books of the publication “XYZ” ordered alphabetically by title
SELECT FROM books WHERE publication = 'XYZ' ORDER BY title ASC;
