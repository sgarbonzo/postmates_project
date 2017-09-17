
----jumpman w/ most deliveries. 
SELECT avg(num_deliveries) ---9 deliveries on average per month per jumper. MAX was 67. Min was 1 because every entry in table signals a delivery. How can we boost that? 
FROM (
	SELECT DISTINCT (jumpman_id)
		,count(DISTINCT delivery_id) AS num_deliveries
	FROM gar_bonzo.postmates_new
	GROUP BY 1
	ORDER BY 2 ASC
	) b;

SELECT CASE 
		WHEN num_deliveries BETWEEN 1
				AND 15
			THEN '0-14 deliveries'
		WHEN num_deliveries BETWEEN 16
				AND 30
			THEN '15-30 deliveries' ---most are low frequent delivers. What percent of the total do they make up? 
		WHEN num_deliveries BETWEEN 31
				AND 45
			THEN '31-45 deliveries'
		WHEN num_deliveries >= 46
			THEN '46+'
		END AS delivery_count_group
	,COUNT(DISTINCT jumpman_id) AS num_jumpman
FROM (
	SELECT DISTINCT (jumpman_id)
		,count(DISTINCT delivery_id) AS num_deliveries
	FROM gar_bonzo.postmates_new ---inner query shows num_deliveries per jumpan range
	GROUP BY 1
	ORDER BY 2 DESC
	) b
GROUP BY 1;
