
SELECT pickup_place
	,COUNT(DISTINCT delivery_id) num_deliveries
	,AVG(delivery_min) avg_delivery_time
FROM (
	SELECT delivery_id
		,pickup_place
		,EXTRACT(EPOCH FROM (when_the_jumpman_arrived_at_dropoff::TIMESTAMP - when_the_jumpman_left_pickup::TIMESTAMP)) / 60 AS delivery_min
	FROM gar_bonzo.postmates_new
	GROUP BY 1
		,2
		,3
	) base
GROUP BY 1
ORDER BY num_deliveries DESC;
