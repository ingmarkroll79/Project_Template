--No longer needed Selects for data preparation 
select Entity, Year, [ DALYs_from_depressive_disorders_per_100K_people]
from SQL_Projekte..mental_health
where entity = 'Germany'

select entity, Year, [Number_of_Internet_users] from SQL_Projekte..number_of_internet_users
where entity = 'Germany' and
      Year <= '2019'

select entity, Year, Population from SQL_Projekte..Population_Germany
where entity = 'Germany' and
      Year <= '2019'


-- We want to get the number of internet users and the number of depressive disorders in Germany  
SELECT
    t1.Entity,
    t1.Year,
    t1.Number_of_Internet_users AS Number_of_internet_users,
    t2.[ DALYs_from_depressive_disorders_per_100K_people] AS Number_of_Depressions_per_100K,
	t3.Population,
	CAST((t3.Population / 100000 * t2.[ DALYs_from_depressive_disorders_per_100K_people]) AS int) AS Depressions_total
FROM
    SQL_Projekte..number_of_internet_users t1
JOIN
    SQL_Projekte..mental_health t2
ON
    t1.Entity = t2.Entity
    AND t1.Year = t2.Year
JOIN
    SQL_Projekte..Population_Germany t3
ON
    t1.Entity = t3.Entity
    AND t1.Year = t3.Year
	where t1.entity = 'Germany';

