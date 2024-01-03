SELECT game, COUNT(DISTINCT sport) AS no_of_sports
    FROM olympics_history
	GROUP BY game
    ORDER BY no_of_sports desc;