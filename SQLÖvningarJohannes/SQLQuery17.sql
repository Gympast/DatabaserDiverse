DECLARE @GoT varchar(max) = ''


SELECT @GoT += CONCAT('Säsong ', [Season], ' sändes från ', 
FORMAT(MIN([Original air date]),'MMMM', 'SV'),
' till ',
FORMAT(MAX([Original air date]),'MMMM yyyy','SV'),
'. Totalt sändes ', COUNT (*), ' avsnitt, som igenomsnitt sågs av ', 
ROUND(Avg([U.S. viewers(millions)]),1), ' miljoner männsikor i USA', char(13))
FROM GameOfThrones
Group BY Season
PRINT @GoT

DECLARE @GoT varchar(max) = ''
SELECT @GoT += CONCAT('Säsong ', [Season], ' sändes från ', 
FORMAT(MIN([Original air date]),'MMMM', 'SV'),
' till ',
FORMAT(MAX([Original air date]),'MMMM yyyy','SV'),
'. Totalt sändes ', COUNT (*), ' avsnitt, som igenomsnitt sågs av ', 
ROUND(Avg([U.S. viewers(millions)]),1), ' miljoner männsikor i USA', char(13))
FROM GameOfThrones
Group BY Season
PRINT @GoT

--Ta ut (select) alla användare i tabellen ”Users” så du får tre kolumner: ”Namn” som har fulla namnet; 
--”Ålder” som visar hur många år personen är idag (ex. ’45 år’);0
--”Kön” som visar om det är en man eller kvinna. Sortera raderna efter för- och efternamn.

SELECT * FROM Users
SELECT (CONCAT(FirstName, ' ' ,LastName)) AS [Name],
CONCAT(DATEDIFF(year, CONVERT(date,SUBSTRING(ID, 1, 6),112), GETDATE()), ' År') AS Ålder,
CASE
	WHEN LEFT(RIGHT(ID, 2),1)%2 = 0 THEN 'Kvinna'
	ELSE 'Man'
	End
 AS Kön 
FROM Users
ORDER BY FirstName, LastName

--Ta ut en lista över regioner i tabellen ”Countries” där det för varje region framgår regionens namn, 
--antal länder i regionen, totalt antal invånare, total area, befolkningstätheten med 2 decimaler, 
--samt spädbarnsdödligheten per 100.000 födslar avrundat till heltal.



SELECT * FROM Countries

SELECT Region,
COUNT(Country) AS [Antal Länder],
SUM(CAST([Population] AS BIGINT)) AS [Antal Invånare],
SUM([Area (sq# mi#)]) AS [Total Area],
ROUND(SUM(CAST([Population]AS float))/SUM(CAST([Area (sq# mi#)] AS float)),2) AS Befolkningstäthet,
ROUND
	(SUM
		(
			(CAST
				(REPLACE
					(
					[Infant mortality (per 1000 births)], ',', '.'
					) AS float
				)* 100
			)
		)
	/ COUNT([REGION]),2
	) AS Spädbarnsdödlighet
FROM Countries
GROUP BY Region