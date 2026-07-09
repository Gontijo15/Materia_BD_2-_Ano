SELECT *
FROM invoices
WHERE CustomerId IN (
    SELECT CustomerId
    FROM customers
    WHERE Country = "Brazil"
);

SELECT Name, Composer
FROM tracks
WHERE AlbumId IN (
    SELECT AlbumId
    FROM albums
    WHERE ArtistId = (
        SELECT ArtistId
        FROM artists
        WHERE Name = "Milton Nascimento"
    )
);

SELECT *
FROM invoice_items
WHERE InvoiceId IN (
    SELECT InvoiceId
    FROM invoices
    WHERE CustomerId IN (
        SELECT CustomerId
        FROM customers
        WHERE State = "SP"
    )
);