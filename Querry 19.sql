WITH t1 AS
		(SELECT sport, COUNT(1) AS total_medals
		FROM olympics_history
		WHERE medal <> 'NA'
		AND team = 'India'
		GROUP BY sport
		ORDER BY total_medals DESC),
	t2 AS
		(SELECT *, RANK() OVER(ORDER BY total_medals DESC) AS rnk
        FROM t1)
SELECT sport, total_medals
FROM t2
WHERE rnk = 1;
