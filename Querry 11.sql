WITH t1 AS
	(SELECT name, COUNT(1) AS Gold_Count
	FROM olympics_history
	WHERE medal = 'Gold'
	GROUP BY name
	ORDER BY Gold_Count DESC),
t2 AS
	(SELECT *, DENSE_RANK() OVER (ORDER BY Gold_Count DESC) AS rnk
    FROM t1)
SELECT *
FROM t2
WHERE rnk <= 5;