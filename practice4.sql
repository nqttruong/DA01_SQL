------------------ex1---------------------
SELECT 
  COUNT( CASE WHEN device_type = 'laptop' THEN 1 END) AS laptop_views,
  COUNT( CASE WHEN device_type IN ('phone', 'tablet') THEN 1 END) AS mobile_views
FROM viewership
------------------ex2---------------------
select x, y, z,
    (case when x + y < z then 'No' else 'Yes' end) as triangle
from Triangle
------------------ex3---------------------
SELECT 
  ROUND(((CAST(COUNT(CASE WHEN call_category = 'n/a' OR call_category IS NULL THEN 1 END) AS NUMERIC)) / 
  COUNT(*)) * 100, 1)
AS uncategorised_call_pct

FROM callers
------------------ex4---------------------
select name from customer 
where referee_id != 2 or referee_id is null
------------------ex5---------------------
select survived, 
        count(case when pclass = 1 then 1 end) as first_class,
        count(case when pclass = 2 then 2 end) as two_classs,
        count(case when pclass = 3 then 3 end) as Third_class
from titanic
group by survived
