

SELECT * FROM gar_bonzo.postmates_new
where when_the_jumpman_arrived_at_pickup is not null
limit 10;


select min(when_the_delivery_started::date), max(when_the_delivery_started::date) 
from gar_bonzo.postmates_new;   ---range is month of october 1st -30th

select count(*) from 
gar_bonzo.postmates_new; ---5983 total rows

select count(distinct delivery_id), 
from gar_bonzo.postmates_new;    ---5214 disctinct deliver_id

select delivery_id, count(*) number ---checking to see if more than one entry per delivery_id//if so why?
from gar_bonzo.postmates_new
group by 1
order by 2 desc;

select * from gar_bonzo.postmates_new   --- his delivery id has 5 entries for the same delivery, but really same delivery. 
where delivery_id = 1460296;
