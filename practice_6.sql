-----------------------ex1-----------------------------
with duplicate_companies as (
    select count(company_id), title, description
    from job_listings 
    group by company_id, title, description
    having count(company_id) > 1
)
select count(*) as duplicate_companies from duplicate_companies

-----------------------ex2-----------------------------
select category, product, total_spend 
from(
          select category, product, SUM(spend) AS total_spend,
          ROW_NUMBER() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) AS rank
          from product_spend 
          WHERE EXTRACT(YEAR from transaction_date) = '2022'
          GROUP BY category, product
          ) ranked_sales
where rank <= 2
-----------------------ex3-----------------------------
with cte_a as (SELECT policy_holder_id,count(call_duration_secs)
FROM callers
GROUP BY policy_holder_id
HAVING count(call_duration_secs)>=3)

SELECT COUNT(policy_holder_id) FROM cte_a;


-----------------------ex4-----------------------------
select page_id from pages
where page_id NOT IN (select DISTINCT page_id from page_likes)

  
-----------------------ex5-----------------------------
with cte_monthly_active_users as (

SELECT DISTINCT EXTRACT(MONTH FROM event_date) AS MONTH, user_id as Monthly_Active_Users
FROM user_actions
WHERE EXTRACT(MONTH FROM event_date) = 7 AND user_id IN 
(
SELECT user_id
FROM user_actions
WHERE EXTRACT(MONTH FROM event_date) = 6
)
GROUP BY EXTRACT(MONTH FROM event_date), user_id
)
select MONTH, count(*) from cte_monthly_active_users
GROUP BY month

-----------------------ex6-----------------------------
  
SELECT
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    COUNT(*) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY TO_CHAR(trans_date, 'YYYY-MM'), country
ORDER BY month, country;
-----------------------ex7-----------------------------

WITH FirstYearSales AS (
    SELECT 
        product_id,
        year,
        quantity,
        price,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY year) AS rank
    FROM Sales
)
SELECT 
    product_id,
    year AS first_year,
    quantity,
    price
FROM FirstYearSales
WHERE rank = 1;
-----------------------ex8-----------------------------

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);

-----------------------ex9-----------------------------
SELECT e.employee_id
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.employee_id
WHERE e.salary < 30000
  AND e.manager_id IS NOT NULL
  AND m.employee_id IS NULL
ORDER BY e.employee_id;
-----------------------ex10-----------------------------

with duplicate_companies as (
    select count(company_id), title, description
    from job_listings 
    group by company_id, title, description
    having count(company_id) > 1
)
select count(*) as duplicate_companies from duplicate_companies

-----------------------ex11-----------------------------

-----------------------ex12-----------------------------







