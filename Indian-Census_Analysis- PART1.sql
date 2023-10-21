SELECT * FROM newschema.literacy;
SELECT * FROM newschema.population ;

-- NUMBER OF ROWS IN DATABASE

SELECT COUNT(*) FROM newschema.literacy;
SELECT COUNT(*) FROM newschema.population;

-- DATASET FOR ANDHRAPRADESH AND TAMILNADU

SELECT * FROM newschema.literacy where State = 'Andhra pradesh'or state='Tamil nadu';
SELECT * FROM newschema.population where State = 'Andhra pradesh'or state='Tamil nadu';

-- POPULATION OF INDIVIDUAL STATES

SELECT state,population FROM newschema.population;

-- SUM OF POPULATION OF INDIA

SELECT SUM(population) FROM newschema.population;

-- AVERAGE GROWTH  OF INDIVIDUAL STATES

SELECT state,avg(growth) as avg_growth FROM newschema.literacy 
GROUP BY state
ORDER BY avg(sex_ratio) DESC;

-- AVERAGE SEX RATIO OF ENTIRE COUNTRY

SELECT avg(sex_ratio) FROM newschema.literacy;

-- AVERAGE  LITERACY IN  ENTIRE COUNTRY

SELECT avg(literacy) FROM newschema.literacy ;

-- HAVING CLAUSE

SELECT state,avg(literacy)  FROM newschema.literacy
GROUP BY state
HAVING ROUND(avg(literacy),0)>90
ORDER BY avg(sex_ratio) DESC;

-- TOP 3 STATES WITH HIGHEST GROWTH PERCENT

SELECT state,ROUND(Growth,2) as growth FROM newschema.literacy
ORDER BY GROWTH DESC
LIMIT 3;

-- BOTTOM 3 STATES WITH LOWEST SEX RATIO

SELECT state,ROUND(sex_ratio,2) as sex_ratio FROM newschema.literacy
ORDER BY sex_ratio 
LIMIT 3;

-- TEMPORARY TABLES FOR TOP 3 AND BOTTOM 3 STATES WITH LOWEST SEX RATIO

CREATE TEMPORARY TABLE TABLE1
SELECT state,ROUND(sex_ratio,2) as sex_ratio FROM newschema.literacy
ORDER BY sex_ratio LIMIT 3 ;
 
CREATE TEMPORARY TABLE TABLE2
SELECT state,ROUND(sex_ratio,2) as sex_ratio FROM newschema.literacy
ORDER BY sex_ratio DESC
LIMIT 3;

-- TOP 3 AND BOTTOM 3 STATES WITH LOWEST SEX RATIO

SELECT * FROM TABLE1  
UNION 
SELECT * FROM TABLE2;

-- STATES STARTING WITH A

SELECT DISTINCT(STATE) FROM newschema.literacy
WHERE state LIKE 'a%';






