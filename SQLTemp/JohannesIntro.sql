--CREATE DATABASE KlassenDb;

USE KlassenDb;

--CREATE TABLE KlassenTBL(
--[Id] int,
--[F�rnamn] nvarchar(max) NOT NULL,
--[Efternamn] nvarchar(max) NOT NULL,
--[�lder] int,
--[Hemort] nvarchar(max) NOT NULL
--Primary Key (Id)
--);

--INSERT INTO KlassenTBL
--VALUES	(1, 'Johannes', 'Fredriksson', 37, 'Fr�lunda'),
--		(2, 'Jing', 'Leng', null, 'Hisingen'),
--		(3, 'Andreas', 'Nordfeldt', null, 'Hisingen'),
--		(4, 'Linus', 'Fjellstr�m', null, 'M�lndal');

UPDATE KlassenTBL
SET [�lder] = 31,
	[Hemort] = 'G�teborg'
WHERE [Id] = 3;

SELECT [F�rnamn] FROM KlassenTBL
WHERE [F�rnamn] LIKE '%n%';

SELECT * FROM KlassenTBL;