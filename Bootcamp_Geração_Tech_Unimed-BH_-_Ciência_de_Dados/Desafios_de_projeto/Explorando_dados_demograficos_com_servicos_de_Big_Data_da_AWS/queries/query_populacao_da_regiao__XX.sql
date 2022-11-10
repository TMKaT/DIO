select region, sum(population)
    from "populationdb"."population"
where region='Nordeste'
group by region;

