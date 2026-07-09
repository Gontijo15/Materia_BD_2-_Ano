SELECT Title, SUM(Milliseconds/1000) AS "Duração em segundos", COUNT(TrackId)
FROM albums
LEFT JOIN tracks
ON albums.AlbumId = tracks.AlbumId
GROUP BY tracks.AlbumId
ORDER BY SUM(Milliseconds) DESC;