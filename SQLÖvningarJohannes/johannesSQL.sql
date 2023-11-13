--CREATE DATABASE DemoDB;

USE DemoDB;

--CREATE TABLE DjurDB(
--	ID INT PRIMARY KEY,
--	Namn nvarchar(max) not null
--);

--INSERT INTO DjurDB(ID, Namn)
--VALUES	(1, 'Hamster'),
--		(2, 'Hund'),
--		(3, 'Katt'),
--		(4, 'Kanin');

--SELECT *
--FROM DjurDB;

--SELECT Namn AS 'Namn som innehåller A'
--FROM DjurDB
--WHERE Namn LIKE '%a%';

--CREATE DATABASE KlassenDB;

USE KlassenDB;

CREATE TABLE Personer(
	ID int PRIMARY KEY,
	Förnamn nvarchar(max) not null,
	Efternamn nvarchar(max) not null,
	Ålder int,
	Hemort nvarchar(max) not null
);

INSERT INTO Personer(ID, Förnamn, Efternamn, Ålder, Hemort)

VALUES
	(1, 'Johannes', 'Fredriksson', 38, 'Lund'),
	(2, 'Anton', 'Malm', 20, 'Göteborg'),
	(3, 'Philip', 'Frölin', 25, 'Tibro');

SELECT *
FROM Personer;