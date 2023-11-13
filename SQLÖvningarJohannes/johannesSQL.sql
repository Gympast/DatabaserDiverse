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

--SELECT Namn AS 'Namn som inneh�ller A'
--FROM DjurDB
--WHERE Namn LIKE '%a%';

--CREATE DATABASE KlassenDB;

USE KlassenDB;

CREATE TABLE Personer(
	ID int PRIMARY KEY,
	F�rnamn nvarchar(max) not null,
	Efternamn nvarchar(max) not null,
	�lder int,
	Hemort nvarchar(max) not null
);

INSERT INTO Personer(ID, F�rnamn, Efternamn, �lder, Hemort)

VALUES
	(1, 'Johannes', 'Fredriksson', 38, 'Lund'),
	(2, 'Anton', 'Malm', 20, 'G�teborg'),
	(3, 'Philip', 'Fr�lin', 25, 'Tibro');

SELECT *
FROM Personer;