/*
*  Show the population per continent
*  Database: World
*  Table: Country
*/
select distinct continent, sum(population) over(partition by continent) as total_population_per_continent
from country;


/*
*  To the previous query add on the ability to calculate the percentage of the world population
*  What that means is that you will divide the population of that continent by the total population and multiply by 100 to get a percentage.
*  Make sure you convert the population numbers to float using `population::float` otherwise you may see zero pop up
*
*  Database: World
*  Table: Country
*/
select distinct continent, 
	   sum(population) over(partition by continent) as total_population_per_continent,
	   -- Divide the total sum of the population per continent by the total sum of the population
	   -- Used the roud() function to round it to the nearest number
	   -- Used the concat() function to add the percentage sign at the end
	   concat(round(sum(population::float4) over(partition by continent) /
	   sum(population::float4) over() * 100), '%') as population_percentage
from country;


/*
*  Count the number of towns per region
*
*  Database: France
*  Table: Regions (Join + Window function)
*/
select distinct r.id, 
	   r."name", 
	   count(t.id) over(partition by r.id order by r."name") as number_of_towns_per_region
from regions r 
inner join departments d on r.code = d.region
inner join towns t 		 on d.code = t.department
order by r.id;
