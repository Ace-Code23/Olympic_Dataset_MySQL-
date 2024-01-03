WITH t1 AS
	(SELECT sport, COUNT(DISTINCT game) AS no_of_games
    FROM olympics_history
	GROUP BY sport),
t2 AS
	(SELECT distinct game, sport 
    FROM olympics_history
	ORDER BY game)
SELECT t1.*, t2.game
      FROM t1
      JOIN t2 ON t2.sport = t1.sport
      WHERE t1.no_of_games = 1
      ORDER BY t2.game;