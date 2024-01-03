WITH t1 AS
(SELECT sex, COUNT(1) as cnt
        	FROM olympics_history
        	GROUP BY sex),
t2 AS
(SELECT * , row_number() OVER(ORDER BY cnt DESC) AS rnk
FROM t1),
max_cnt AS
(SELECT cnt FROM t2 WHERE rnk = 1),
min_cnt AS
(SELECT cnt FROM t2 WHERE rnk = 2)
SELECT CONCAT('1 : ' ,  ROUND(max_cnt.cnt / min_cnt.cnt , 2)) AS female_male_ratio
FROM min_cnt, max_cnt;
