SELECT count(DISTINCT customer_id)
FROM gar_bonzo.postmates_new;

SELECT DISTINCT (customer_id)
	,count(DISTINCT delivery_id) AS num_orders ---subquery for below
FROM gar_bonzo.postmates_new
GROUP BY 1;

SELECT CASE 
		WHEN num_orders = 1
			THEN '1 delivery'
		WHEN num_orders = 2
			THEN '2 deliveries' ---most are low frequent delivers. What percent of the total do they make up? 
		WHEN num_orders = 3
			THEN '3 deliveries'
		WHEN num_orders = 4
			THEN '4 deliveries'
		WHEN num_orders = 5
			THEN '5 deliveries'
		WHEN num_orders > 5
			THEN '5+'
		END AS delivery_count
	,COUNT(DISTINCT customer_id) AS num_customers
FROM (
	SELECT DISTINCT (customer_id)
		,count(DISTINCT delivery_id) AS num_orders
	FROM gar_bonzo.postmates_new ---inner query shows num_deliveries per jumpan range
	GROUP BY 1
	ORDER BY 2 DESC
	) b
GROUP BY 1;
