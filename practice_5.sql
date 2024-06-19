-------------ex1-------------
SELECT B.CONTINENT,  FLOOR(AVG(A.POPULATION))
FROM CITY AS A
INNER JOIN COUNTRY AS B
ON A.COUNTRYCODE = B.CODE
GROUP BY B.CONTINENT
-------------ex2-------------
SELECT ROUND(
    CAST(COUNT(CASE WHEN B.signup_action = 'Confirmed' THEN 1 END) AS NUMERIC) / 
    CAST(COUNT(*) - COUNT(CASE WHEN B.signup_action = 'Confirmed' THEN 1 END) AS NUMERIC), 2
)
FROM emails as A
LEFT JOIN TEXTS AS B
ON A.EMAIL_ID = B.EMAIL_ID
-------------ex3-------------
SELECT age.age_bucket,
ROUND(SUM(activities.time_spent CASE WHEN activities.activity_type = 'send' THEN 1 END)/
    SUM(activities.time_spent), 2) * 100 AS send_perc, 
  ROUND(SUM(activities.time_spent CASE WHEN activities.activity_type = 'open' THEN 1 END)/
    SUM(activities.time_spent), 2) * 100 AS open_perc
FROM activities
INNER JOIN age_breakdown AS age 
  ON activities.user_id = age.user_id 
WHERE activities.activity_type IN ('send', 'open') 
GROUP BY age.age_bucket;
-------------ex4-------------
SELECT a.customer_id FROM customer_contracts a 
inner join products b on a.product_id=b.product_id 
GROUP BY a.customer_id 
HAVING COUNT(DISTINCT product_category)=3
-------------ex5-------------

-------------ex6-------------

-------------ex7-------------


