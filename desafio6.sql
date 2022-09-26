SELECT
    MIN(s.subscription_price) AS 'faturamento_minimo',
    MAX(s.subscription_price) AS 'faturamento_maximo',
    CONVERT(ROUND(AVG(s.subscription_price), 2), CHAR) AS 'faturamento_medio',
    CONVERT(ROUND(SUM(s.subscription_price), 2), CHAR) AS 'faturamento_total'
FROM 
	SpotifyClone.user u
    INNER JOIN SpotifyClone.subscription s ON u.subscription_id = s.subscription_id;


