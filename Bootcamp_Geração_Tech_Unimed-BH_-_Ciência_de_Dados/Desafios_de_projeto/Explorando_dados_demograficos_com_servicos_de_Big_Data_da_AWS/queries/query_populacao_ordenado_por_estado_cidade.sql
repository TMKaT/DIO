select state, city,
	sum(population) as populacao
from "populationdb"."population"
group by city, state
order by state, city;

