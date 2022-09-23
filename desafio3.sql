SELECT
	u.name AS 'usuario',
	COUNT(*) AS 'qt_de_musicas_ouvidas',
	ROUND(SUM(m.music_length / 60), 2) AS 'total_minutos'
FROM
	SpotifyClone.user u
	INNER JOIN SpotifyClone.history h ON u.user_id = h.user_id
	INNER JOIN SpotifyClone.music m ON h.music_id = m.music_id
GROUP BY
	u.name
ORDER BY
	u.name;