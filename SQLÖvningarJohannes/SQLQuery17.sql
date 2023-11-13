DECLARE @GoT varchar(max) = ''


SELECT @GoT += CONCAT('S�song ', [Season], ' s�ndes fr�n ', 
FORMAT(MIN([Original air date]),'MMMM', 'SV'),
' till ',
FORMAT(MAX([Original air date]),'MMMM yyyy','SV'),
'. Totalt s�ndes ', COUNT (*), ' avsnitt, som igenomsnitt s�gs av ', 
ROUND(Avg([U.S. viewers(millions)]),1), ' miljoner m�nnsikor i USA', char(13))
FROM GameOfThrones
Group BY Season
PRINT @GoT

DECLARE @GoT varchar(max) = ''
SELECT @GoT += CONCAT('S�song ', [Season], ' s�ndes fr�n ', 
FORMAT(MIN([Original air date]),'MMMM', 'SV'),
' till ',
FORMAT(MAX([Original air date]),'MMMM yyyy','SV'),
'. Totalt s�ndes ', COUNT (*), ' avsnitt, som igenomsnitt s�gs av ', 
ROUND(Avg([U.S. viewers(millions)]),1), ' miljoner m�nnsikor i USA', char(13))
FROM GameOfThrones
Group BY Season
PRINT @GoT

--Ta ut (select) alla anv�ndare i tabellen �Users� s� du f�r tre kolumner: �Namn� som har fulla namnet; 
--��lder� som visar hur m�nga �r personen �r idag (ex. �45 �r�);0
--�K�n� som visar om det �r en man eller kvinna. Sortera raderna efter f�r- och efternamn.

SELECT * FROM Users
SELECT (CONCAT(FirstName, ' ' ,LastName)) AS [Name],
CONCAT(DATEDIFF(year, CONVERT(date,SUBSTRING(ID, 1, 6),112), GETDATE()), ' �r') AS �lder,
CASE
	WHEN LEFT(RIGHT(ID, 2),1)%2 = 0 THEN 'Kvinna'
	ELSE 'Man'
	End
 AS K�n 
FROM Users
ORDER BY FirstName, LastName

--Ta ut en lista �ver regioner i tabellen �Countries� d�r det f�r varje region framg�r regionens namn, 
--antal l�nder i regionen, totalt antal inv�nare, total area, befolkningst�theten med 2 decimaler, 
--samt sp�dbarnsd�dligheten per 100.000 f�dslar avrundat till heltal.



SELECT * FROM Countries

SELECT Region,
COUNT(Country) AS [Antal L�nder],
SUM(CAST([Population] AS BIGINT)) AS [Antal Inv�nare],
SUM([Area (sq# mi#)]) AS [Total Area],
ROUND(SUM(CAST([Population]AS float))/SUM(CAST([Area (sq# mi#)] AS float)),2) AS Befolkningst�thet,
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
	) AS Sp�dbarnsd�dlighet
FROM Countries
GROUP BY Region