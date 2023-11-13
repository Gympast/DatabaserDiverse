USE everyloop

SELECT 
*
FROM company.orders
SELECT * FROM company.products
SELECT * FROM Company.orders


SELECT * FROM Company.
SELECT * FROM company.customers


--1 Företagets totala produktkatalog består av 77 unika produkter. Om vi kollar bland våra ordrar, 
--hur stor andel av dessa produkter har vi någon gång leverarat till London?

DECLARE @uniqueProds int = (SELECT COUNT(DISTINCT(company.products.ProductName)) from company.products)

SELECT	CAST(COUNT(DISTINCT(company.products.ProductName)) as FLOAT) / @uniqueProds * 100 
FROM	company.products
JOIN	company.order_details ON company.products.Id = company.order_details.ProductId
JOIN	[company].[orders] ON company.[orders].Id = company.order_details.OrderId
WHERE ShipCity LIKE 'London'

--2 Till vilken stad har vi levererat flest unika produkter?

SELECT	TOP 1 orders.ShipCity, COUNT(DISTINCT products.ProductName) AS OrderCount
FROM	company.products
JOIN	company.order_details ON products.Id = order_details.ProductId
JOIN	company.orders ON orders.Id = order_details.OrderId
GROUP BY orders.ShipCity
ORDER BY OrderCount desc;


--3 Av de produkter som inte längre finns I vårat sortiment, hur mycket har vi sålt för totalt till Tyskland?

SELECT SUM(order_details.UnitPrice * Quantity)
FROM company.products
JOIN company.order_details ON products.Id = order_details.ProductId
JOIN company.orders on orders.Id = order_details.OrderId
WHERE products.Discontinued > 0 AND orders.ShipCountry LIKE 'Germany'


--4 För vilken produktkategori har vi högst lagervärde?

SELECT categories.CategoryName , SUM(products.UnitPrice * products.UnitsInStock) AS StorageValue
FROM company.products
JOIN company.categories ON products.CategoryId = categories.Id
GROUP BY categories.CategoryName
ORDER BY StorageValue DESC

--5 Från vilken leverantör har vi sålt flest produkter totalt under sommaren 2013?

SELECT DISTINCT CompanyName, SUM(order_details.Quantity) AS SoldUnits
FROM company.suppliers
JOIN company.products ON products.SupplierId = suppliers.Id
JOIN company.order_details ON order_details.ProductId = products.Id
JOIN company.orders ON orders.Id = order_details.OrderId
WHERE ShippedDate BETWEEN '2013-06%' AND '2013-08%'
GROUP BY CompanyName
ORDER BY SoldUnits DESC

DECLARE @playlist varchar(max) = 'Heavy Metal Classic'

SELECT music.albums
SET @playlist = 'select albums'

PRINT @playlist;


DECLARE @noArtists int;

SET @noArtists = (SELECT COUNT(music.artists.ArtistId) from music.artists);

PRINT @noArtists;

 SELECT * FROM company.order_details
  SELECT * FROM company.orders

--1. Företagets totala produktkatalog består av 77 unika produkter. Om vi kollar bland våra ordrar, 
--hur stor andel av dessa produkter har vi någon gång leverarat till London?

SELECT DISTINCT company.orders.EmployeeId, DISTINCT products.
FROM company.products
JOIN company.order_details ON company.order_details.ProductId = company.products.Id
JOIN company.orders ON company.orders.Id = company.order_details.OrderId
WHERE ShipCity = 'London'


--2.Till vilken stad har vi levererat flest unika produkter?
--3. Av de produkter som inte längre finns I vårat sortiment, hur mycket har vi sålt för totalt till Tyskland?
--4. För vilken produktkategori har vi högst lagervärde?
--5. Från vilken leverantör har vi sålt flest produkter totalt under sommaren 2013?




SELECT * FROM music.playlist_track
SELECT * FROM music.albums
SELECT * FROM music.artists
SELECT *FROM music.tracks
SELECT * FROM music.genres

--1. Av alla audiospår, vilken artist har längst total speltid?

declare @playlist varchar(max) = 'Heavy Metal Classic';

	SELECT
	music.genres.Name AS Genre,
	music.artists.Name As Artist,
	music.albums.Title AS Album,
	music.tracks.Name AS Track,
	SUBSTRING(CONVERT(varchar, DATEADD(MILLISECOND,music.tracks.Milliseconds,''),8),4,6) AS Length,
	CONCAT(ROUND((CAST (music.tracks.Bytes AS FLOAT)/1024/1024),1,1), ' MiB') AS Size,
	music.tracks.Composer AS Composer
	FROM music.artists
	JOIN music.albums ON music.artists.ArtistId = music.albums.ArtistId
	JOIN music.tracks ON music.tracks.AlbumId = music.albums.AlbumId
	JOIN music.genres ON music.tracks.GenreId = music.genres.GenreId
	JOIN music.playlist_track ON music.playlist_track.TrackId = music.tracks.TrackId
	JOIN music.playlists ON music.playlists.PlaylistId = music.playlist_track.PlaylistId
WHERE music.playlists.Name = @playlist
	


SELECT top(1) 
music.artists.[Name], 
DATEADD(MILLISECOND, SUM(music.tracks.Milliseconds),'') AS PlayTime
FROM music.artists
JOIN music.albums ON music.artists.ArtistId = music.albums.ArtistId
JOIN music.tracks ON music.tracks.AlbumId = music.albums.AlbumId
GROUP BY music.artists.[Name]
ORDER BY PlayTime DESC


SELECT top(1) 
music.artists.[Name], 
DATEADD(MILLISECOND, SUM(music.tracks.Milliseconds),0 ) AS PlayTime,
CONVERT(varchar,DATEADD(MILLISECOND, AVG(music.tracks.milliseconds),''),8) AS Average
FROM music.artists
JOIN music.albums ON music.artists.ArtistId = music.albums.ArtistId
JOIN music.tracks ON music.tracks.AlbumId = music.albums.AlbumId
GROUP BY music.artists.[Name]
ORDER BY PlayTime DESC

--2. Vad är den genomsnittliga speltiden på den artistens låtar?
--3. Vad är den sammanlagda filstorleken för all video?
--4. Vilket är det högsta antal artister som finns på en enskild spellista?
--5. Vilket är det genomsnittliga antalet artister per spellista?


SELECT
SUM(CAST (music.tracks.bytes AS FLOAT))/1024/1024/1024 AS GigabyteTotal
FROM music.media_types
JOIN music.tracks ON music.media_types.MediaTypeId = music.tracks.MediaTypeId
WHERE music.media_types.MediaTypeId = 3

SELECT * FROM music.playlists
SELECT * FROM music.playlist_track
SELECT * FROM music.tracks


DECLARE @NumberOfArtists int = (SELECT Count(DISTINCT music.artists.Name) FROM music.artists),
		@NumberOfPlaylists int = (SELECT COUNT(DISTINCT music.playlists.PlaylistId) FROM music.playlists)
SELECT COUNT(DISTINCT music.artists.Name) AS NumberOfArtists, 
music.playlists.Name,
@NumberOfArtists / @NumberOfPlaylists AS AVERAGE
FROM music.playlists
JOIN music.playlist_track ON music.playlists.PlaylistId = music.playlist_track.PlaylistId
JOIN music.tracks ON music.tracks.TrackId = music.playlist_track.TrackId
JOIN music.albums ON music.albums.AlbumId = music.tracks.AlbumId
JOIN music.artists ON music.artists.ArtistId = music.albums.ArtistId
GROUP BY music.playlists.Name
ORDER BY NumberOfArtists DESC


SELECT * FROM Elements