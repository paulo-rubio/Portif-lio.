SELECT art.artist_name AS 'artista',
    alb.album_name AS 'album'
FROM 
    SpotifyClone.artist art 
    INNER JOIN SpotifyClone.album alb ON art.artist_id = alb.artist_id
WHERE
    art.artist_name = 'Elis Regina'
ORDER BY 
    art.artist_name;
