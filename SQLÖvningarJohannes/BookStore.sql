CREATE DATABASE BookStore
GO
USE BookStore
GO
--USE master
--GO
--DROP DATABASE BookStore
--GO

CREATE TABLE Authors
(	
	AuthorId int PRIMARY KEY IDENTITY,
	FirstName nvarchar(max),
	LastName nvarchar(max) NOT NULL,
	DateOfBirth DATE,
	DateOfDeath DATE

)

CREATE TABLE Stores
(
	StoreId int PRIMARY KEY IDENTITY,
	StoreName nvarchar(max) NOT NULL,
	[Address] nvarchar(max),
	City nvarchar(max),
	Country nvarchar(max)
)

CREATE TABLE Publishers
(
	PublisherId INT PRIMARY KEY IDENTITY,
	PublisherName nvarchar(max),
	PublisherCity nvarchar(max)
)

CREATE TABLE Customers
(
	CustomerId int PRIMARY KEY IDENTITY,
	FirstName nvarchar(max) NOT NULL,
	LastName nvarchar(max) NOT NULL,
	Adress nvarchar(max),
	City nvarchar(max)
)

CREATE TABLE [Language]
(
	LanguageId INT PRIMARY KEY IDENTITY,
	[Language] nvarchar(max)
)

CREATE TABLE Books
(
	ISBN13 BIGINT PRIMARY KEY,
	Title nvarchar(max),
	[Language] INT FOREIGN KEY REFERENCES [Language](LanguageId),
	Price int,
	ReleaseDate DATE,
	PublisherId int FOREIGN KEY REFERENCES Publishers(PublisherId)
)

CREATE TABLE CustomerOrders
(
	OrderId INT PRIMARY KEY IDENTITY,
	CustomerId INT FOREIGN KEY REFERENCES Customers(CustomerId),
	StoreId INT FOREIGN KEY REFERENCES Stores(StoreId),
	OrderDate DATE NOT NULL
)

CREATE TABLE OrderDetails
(
	OrderDetailsId INT PRIMARY KEY IDENTITY,
	OrderId INT FOREIGN KEY REFERENCES CustomerOrders(OrderId),
	ISBN13 BIGINT FOREIGN KEY REFERENCES Books(ISBN13),
	Price INT NOT NULL,
	Quantity INT NOT NULL
)

CREATE TABLE Inventory
(
	BookISBN13 BIGINT NOT NULL,
	StoreId INT NOT NULL,
	[Amount] INT NOT NULL DEFAULT 0,
	CONSTRAINT PK_Inventory PRIMARY KEY (BookISBN13, StoreId),
	CONSTRAINT FK_BookISBN13_Books FOREIGN KEY (BookISBN13) REFERENCES Books(ISBN13),
	CONSTRAINT FK_StoreId_Stores FOREIGN KEY (StoreId) REFERENCES Stores(StoreId)
)

CREATE TABLE AuthorBooks
(
	AuthorId INT NOT NULL,
	BookISBN13 BIGINT NOT NULL,
	CONSTRAINT PK_AuthorBooks				PRIMARY KEY (AuthorId, BookISBN13),
	CONSTRAINT FK_AuthorBooks_Author		FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorId),
	CONSTRAINT FK_AuthorBooks_BookISBN13	FOREIGN KEY (BookISBN13) REFERENCES Books(ISBN13)
)
GO

INSERT INTO Authors (FirstName, LastName, DateOfBirth, DateOfDeath)
VALUES
	('Corey', 'Taylor', '1973-12-08', NULL),
	('Lee', 'Child', '1954-10-29', NULL),
	('Paul', 'Ekman', '1934-02-15', NULL),
	('Anselm', 'Hollo', '1934-01-01', '2013-01-29'),
	('Ingmar', 'Stenroth', '1937-11-18', NULL),
	('Erika', 'Rosenberg', '1964-08-20', NULL),
	('Andrew', 'Child', '1968-05-01', NULL);

INSERT INTO Publishers (PublisherName, PublisherCity)
VALUES
	('Ebury',	'London'),
	('Da Capo Press',	'Boston'),
	('Bantam', 'London'),
	('TransWorld', 'London'),
	('Phoenix', 'London'),
	('Norton', 'New York'),
	('Prentice-Hall',	'Englewood Cliffs, N.J'),
	('Coffe House Press',	'Minneapolis'),
	('Wallin & Dalholm',	'Lund'),
	('OXFORD UNIV PR', 'Wellington Square, Oxford'),
	('Random House Group', 'New York');

