SELECT
	COUNT(DISTINCT m.music_id) AS 'cancoes',
	COUNT(DISTINCT ar.artist_id) AS "artistas",
	COUNT(DISTINCT al.album_id) AS "albuns"
FROM
	SpotifyClone.music m
	INNER JOIN SpotifyClone.album al ON m.album_id = al.album_id
	INNER JOIN SpotifyClone.artist ar ON al.artist_id = ar.artist_id;