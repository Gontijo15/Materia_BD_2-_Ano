SELECT FirstName, LastName, SUM(Total)
FROM customers
INNER JOIN invoices
ON customers.CustomerId = invoices.CustomerId
GROUP BY invoices.CustomerId
ORDER BY SUM(Total) DESC;

SELECT FirstName, LastName, SUM(Total)
FROM customers
INNER JOIN invoices
ON customers.CustomerId = invoices.CustomerId
GROUP BY invoices.CustomerId
HAVING SUM(Total) >= 38.00 AND SUM(Total) <= 40.00
/* HAVING SUM(Total) BETWEEN 38.00 AND 40.00 */
ORDER BY SUM(Total) DESC;

SELECT Name, AlbumId
FROM artists
LEFT JOIN albums
ON artists.ArtistId = albums.ArtistId
WHERE AlbumId IS NULL
ORDER BY Name ASC;