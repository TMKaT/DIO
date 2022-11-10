select state, sum(population)
    from "populationdb"."population"
where state='São Paulo'
group by state;

