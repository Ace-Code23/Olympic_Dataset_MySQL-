WITH t1 AS
	(SELECT team, COUNT(1) AS Medal_Count
	FROM olympics_history
	WHERE medal in ('Gold' , 'Silver' , 'Bronze')
	GROUP BY team
	ORDER BY Medal_Count DESC),
t2 AS
	(SELECT *, DENSE_RANK() OVER (ORDER BY Medal_Count DESC) AS rnk
    FROM t1)
SELECT *
FROM t2
WHERE rnk <= 5;