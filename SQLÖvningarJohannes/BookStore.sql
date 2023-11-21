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
	DateOfBirth DATE
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
	[Language] nvarchar(max),
	Price int,
	ReleaseDate DATE,
	AuthorId int FOREIGN KEY REFERENCES Authors(AuthorId),
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

INSERT INTO Authors (FirstName, LastName, DateOfBirth)
VALUES
	('Corey', 'Taylor', '1973-12-08'),
	('Lee', 'Child', '1954-10-29'),
	('Paul', 'Ekman', '1934-02-15'),
	('Anselm', 'Hollo', '1934-01-01'),
	('Ingmar', 'Stenroth', '1937-11-18');

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
	('Wallin & Dalholm',	'Lund')

INSERT INTO Stores(StoreName, [Address], City, Country)
VALUES
	('Kastad från balkongen',	'Mandolingatan 80',	'Västra Frölunda',	'Sverige'),
	('Kass ishockey, bättre att läsa',	'Norra Infarten 79',	'Karlstad',	'Sverige'),
	('Lyxfällan',	'Olaus Sirmas gata',	'Karesuando',	'Sverige'),
	('Bottenskrap', 'Smyge strandvägen 5',	'Smygehamn',	'Sverige')

INSERT INTO [Language]([Language])
VALUES
	('English'),
	('Swedish'),
	('Finish')

INSERT INTO Books (ISBN13, Title, [Language], Price, ReleaseDate, AuthorId,	PublisherId)
VALUES 
	(9780091941680, 'Seven deadly sins : settling the argument between born bad and damaged good', 1, 142, '2011-01-01', 1, 1),
	(9780091949662, 'A Funny Thing Happened On The Way To Heaven A Funny Thing Happened On The Way To Heaven', 1, 142, '2013-06-20', 1, 1),
	(9780139381751, 'Unmasking the face : a guide to recognizing emotions from facial clues', 1, 287, '1975-01-01', 3, 7),
	(9780306823589, 'You\''re making me hate you : a cantankerous look at the common misconception that humans have any common sense left', 1, 143, '2015-06-11', 1, 1),
	(9780306825446, 'America 51 : a probe into the realities that are hiding inside "the greatest country in the world"', 1, 171, '2017-08-08', 1, 2),
	(9780393019315, 'Telling lies : clues to deceit in the marketplace, politics, and marriage', 1, 160, '1985-01-01', 3, 6),
	(9780553505412, 'Die Trying', 1, 93, '1998-07-01', 2, 4),
	(9780553826166, 'Killing floor', 1, 101, '1997-03-17', 2, 3),
	(9780753817650, 'Emotions Revealed', 1, 127, '2003-04-07', 3, 5),
	(9780857500069, 'Tripwire', 1, 93, '1999-04-15', 2, 3),
	(9781566890397, 'Corvus : poems', 3, 106, '1995-01-01', 4, 6),
	(9789197419451, 'Sveriges rötter : en nations födelse', 2, 95, '2005-01-01',5 ,9)

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

	(3, 9781566890397, 2),
	(3, 9780857500069, 3),
	(3, 9780553826166, 1),
	(3, 9780139381751, 4),

	(4, 9780393019315, 1),
	(4, 9780553505412, 5),
	(4, 9781566890397, 1),
	(4, 9780306823589, 10)

GO
CREATE VIEW TitlarPerFörfattare AS
SELECT 
	DISTINCT CONCAT(FirstName, ' ', LastName) AS Namn,
	CONCAT(DATEDIFF(Year, DateOfBirth, GETDATE()), ' år') AS Ålder,
	CONCAT(COUNT(DISTINCT(Books.ISBN13)), ' st') AS Titlar,
	CONCAT(SUM(Inventory.Amount), ' st') AS LagerSaldo,
	CONCAT(SUM(Inventory.Amount * Books.Price), ' kr') AS Lagervärde
FROM Authors
JOIN Books ON Books.AuthorId = Authors.AuthorId
JOIN Inventory ON Inventory.BookISBN13 = Books.ISBN13
GROUP BY FirstName, LastName, DateOfBirth

GO

SELECT * FROM TitlarPerFörfattare
