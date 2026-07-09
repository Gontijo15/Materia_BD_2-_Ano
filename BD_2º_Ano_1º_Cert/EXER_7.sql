SELECT FirstName, LastName, ROUND(AVG(Total), 2) AS "MÉDIA"
FROM customers
INNER JOIN invoices
ON customers.CustomerId = invoices.CustomerId
GROUP BY invoices.CustomerId
ORDER BY AVG(Total) DESC;

SELECT FirstName, LastName, MAX(Total) AS "MÁXIMO"
FROM customers
INNER JOIN invoices
ON customers.CustomerId = invoices.CustomerId
GROUP BY invoices.CustomerId
ORDER BY MAX(Total) DESC;

SELECT FirstName, LastName, MIN(Total) AS "MÍNIMO"
FROM customers
INNER JOIN invoices
ON customers.CustomerId = invoices.CustomerId
GROUP BY invoices.CustomerId
ORDER BY MIN(Total) DESC;

SELECT FirstName, LastName, (MAX(Total) - MIN(Total)) AS "DIFERENÇA"
FROM customers
INNER JOIN invoices
ON customers.CustomerId = invoices.CustomerId
GROUP BY invoices.CustomerId
ORDER BY (MAX(Total) - MIN(Total)) DESC;