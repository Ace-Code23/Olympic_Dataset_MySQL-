WITH t1 AS
	(SELECT COUNT(DISTINCT game) AS total_summer_games
	FROM olympics_history
	WHERE season ='Summer' ),
t2 AS
	(SELECT DISTINCT sport, game FROM olympics_history
    WHERE season ='Summer' ),
t3 AS
	(SELECT sport, COUNT(game) AS no_of_games FROM t2
    GROUP BY sport)
SELECT * FROM t3
JOIN t1 ON t1.total_summer_games = t3.no_of_games;