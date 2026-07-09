SELECT Name
FROM genres;

SELECT FirstName, LastName, Country, State, City
FROM customers
ORDER BY
    Country ASC,
    State ASC,
    City ASC;

SELECT Name, UnitPrice
FROM tracks
ORDER BY UnitPrice DESC
LIMIT 10;

SELECT FirstName || ' ' || LastName as Nome_Completo, Title, HireDate
FROM employees
ORDER BY HireDate ASC
LIMIT 3;

SELECT Name, Milliseconds
FROM tracks
ORDER BY Milliseconds DESC
LIMIT 1 OFFSET 4;