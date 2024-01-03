WITH t1 AS
		(SELECT CONCAT(game, " - ", nr.region) AS games_country, game,
		SUM( CASE WHEN medal = 'Gold' THEN 1 ELSE 0 END) Gold,
		SUM( CASE WHEN medal = 'Silver' THEN 1 ELSE 0 END) Silver,
		SUM( CASE WHEN medal = 'Bronze' THEN 1 ELSE 0 END) Bronze
		FROM olympics_history oh
		JOIN olympics_history_noc_regions nr on nr.noc = oh.noc
		WHERE medal <> 'NA'
		GROUP BY game, games_country
		ORDER BY games_country),
	t2 AS
		(SELECT Gold, Silver, Bronze, game, SUBSTRING(games_country, 1, POSITION(" - " IN games_country) - 1) AS games,
        SUBSTRING(games_country,  POSITION(" - " IN games_country) + 3) AS country
        FROM t1)
SELECT DISTINCT game,
CONCAT(FIRST_VALUE(Gold) OVER (PARTITION BY game ORDER BY Gold DESC),
		" - ",
		FIRST_VALUE(country) OVER (PARTITION BY game ORDER BY Gold DESC)) as Gold,
CONCAT(FIRST_VALUE(Silver) OVER (PARTITION BY game ORDER BY Silver DESC),
		" - ",
		FIRST_VALUE(country) OVER (PARTITION BY game ORDER BY Silver DESC)) as Gold,
CONCAT(FIRST_VALUE(Bronze ) OVER (PARTITION BY game ORDER BY Bronze DESC),
		" - ",
		FIRST_VALUE(country) OVER (PARTITION BY game ORDER BY Bronze DESC)) as Bronze
FROM t2
ORDER BY game;