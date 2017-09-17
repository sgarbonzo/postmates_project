
SELECT vehicle_type
	,avg(delivery_min) AS delivery_duration
	,count(DISTINCT delivery_id) AS num_deliveries
FROM (
	SELECT EXTRACT(EPOCH FROM (when_the_jumpman_arrived_at_dropoff::TIMESTAMP - when_the_jumpman_left_pickup::TIMESTAMP)) / 60 AS delivery_min
		,delivery_id
		,when_the_jumpman_arrived_at_dropoff
		,when_the_jumpman_left_pickup
		,vehicle_type
	FROM gar_bonzo.postmates_new
	) b
GROUP BY 1;