INSERT INTO Stores(StoreName, [Address], City, Country)
VALUES
	('Kastad från balkongen',	'Mandolingatan 80',	'Västra Frölunda',	'Sverige'),
	('Kass ishockey, bättre att läsa',	'Norra Infarten 79',	'Karlstad',	'Sverige'),
	('Lyxfällan',	'Olaus Sirmas gata',	'Karesuando',	'Sverige'),
	('Bottenskrap', 'Smyge strandvägen 5',	'Smygehamn',	'Sverige');

INSERT INTO [Language]([Language])
VALUES
	('English'),
	('Swedish'),
	('Finish');

INSERT INTO Books (ISBN13, Title, [Language], Price, ReleaseDate, PublisherId)
VALUES 
	(9780091941680, 'Seven deadly sins : settling the argument between born bad and damaged good', 1, 142, '2011-01-01', 1),
	(9780091949662, 'A Funny Thing Happened On The Way To Heaven A Funny Thing Happened On The Way To Heaven', 1, 142, '2013-06-20', 1),
	(9780139381751, 'Unmasking the face : a guide to recognizing emotions from facial clues', 1, 287, '1975-01-01', 7),
	(9780306823589, 'You\''re making me hate you : a cantankerous look at the common misconception that humans have any common sense left', 1, 143, '2015-06-11', 1),
	(9780306825446, 'America 51 : a probe into the realities that are hiding inside "the greatest country in the world"', 1, 171, '2017-08-08', 2),
	(9780393019315, 'Telling lies : clues to deceit in the marketplace, politics, and marriage', 1, 160, '1985-01-01', 6),
	(9780553505412, 'Die Trying', 1, 93, '1998-07-01', 4),
	(9780553826166, 'Killing floor', 1, 101, '1997-03-17', 3),
	(9780753817650, 'Emotions Revealed', 1, 127, '2003-04-07', 5),
	(9780857500069, 'Tripwire', 1, 93, '1999-04-15', 3),
	(9781566890397, 'Corvus : poems', 3, 106, '1995-01-01', 6),
	(9789197419451, 'Sveriges rötter : en nations födelse', 2, 95, '2005-01-01',9),
	(9780190202941, 'What the Face Reveals: Basic and Applied Studies of Spontaneous Expression Using the Facial Action Coding System (Facs) (Series in Affective Science)',1 , 774, '2020-06-20', 10),
	(9781787633780, 'The Secret', 1, 199, '2023-10-24', 4),
	(9780593722633, 'No Plan B', 1, 116, '2023-03-28', 11);


INSERT INTO AuthorBooks(AuthorId, BookISBN13)
VALUES
	(1, 9780091941680),
	(1, 9780091949662),
	(1, 9780306823589),
	(1, 9780306825446),

	(2, 9780553505412),
	(2, 9780553826166),
	(2, 9780857500069),
	(2, 9781787633780),
	(2, 9780593722633),

	(3, 9780139381751),
	(3, 9780393019315),
	(3, 9780753817650),
	(3, 9780190202941),

	(4, 9781566890397),

	(5, 9789197419451),

	(6, 9780190202941),

	(7, 9780593722633),
	(7, 9781787633780);


INSERT INTO Inventory (StoreId, BookISBN13, Amount)
  VALUES
	(1, 9780091941680, 15),
	(1, 9780091949662, 12),
	(1, 9780306823589, 8),
	(1, 9780306825446, 2),
	(1, 9780753817650, 1),

	(2, 9780139381751, 2),
	(2, 9780393019315, 3),
	(2, 9789197419451, 3),
	(2, 9780190202941, 2),

	(3, 9781566890397, 2),
	(3, 9780857500069, 3),
	(3, 9780553826166, 1),
	(3, 9780139381751, 4),
	(3, 9780593722633, 2),

	(4, 9780393019315, 1),
	(4, 9780553505412, 5),
	(4, 9781566890397, 1),
	(4, 9780306823589, 10),
	(4, 9781787633780, 5);

INSERT INTO Customers (FirstName, LastName, Adress, City)
VALUES
	('Knatte', 'Anka', 'Paradisäppelvägen 111', 'Ankeborg'),
	('Fnatte', 'Anka', 'Paradisäppelvägen 111', 'Ankeborg'),
	('Tjatte', 'Anka', 'Paradisäppelvägen 111', 'Ankeborg'),
	('Darth', 'Vader', 'Meditation Chamber', 'Death Star')

INSERT INTO CustomerOrders (CustomerId, StoreId, OrderDate)
VALUES
	(1, 3, '2002-02-19'),
	(1, 4, '2023-07-23'),
	(2, 2, '2019-02-12'),
	(3, 3, '1985-08-04'),
	(3, 3, '1998-02-08'),
	(4, 1, '2023-10-25')

INSERT INTO OrderDetails (OrderId, ISBN13, Price, Quantity)
VALUES
	(1, 9780091941680, 142, 1),
	(1, 9780091949662, 142, 1),
	(2, 9780306823589, 99, 2),
	(3, 9780553826166, 101, 1),
	(4, 9780139381751, 399, 1),
	(5, 9780553505412, 99, 3),
	(5, 9780857500069, 99, 7),
	(6, 9781566890397, 7999, 1)

GO
CREATE VIEW vTitlarPerFörfattare AS
SELECT 
	DISTINCT CONCAT(FirstName, ' ', LastName) AS Namn,
	CASE
		WHEN DateOfDeath IS NULL THEN CONCAT(DATEDIFF(YY, DateOfBirth, GETDATE()), ' år')
		ELSE CONCAT('X ', DATEDIFF(YY, DateOfBirth, DateOfDeath), ' år')
		END AS Ålder,
	CONCAT(COUNT(DISTINCT(Books.ISBN13)), ' st') AS Titlar,
	CONCAT(SUM(Inventory.Amount * Books.Price), ' kr') AS Lagervärde
FROM Authors
JOIN AuthorBooks ON AuthorBooks.AuthorId = Authors.AuthorId
JOIN Books ON Books.ISBN13 = AuthorBooks.BookISBN13
JOIN Inventory ON Inventory.BookISBN13 = Books.ISBN13
GROUP BY FirstName, LastName, DateOfBirth, DateOfDeath

GO

CREATE VIEW vTitlarMedFlerÄnEnFörfattare AS
SELECT Books.Title, COUNT(Authors.AuthorId) AS NumberOfAuthors FROM
Authors
JOIN AuthorBooks ON AuthorBooks.AuthorId = Authors.AuthorId
JOIN Books ON Books.ISBN13 = AuthorBooks.BookISBN13
GROUP BY Books.Title
HAVING COUNT(Authors.AuthorId) > 1
GO

CREATE PROCEDURE MoveBooksBetweenStores
	@ToStore INT,
	@FromStore INT,
	@ISBN13 BIGINT,
	@Amount INT
AS
BEGIN
	BEGIN TRANSACTION

		IF (@Amount <= 0)
			BEGIN
			ROLLBACK
			RETURN
			END

		IF (@Amount > (SELECT Amount FROM Inventory WHERE StoreId = @FromStore AND BookISBN13 = @ISBN13))
			BEGIN
			ROLLBACK
			RETURN
			END

		IF EXISTS (SELECT * FROM Inventory WHERE StoreId = @FromStore AND BookISBN13 = @ISBN13)
		BEGIN
			IF (@Amount <= (SELECT Amount FROM Inventory WHERE StoreId = @FromStore AND BookISBN13 = @ISBN13))
			BEGIN
				IF (@Amount < (SELECT Amount FROM Inventory WHERE StoreId = @FromStore AND BookISBN13 = @ISBN13))
					BEGIN
						UPDATE Inventory
						SET Amount -= @Amount
						WHERE StoreId = @FromStore AND BookISBN13 = @ISBN13
					END
				ELSE
					BEGIN
						DELETE FROM Inventory 
						WHERE StoreId = @FromStore AND BookISBN13 = @ISBN13
					END
				IF EXISTS (SELECT * FROM Inventory WHERE StoreId = @ToStore AND BookISBN13 = @ISBN13)
					BEGIN
						UPDATE Inventory
						SET Amount += @Amount
						WHERE StoreId = @ToStore AND BookISBN13 = @ISBN13
						COMMIT
					END
				ELSE
					BEGIN
						INSERT INTO Inventory (StoreId, BookISBN13, Amount)
						VALUES (@ToStore, @ISBN13, @Amount)
						COMMIT
					END
			END
		END
		ELSE
		BEGIN
			ROLLBACK
		END
END;


GO
CREATE VIEW vTotalSoldPerStore AS
SELECT COALESCE(Stores.StoreName, 'TotalSales') AS StoreName, CONCAT(SUM(OrderDetails.Price), ' kr') AS TotalSoldPerStore
FROM CustomerOrders
JOIN OrderDetails ON OrderDetails.OrderId = CustomerOrders.OrderId
JOIN Stores ON Stores.StoreId = CustomerOrders.StoreId
GROUP BY ROLLUP(Stores.StoreName)
GO

CREATE VIEW vDarthVaderCelebratingGettingPaid AS
SELECT CONCAT(Customers.FirstName, ' ', Customers.LastName, ' sure likes his poetry...') AS FullName, (Books.Title) AS Title
FROM CustomerOrders
JOIN OrderDetails ON OrderDetails.OrderId = CustomerOrders.OrderId
JOIN Customers ON Customers.CustomerId = CustomerOrders.CustomerId
JOIN Books ON OrderDetails.ISBN13 = Books.ISBN13
WHERE Customers.FirstName LIKE 'Darth'
