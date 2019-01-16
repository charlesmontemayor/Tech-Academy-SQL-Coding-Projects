CREATE DATABASE LibraryManagementSystem15;
USE LibraryManagementSystem15;

CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	BranchName VARCHAR(50) NOT NULL,
	BranchAddress VARCHAR(250) NOT NULL
);

CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	PublisherAddress VARCHAR(250) NOT NULL,
	PublisherPhone VARCHAR(50) NOT NULL
);

CREATE TABLE BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (300,1),
	BookTitle VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL REFERENCES PUBLISHER(PublisherName)
);

CREATE TABLE BOOK_AUTHORS (
	BookID INT NOT NULL REFERENCES BOOKS(BookID),
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE BORROWER (
	CardNo INT NOT NULL PRIMARY KEY IDENTITY (400,2),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(250) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE BOOK_COPIES (
	BookID INT NOT NULL REFERENCES BOOKS(BookID),
	BranchID INT NOT NULL REFERENCES LIBRARY_BRANCH(BranchID),
	NumberOfCopies INT NOT NULL
);

CREATE TABLE BOOK_LOANS (
	BookID INT NOT NULL REFERENCES BOOKS(BookID),
	BranchID INT NOT NULL REFERENCES LIBRARY_BRANCH(BranchID),
	CardNo INT NOT NULL REFERENCES BORROWER(CardNo),
	DateOut DATE,
	DateDue DATE
);

INSERT INTO LIBRARY_BRANCH
	(BranchName, BranchAddress)
	VALUES
		('Central', '123 St. Aurora, CO'),
		('Sharpstown', '456 St. Aurora, CO'),
		('Viejo', '789 St. Aurora, CO'),
		('Hampden', '012 St. Denver, CO'),
		('Lakewood', '345 St. Denver, CO')
;

INSERT INTO PUBLISHER
	(PublisherName, PublisherAddress, PublisherPhone)
	VALUES
		('Viking', 'New York, US', '123-456-789'),
		('Doubleday', 'New York, US', '153-623-643'),
		('Potter/Ten Speed/Harmony/Rodale', 'New York, US', '124-353-6754'),
		('Penguin Publishing Group', 'London, UK', '135-367-3456'),
		('Gallery Books', 'New York, US', '122-343-5643'),
		('Simon & Schuster', 'New York, US', '123-546-2643'),
		('HarperCollins', 'New York, US', '123-546-7547'),
		('Norton W. W. & Company, Inc.', 'New York, US', '235-235-6344'),
		('Random House Publishing Group', 'New York, US', '123-424-5325'),
		('Thomas Nelson Inc.', 'Tennessee, US', '122-534-6343'),
		('Plata Publishing, LLC.', 'Arizona, US', '122-325-5235'),
		('Houghton Mifflin Harcourt', 'Massachusetts, US', '123-415-6346'),
		('Random House Of Canada', 'Toronto, Ca', '345-642-3245'),
		('The Crown Publishing Group', 'New York, US', '214-252-4345'),
		('No Name Publisher', 'Colorado, US', '241-365-7547')
;

INSERT INTO BOOKS
	(BookTitle, PublisherName)
	VALUES
		('It', 'Viking'),
		('The Shining', 'Doubleday'),
		('Origin', 'Doubleday'),
		('The Da Vinci Code', 'Doubleday'),
		('The Life-Changing Magic Of Tidying Up', 'Potter/Ten Speed/Harmony/Rodale'),
		('Spark Joy', 'Potter/Ten Speed/Harmony/Rodale'),
		('Think And Grow Rich', 'Penguin Publishing Group'),
		('How To Win Friends & Influence People', 'Gallery Books'),
		('Elon Musk', 'HarperCollins'),
		('Alexander Hamilton', 'Penguin Publishing Group'),
		('Jobs', 'Simon & Schuster'),
		('Sapiens', 'HarperCollins'),
		('Astrophysics For People In A Hurry', 'Norton W. W. & Company, Inc.'),
		('A Brief History Of Time', 'Random House Publishing Group'),
		('The Total Money Makeover', 'Thomas Nelson Inc.'),
		('Rich Dad Poor Dad', 'Plata Publishing, LLC.'),
		('The 4-Hour Workweek', 'Potter/Ten Speed/Harmony/Rodale'),
		('Tribe Of Mentors', 'Houghton Mifflin Harcourt'),
		('Start With Why', 'Penguin Publishing Group'),
		('Leaders Eat Last', 'Penguin Publishing Group'),
		('Goodbye Things', 'Norton W. W. & Company, Inc.'),
		('Essentialism', 'The Crown Publishing Group'),
		('12 Rules For Life: An Antidote To Chaos', 'Random House of Canada'),
		('The Lost Tribe', 'No Name Publisher')
;

INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	(300, 'Stephen King'),
	(301, 'Stephen King'),
	(302, 'Dan Brown'),
	(303, 'Dan Brown'),
	(304, 'Marie Kondo'),
	(305, 'Marie Kondo'),
	(306, 'Napoleon Hill'),
	(307, 'Dale Carnegie'),
	(308, 'Ashlee Vance'),
	(309, 'Ron Chernow'),
	(310, 'Walter Isaacson'),
	(311, 'Yuval Noah Harari'),
	(312, 'Neil deGrasse Tyson'),
	(313, 'Stephen Hawking'),
	(314, 'Dave Ramsey'),
	(315, 'Robert Kiyosaki'),
	(316, 'Timothy Ferris'),
	(317, 'Timothy Ferris'),
	(318, 'Simon Sinek'),
	(319, 'Simon Sinek'),
	(320, 'Fumio Sasaki'),
	(321, 'Greg McKeown'),
	(322, 'Jordan Peterson'),
	(323, 'Tech Academy Author')
;

INSERT INTO BORROWER
	(Name, Address, Phone)
	VALUES
	('John Carrey', 'Lakewood, CO', '121-234-3522'),
	('Sam Vince', 'Aurora, CO', '121-324-5345'),
	('Michelle Ann', 'Denver, CO', '124-342-5346'),
	('Lissa Jolly', 'Stapleton, CO', '124-355-3234'),
	('Greg Moore', 'Aurora, CO', '231-423-5325'),
	('Ben Richards', 'Lakewood, CO', '324-324-5235'),
	('David Lowe', 'Centennial, CO','324-256-7656'),
	('Erin Robin', 'Denver, CO', '313-466-5642'),
	('Jonathan Smith', 'Golden, CO', '436-754-7547'),
	('Marcus Peters', 'Boulder, CO', '214-325-7657'),
	('Cory Park', 'Golden, CO', '232-345-3235')
;

INSERT INTO BOOK_COPIES
	(BookID, BranchID, NumberOfCopies)
	VALUES
	(300, 100, 4),(301, 100, 5),(302, 100, 2),(304, 100, 3),(318, 100, 5),(323, 100, 2),(308, 100, 3),(309, 100, 4),(312, 100, 3),(314, 100, 3),
	(323, 101, 3),(305, 101, 3),(306, 101, 4),(307, 101, 2),(319, 101, 4),(303, 101, 4),(317, 101, 5),(318, 101, 3),(313, 101, 2),(315, 101, 2),
	(303, 102, 4),(309, 102, 5),(310, 102, 2),(311, 102, 4),(320, 102, 3),(322, 102, 4),(312, 102, 3),(321, 102, 5),(305, 102, 3),(308, 102, 2),
	(303, 103, 4),(312, 103, 4),(313, 103, 2),(314, 103, 5),(321, 103, 5),(310, 103, 2),(306, 103, 2),(316, 103, 2),(314, 103, 5),(309, 103, 4),
	(320, 104, 5),(304, 104, 4),(315, 104, 4),(316, 104, 3),(317, 104, 4),(322, 104, 2),(306, 104, 4),(308, 104, 2),(310, 104, 2),(307, 104, 2)
	;

INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(300, 100, 400, '2018-12-16', '2019-01-16'),(304, 100, 400, '2018-12-02', '2019-01-02'),(312, 100, 400, '2018-12-02', '2019-01-02'),(308, 100, 400, '2018-12-16', '2019-01-16'),(301, 100, 400, '2018-12-30', '2019-01-30'),
	(303, 102, 402, '2018-11-23', '2018-12-23'),(311, 102, 402, '2018-11-23', '2018-12-23'),(305, 102, 402, '2018-12-23', '2019-01-23'),(321, 102, 402, '2018-12-23', '2019-01-23'),(309, 102, 402, '2018-12-23', '2019-01-23'),
	(319, 101, 404, '2018-12-13', '2019-01-13'),(317, 101, 404, '2018-12-13', '2019-01-13'),(315, 101, 404, '2018-12-13', '2019-01-13'),(323, 101, 404, '2018-11-21', '2018-12-21'),(318, 101, 404, '2018-11-21', '2018-12-21'),(300, 100, 404, '2019-01-01', '2019-02-01'),
	(321, 103, 406, '2018-12-21', '2019-01-21'),(310, 103, 406, '2018-12-21', '2019-01-21'),(309, 103, 406, '2018-12-21', '2019-01-21'),(314, 103, 406, '2018-12-21', '2019-01-21'),(313, 103, 406, '2018-12-21', '2019-01-21'),
	(322, 104, 408, '2018-11-11', '2018-12-11'),(310, 104, 408, '2018-11-11', '2018-12-11'),(307, 104, 408, '2018-11-11', '2018-12-11'),(306, 104, 408, '2018-11-12', '2018-12-12'),(317, 104, 408, '2018-11-12', '2018-12-12'),
	(306, 104, 410, '2019-01-01', '2019-02-01'),(321, 103, 410, '2019-01-01', '2019-02-01'),(317, 104, 410, '2019-01-01', '2019-02-01'),(309, 103, 410, '2019-01-01', '2019-02-01'),(308, 102, 410, '2019-01-01', '2019-02-01'),(303, 101, 410, '2018-12-16', '2019-01-16'),
	(302, 100, 412, '2019-01-04', '2019-02-04'),(305, 101, 412, '2019-01-04', '2019-02-04'),(301, 100, 412, '2019-01-04', '2019-02-04'),(312, 100, 412, '2018-12-04', '2019-01-04'),(319, 100, 412, '2018-12-04', '2019-01-04'),
	(320, 102, 414, '2018-12-04', '2019-01-04'),(311, 102, 414, '2018-12-04', '2019-01-04'),(322, 102, 414, '2018-12-04', '2019-01-04'),(321, 102, 414, '2018-12-04', '2019-01-04'),(303, 102, 414, '2018-12-04', '2019-01-04'),
	(301, 100, 416, '2018-11-04', '2018-12-04'),(318, 100, 416, '2018-11-04', '2018-12-04'),(319, 101, 416, '2018-12-18', '2019-01-18'),(303, 101, 416, '2018-12-18', '2019-01-18'),(306, 101, 416, '2018-12-18', '2019-01-18'),
	(317, 104, 418, '2018-12-25', '2019-01-25'),(315, 104, 418, '2018-12-25', '2019-01-25'),(316, 104, 418, '2019-01-10', '2019-02-10'),(309, 103, 418, '2019-01-10', '2019-02-10'),(321, 103, 418, '2019-01-11', '2019-02-11')
;

SELECT
	a1.NumberOfCopies, a2.BookTitle, a3.BranchName 
	FROM BOOK_COPIES a1
	INNER JOIN BOOKS a2 ON a2.BookID = a1.BookID
	INNER JOIN LIBRARY_BRANCH a3 ON a3.BranchID = a1.BranchID
	WHERE BookTitle = 'The Lost Tribe'
	AND BranchName = 'Sharpstown'
	;

SELECT
	a1.NumberOfCopies, a2.BookTitle, a3.BranchName 
	FROM BOOK_COPIES a1
	INNER JOIN BOOKS a2 ON a2.BookID = a1.BookID
	INNER JOIN LIBRARY_BRANCH a3 ON a3.BranchID = a1.BranchID
	WHERE BookTitle = 'The Lost Tribe'
	;

SELECT 
	a1.Name, a2.DateOut, a3.BookTitle
	FROM BOOK_LOANS a2
	FULL OUTER JOIN BORROWER a1 ON a1.CardNo = a2.CardNo
	FULL OUTER JOIN BOOKS a3 ON a3.BookID = a2.BookID
	WHERE DateOut IS NULL
	;

SELECT
	a1.DateDue, a2.BranchName, a3.BookTitle, a4.Name, a4.Address
	FROM BOOK_LOANS a1
	INNER JOIN LIBRARY_BRANCH a2 ON a2.BranchID = a1.BranchID
	INNER JOIN BOOKS a3 ON a3.BookID = a1.BookID
	INNER JOIN BORROWER a4 ON a4.CardNo = a1.CardNo
	WHERE DateDue = '2019-01-16'
	AND BranchName = 'Sharpstown'
	;

SELECT
	a1.BranchName,
	COUNT(a4.DateOut) AS 'No. Of Books Loan Out'
	FROM BOOK_COPIES a2
	INNER JOIN LIBRARY_BRANCH a1 ON a1.BranchID = a2.BranchID
	INNER JOIN BOOKS a3 ON a3.BookID = a2.BookID
	FULL OUTER JOIN BOOK_LOANS a4 ON a4.BookID = a2.BookID
	GROUP BY BranchName
;

SELECT
	a1.BranchName, a2.BookTitle, a3.NumberOfCopies
	FROM BOOK_COPIES a3
	INNER JOIN LIBRARY_BRANCH a1 ON a1.BranchID = a3.BranchID
	INNER JOIN BOOKS a2 ON a2.BookID = a3.BookID
	;

SELECT
	a1.Name, a1.Address,
	COUNT(BookID) AS 'No. of Books Borrowed'
	FROM BOOK_LOANS a2
	INNER JOIN BORROWER a1 ON a1.CardNo = a2.CardNo
	GROUP BY Name, Address
	HAVING COUNT(BookID) > 5
	;

SELECT
	a4.AuthorName, a1.BookTitle, a2.NumberOfCopies
	FROM BOOK_COPIES a2
	INNER JOIN BOOKS a1 ON a1.BookID = a2.BookID
	INNER JOIN LIBRARY_BRANCH a3 ON a3.BranchID = a2.BranchID
	INNER JOIN BOOK_AUTHORS a4 ON a4.BookID = a2.BookID
	WHERE BranchName = 'Central'
	AND AuthorName = 'Stephen King'
	;

