select state, sum(population) as populacao_estado
	from "populationdb"."population"
group by state
order by populacao_estado desc;

