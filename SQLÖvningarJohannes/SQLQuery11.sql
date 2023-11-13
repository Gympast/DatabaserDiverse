USE everyloop;

--SELECT * FROM dbo.GameOfThrones;

--SELECT Title,
--CONCAT('S', FORMAT(Season, '00'), 'E', FORMAT(EpisodeInSeason, '00'))
--AS Episode

--FROM GameOfThrones;

SELECT * INTO Users2 FROM Users;

SELECT * FROM Users2;

UPDATE Users2
SET UserName =

LOWER (CONCAT (LEFT(FirstName, 2), (LEFT(LastName, 2))))

FROM Users2;

SELECT * INTO Airports2 FROM Airports;

UPDATE Airports2

SET C