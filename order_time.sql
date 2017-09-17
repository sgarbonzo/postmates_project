SELECT AVG(CASE 
			WHEN how_long_it_took_to_order_seconds = 0
				THEN 469
			ELSE how_long_it_took_to_order_seconds
			END) / 60 ---
FROM gar_bonzo.postmates_new;


SELECT avg(how_long_it_took_to_order_seconds) / 60 ---spot checking with zeros. included= 3.9min
FROM gar_bonzo.postmates_new;
