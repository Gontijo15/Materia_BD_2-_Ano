SELECT
    name
FROM artists
WHERE
    name LIKE 'A%'
ORDER BY Name ASC;

SELECT
    FirstName,
    LastName
FROM customers
WHERE
    LastName LIKE '%t'
ORDER BY FirstName ASC;

SELECT
    Name
FROM tracks
WHERE
    Name LIKE '%Of%'
ORDER BY Name ASC;

SELECT
    FirstName,
    LastName
FROM customers
WHERE
    FirstName LIKE 'e%' AND LastName LIKE '%s'
ORDER BY FirstName ASC;

SELECT
    Name,
    AlbumId
FROM tracks
WHERE
    AlbumId BETWEEN 4 AND 7
ORDER BY AlbumId ASC;

SELECT
    FirstName,
    date(BirthDate) BirthDate
FROM employees
WHERE
    BirthDate NOT BETWEEN '1960-01-01' AND '1970-12-31'
ORDER BY BirthDate ASC;

SELECT 
    FirstName,
    City
FROM customers
WHERE City NOT IN ("São Paulo","Rio de Janeiro")
ORDER BY City ASC;