--CREATE DATABASE KlassenDb;

USE KlassenDb;

--CREATE TABLE KlassenTBL(
--[Id] int,
--[Förnamn] nvarchar(max) NOT NULL,
--[Efternamn] nvarchar(max) NOT NULL,
--[Ålder] int,
--[Hemort] nvarchar(max) NOT NULL
--Primary Key (Id)
--);

--INSERT INTO KlassenTBL
--VALUES	(1, 'Johannes', 'Fredriksson', 37, 'Frölunda'),
--		(2, 'Jing', 'Leng', null, 'Hisingen'),
--		(3, 'Andreas', 'Nordfeldt', null, 'Hisingen'),
--		(4, 'Linus', 'Fjellström', null, 'Mölndal');

UPDATE KlassenTBL
SET [Ålder] = 31,
	[Hemort] = 'Göteborg'
WHERE [Id] = 3;

SELECT [Förnamn] FROM KlassenTBL
WHERE [Förnamn] LIKE '%n%';

SELECT * FROM KlassenTBL;