USE BookStore

SELECT Stores.StoreId, StoreName, Title, Amount
FROM Stores
JOIN Inventory ON Inventory.StoreId = Stores.StoreId
JOIN Books ON Inventory.BookISBN13 = Books.ISBN13
WHERE (Stores.StoreId = 1
OR Stores.StoreId = 2)
AND Books.ISBN13 = 9780306823589
ORDER BY Stores.StoreId

EXECUTE MoveBooksBetweenStores @ToStore = 2, @FromStore = 1, @ISBN13 = 9780306823589, @Amount = 1


SELECT Stores.StoreId, StoreName, Title, Amount
FROM Stores
JOIN Inventory ON Inventory.StoreId = Stores.StoreId
JOIN Books ON Inventory.BookISBN13 = Books.ISBN13
WHERE (Stores.StoreId = 1
OR Stores.StoreId = 2)
AND Books.ISBN13 = 9780306823589
ORDER BY Stores.StoreId

SELECT Stores.StoreId, SUM(Books.Price * Amount) AS LagerSaldo, SUM(Inventory.Amount)
FROM Stores
JOIN Inventory ON Inventory.StoreId = Stores.StoreId
JOIN Books ON Books.ISBN13 = Inventory.BookISBN13
GROUP BY Stores.StoreId

