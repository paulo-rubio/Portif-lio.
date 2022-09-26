SELECT m.music_name AS 'cancao',
	COUNT(*) AS 'reproducoes'
FROM 
	SpotifyClone.music m
    INNER JOIN SpotifyClone.history h ON m.music_id = h.music_id
GROUP BY m.music_name
ORDER BY reproducoes DESC,
m.music_name
LIMIT 2;