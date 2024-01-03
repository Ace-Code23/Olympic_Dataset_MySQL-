SELECT game,
COUNT(DISTINCT noc) AS Number
FROM olympics_history
GROUP BY game
ORDER BY game ASC;
