WITH t1 AS
			(select name, sex, team, game, sport, city, medal,
			(CASE WHEN age = 'NA' then 0 ELSE age END) AS age
			FROM olympics_history),
	t2 AS
	(SELECT * ,
    RANK() OVER (ORDER BY age DESC) AS rnk
	FROM t1
	WHERE medal= "gold")
SELECT * FROM t2
WHERE rnk=1;