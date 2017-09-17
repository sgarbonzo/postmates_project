SELECT *
	,rank() OVER (
		ORDER BY num_deliveries DESC
		) AS rank ---number deliveries by day ranked
FROM (
	SELECT DATE (when_the_delivery_started::DATE) AS day
		,count(DISTINCT delivery_id) AS num_deliveries
	FROM gar_bonzo.postmates_new
	GROUP BY 1
	) b
ORDER BY 1 ASC;



SELECT extract(dow FROM when_the_delivery_started::TIMESTAMP) AS day_of_week
	,AVG(num_orders) AS num_orders ----average order by day of week. Sunday highest followed by weekend. 0 is sunday Lazy sunday + weeked? more time? 
FROM (
	SELECT DATE (when_the_delivery_started) AS when_the_delivery_started
		,count(DISTINCT delivery_id) AS num_orders
	FROM gar_bonzo.postmates_new
	GROUP BY 1
	) b
GROUP BY 1
ORDER BY 1 DESC;



SELECT DATE_TRUNC('w', when_the_delivery_started::TIMESTAMP) --- week over week analysis isn't good option here given the dataset. each week starts on a monday//demonstrates that the number of days in the week were not equal because only datay for a month. 
	,count(DISTINCT (DATE (when_the_delivery_started)))
FROM gar_bonzo.postmates_new
GROUP BY 1
ORDER BY 1
	,2 ASC;




