CREATE TABLE game_total_countries SELECT game,
COUNT(DISTINCT noc) AS Number
FROM olympics_history
GROUP BY game
ORDER BY game ASC;
WITH t1 AS (SELECT game, Number FROM  game_total_countries where Number
    = (select max(Number) from game_total_countries) ),
t2 AS (SELECT game, Number FROM  game_total_countries where Number
    = (select min(Number) from game_total_countries) )
SELECT
    t1.game AS GAME, t1.Number AS MAX_Number, t2.game AS GAME, t2.Number AS MIN_Number
FROM t1 LEFT JOIN t2 ON 1=1