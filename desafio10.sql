SELECT m.music_name AS 'nome',
    COUNT(*) AS 'reproducao'
FROM SpotifyClone.music m
    INNER JOIN SpotifyClone.history h ON m.music_id = h.music_id
    INNER JOIN SpotifyClone.user u ON h.user_id = u.user_id
    INNER JOIN SpotifyClone.subscription sub ON u.subscription_id = sub.subscription_id
WHERE 
    sub.subscription_name IN ('gratuito', 'pessoal')
GROUP BY 
    m.music_id
ORDER BY
    m.music_name