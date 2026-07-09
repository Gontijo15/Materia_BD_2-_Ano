SELECT Firstname, State
FROM customers
WHERE state = "SP";

SELECT Firstname, State
FROM customers
WHERE State = "SP" OR State = "RJ";

SELECT Firstname, State
FROM customers
WHERE State IN ("SP","RJ","DF");

SELECT AlbumId, Name, Milliseconds
FROM tracks
WHERE AlbumId IN (1);

SELECT AlbumId, Name, Milliseconds
FROM tracks
WHERE AlbumId IN (1) AND Milliseconds > 250000;

SELECT Composer, Bytes
FROM tracks
WHERE Composer = "Billy Corgan" AND Bytes < 9000000
ORDER BY Bytes ASC;

SELECT Name, AlbumId
FROM tracks
WHERE AlbumId = (
    SELECT AlbumId
    FROM albums
    WHERE Title = "Da Lama Ao Caos"
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

SELECT albums.Title, artists.Name
FROM albums
INNER JOIN artists
ON artists.ArtistId = albums.ArtistId;