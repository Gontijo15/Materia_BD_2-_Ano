SELECT Title AS "Álbum", Name AS "Artista"
FROM artists
LEFT JOIN albums
ON albums.ArtistId = artists.ArtistId
WHERE Name LIKE "%ão%";

SELECT employees.FirstName, COUNT(customers.CustomerId) AS Suporte_Clientes
FROM employees
LEFT JOIN customers
ON customers.SupportRepId = employees.EmployeeId
GROUP BY customers.SupportRepId
ORDER BY employees.FirstName ASC;