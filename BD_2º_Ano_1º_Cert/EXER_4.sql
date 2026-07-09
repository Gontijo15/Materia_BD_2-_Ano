SELECT albums.Title, artists.Name
FROM albums
INNER JOIN artists
ON artists.ArtistId = albums.ArtistId
ORDER BY artists.Name ASC;

SELECT albums.Title, artists.Name
FROM albums
INNER JOIN artists
ON artists.ArtistId = albums.ArtistId
WHERE artists.Name LIKE "%ão%"
ORDER BY artists.Name ASC;

SELECT artists.Name, COUNT(albums.AlbumId) AS QTD_Albuns
FROM albums
INNER JOIN artists
ON artists.ArtistId = albums.ArtistId
GROUP BY albums.ArtistId
ORDER BY artists.Name ASC;

SELECT customers.FirstName, employees.FirstName
FROM customers
INNER JOIN employees
ON customers.SupportRepId = employees.EmployeeId
ORDER BY employees.FirstName ASC;

SELECT employees.FirstName, COUNT(customers.CustomerId) AS Suporte_Clientes
FROM customers
INNER JOIN employees
ON customers.SupportRepId = employees.EmployeeId
GROUP BY customers.SupportRepId
ORDER BY employees.FirstName ASC;