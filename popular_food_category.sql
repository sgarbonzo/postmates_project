
SELECT *
	,rank() OVER (
		ORDER BY count DESC
		) AS rank ---italian district? what happened to pizza? Maybe they don't lover their pizza as much as they say
FROM (
	SELECT place_category
		,count(DISTINCT delivery_id)
	FROM gar_bonzo.postmates_new
	GROUP BY 1
	) AS category
WHERE place_category IS NOT NULL limit 15;
