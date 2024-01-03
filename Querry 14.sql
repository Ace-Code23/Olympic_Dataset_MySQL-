SELECT nr.region AS country,
SUM( CASE WHEN medal = 'Gold' THEN 1 ELSE 0 END) Gold,
SUM( CASE WHEN medal = 'Silver' THEN 1 ELSE 0 END) Silver,
SUM( CASE WHEN medal = 'Bronze' THEN 1 ELSE 0 END) Bronze
FROM olympics_history oh
JOIN olympics_history_noc_regions nr on nr.noc = oh.noc
WHERE medal <> 'NA'
GROUP BY country
ORDER BY Gold DESC, Silver DESC, Bronze DESC;