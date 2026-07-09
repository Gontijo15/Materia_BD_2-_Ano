/* Liste os nomes dos albúns e a quantidade de músicas em cada um deles */

SELECT albums.Title, COUNT(tracks.TrackId) AS "Quantidade de músicas"
FROM tracks
INNER JOIN albums
ON tracks.AlbumId = albums.AlbumId
GROUP BY tracks.AlbumId;