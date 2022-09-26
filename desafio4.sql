SELECT u.name AS 'usuario',
	IF(
		YEAR(MAX(h.play_date)) >= 2021,
        'Usuário ativo',
        'Usuário inativo'
    ) AS 'status_usuario'
FROM 
	SpotifyClone.user u
    INNER JOIN SpotifyClone.history h ON u.user_id = h.user_id
GROUP BY u.name
ORDER BY u.name