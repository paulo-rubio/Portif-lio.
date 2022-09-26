SELECT art.artist_name AS 'artista',
    alb.album_name AS 'album',
    COUNT(*) AS 'seguidores'
FROM 
    SpotifyClone.artist art 
    INNER JOIN SpotifyClone.album alb ON art.artist_id = alb.artist_id
    INNER JOIN SpotifyClone.followers f ON art.artist_id = f.artist_id
GROUP BY 
	alb.album_id
ORDER BY 
	seguidores DESC,
    art.artist_name,
    alb.album_name;