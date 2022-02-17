-- (a)
CREATE DATABASE dulibrary;
-- creating the first table
CREATE TABLE libraryBooks (
  AccessionNumber INTEGER PRIMARY KEY,
    Title VARCHAR(80),
    Author VARCHAR(80),
    Department VARCHAR(20),
    PurchaseDate DATE,
    Price INT
);
-- adding dummy DATA
INSERT INTO LibraryBooks VALUES(101,'Database System Concepts', 'Linus Torvalds', 'CS', '1989-10-14', 150);
INSERT INTO LibraryBooks VALUES (102,'Computer Fundamentals', 'Navathe', 'Discrete Maths', '1999-08-20', 200);
INSERT INTO LibraryBooks VALUES (103,'Kendi Hundi C', 'Mathew Vaugan', 'Discrete Maths', '2021-12-20', 300);
INSERT INTO LibraryBooks VALUES (104,'VS Code Basics', 'Bayross', 'CS', '2003-11-10', 450);
INSERT INTO LibraryBooks VALUES (105,'Micro Economics', 'Forte', 'Economics', '2004-10-14', 500);
INSERT INTO LibraryBooks VALUES (106,'GE', 'Coronel', 'Hindi', '2005-09-21', 350);

-- @block
-- creating the second table
CREATE TABLE issuedBooks (
  AccessionNumber INTEGER ,
  Borrower VARCHAR(80),
  FOREIGN KEY (AccessionNumber) REFERENCES libraryBooks(AccessionNumber)
);

-- adding dummy DATA
INSERT INTO issuedBooks VALUES (104, 'Michael Scott');
INSERT INTO issuedBooks VALUES (102, 'Stanley Hudson');
INSERT INTO issuedBooks VALUES (106, 'Kelly Kapoor');
INSERT INTO issuedBooks VALUES (103, 'Jim Halpert');
INSERT INTO issuedBooks VALUES (105, 'Dwight Schrute');
-- @block
-- (b)

DELETE FROM libraryBooks WHERE Title = 'Database System Concepts';

-- @block
-- (c)
UPDATE libraryBooks SET Department = 'CS' WHERE Department='Discrete Maths';


-- @block
-- (d)
SELECT * FROM libraryBooks WHERE Department = 'CS';


-- @block
-- (e)
SELECT * FROM libraryBooks WHERE Department = 'CS' AND Author = 'Navathe';


-- @block
-- (f)
SELECT * FROM libraryBooks, issuedBooks WHERE libraryBooks.AccessionNumber = issuedBooks.AccessionNumber AND libraryBooks.Department = 'CS';

-- @block
-- (g)
SELECT * FROM libraryBooks WHERE Price < 500 OR PurchaseDate BETWEEN '1999-01-01' AND '2004-01-01';


-- @block
-- drop TABLES libraryBooks, issuedBooks;
