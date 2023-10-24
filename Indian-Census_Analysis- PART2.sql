
select * from newschema.literacy;
select * from newschema.population;

-- INNER JOIN  JOINING TABLES

SELECT db2.District,db1.State,db2.Population,db1.Sex_Ratio,db1.Literacy,db1.Growth FROM
newschema.literacy db1  INNER JOIN newschema.population db2
ON db1.district=db2.district;

-- caluclating number of males and females usinf sex ratio formula
-- sexratio= no of females / no of males *1000
-- population = no of females + no of males
-- from formula
-- no of males=population/(1+sexratio)
-- no of females= (sexratio)*(population)/(1+population)

select c.state,round(sum(c.males*1000),0) as males ,round(sum(c.females*1000),0) as females from
(SELECT d.District,d.State,d.Population/(1+d.sex_ratio1) as males,(d.sex_ratio1)*(d.population)/(1+d.population) as females,d.population from
(SELECT db2.District,db1.State,db2.Population,db1.Sex_Ratio/1000 as sex_ratio1,db1.Literacy,db1.Growth FROM
newschema.literacy db1  INNER JOIN newschema.population db2
ON db1.district=db2.district ) as d) as c
group by c.state; 

-- Literacy rate
-- percent of population that can read or write
-- literact ratio=total literate people/total population*100


select e.state,sum(e.literate_population) as literate_population from
(select c.State,c.District,c.Population,c.Literacy,round(c.population*c.Literacy*100) as literate_population from
(SELECT db1.State,db2.District,db2.Population,db1.Literacy FROM
newschema.literacy db1  INNER JOIN newschema.population db2
ON db1.district=db2.district) as c) as e
group by e.state;

-- population census
-- population in previous census+growth*previous census=population
-- previous census=population/(1+growth)

(SELECT db1.State,db2.District,db2.Population,db1.growth,round(db2.population*db1.growth*100,0) as population_growth FROM
newschema.literacy db1  INNER JOIN newschema.population db2
ON db1.district=db2.district);

-- Population density of various districts

(select state,district,round(population/Area_km2,2) as population_density from newschema.population)
order by population_density
desc;














