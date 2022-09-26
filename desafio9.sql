SELECT COUNT(*) AS "quantidade_musicas_no_historico"
FROM 
    SpotifyClone.user u
    INNER JOIN SpotifyClone.history h ON u.user_id = h.user_id
WHERE 
    u.name = 'Barbara Liskov';