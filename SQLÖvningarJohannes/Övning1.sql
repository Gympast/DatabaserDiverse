--USE everyloop;

--SELECT Title, CONCAT('S0', Season, 'E' , FORMAT(EpisodeInSeason, '00')) AS Episode
--FROM GameOfThrones

--SELECT * INTO USERS2 FROM Users;

--SELECT * INTO Users2 FROM Users

--SELECT * FROM Users

--UPDATE Users2
--SET UserName = Lower(SUBSTRING(FirstName, 1, 2) + SUBSTRING(LastName, 1, 2))

--SELECT * FROM Users2

--SELECT * INTO Airports2 FROM Airports
--DROP TABLE Airports2
--SELECT * FROM Airports2

--UPDATE Airports2
--SET [Time] = '-'
--WHERE [Time] IS NULL

--UPDATE Airports2
--SET [DST] = '-'
--WHERE [DST] IS NULL


--SELECT * FROM airports2

--SELECT * FROM Elements

--SELECT * INTO Elements2 FROM Elements

--SELECT * FROM Elements2

--DELETE Elements2
--WHERE [Name] IN ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
--OR [NAME] LIKE '[dkmou]%'

--SELECT * FROM Elements
--SELECT * FROM Elements2
--ORDER BY [Name]

--SELECT Symbol, [Name]
--INTO ElementsStripped
--FROM Elements

--SELECT * FROM ElementsStripped

--ALTER TABLE ElementsStripped
--ADD [Starts_with] nvarchar(max)

--UPDATE ElementsStripped
--SET Starts_With =
--CASE
--	WHEN (Symbol = SUBSTRING([Name], 1, 1)) THEN 'YES'
--	WHEN (Symbol = SUBSTRING([Name], 1, 2)) THEN 'YES'
--	ELSE 'NO'
--END

--SELECT * FROM ElementsStripped

--UPDATE ElementsStripped
--SET Starts_With = 
--	CASE
--		WHEN [Name] = CONCAT(Symbol, '%') THEN 'YES'
--		ELSE 'NO'
--	END

--SELECT [Name], [Red], [Green], [Blue] INTO Colors2 FROM Colors

--SELECT * FROM Colors


--select [Name], 
--(CONCAT('#', FORMAT(Red, 'X2'), FORMAT(Green, 'X2'), FORMAT(Blue, 'X2'))) AS Code,
--[Red], [Green], [Blue]
--from Colors2

SELECT [Integer], [String] INTO [Types2] FROM [Types]

SELECT * FROM [Types]

SELECT [Integer],
(CAST([Integer] AS Float) / 100) AS [Float],
[String],
DATETIME2FROMPARTS(2019, 01, Integer, 09, Integer, 0, 0, 6) AS [DateTime],
(CASE
	WHEN [Integer] % 2 = 0 THEN 0
	ELSE 1
	END) AS Bool
FROM [Types2]

SELECT * FROM [Types]
