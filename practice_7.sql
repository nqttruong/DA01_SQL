-------------------------------ex1-------------------------------------
SELECT extract(year from transaction_date) as year,
        product_id,
        spend as curr_year_spend,
        lag(spend, 1) over(partition by product_id) as prev_year_spend,
        round((spend - lag(spend, 1) over(partition by product_id)) / lag(spend, 1) over(partition by product_id) * 100 , 2)
FROM user_transactions;

-------------------------------ex2-------------------------------------

SELECT DISTINCT
  card_name,
  FIRST_VALUE(issued_amount) OVER(PARTITION BY card_name ORDER BY issue_year, issue_month)
  AS issued_amount
FROM monthly_cards_issued
ORDER BY issued_amount DESC

-------------------------------ex3-------------------------------------
  
select user_id, 
        spend,
        transaction_date
from 
(SELECT user_id, 
        spend,
        transaction_date,
        rank() over(PARTITION BY user_id ORDER BY transaction_date) as stt
FROM transactions) as T
WHERE stt = 3

-------------------------------ex4-------------------------------------

WITH recent_transactions AS (
    SELECT 
        user_id, 
        MAX(transaction_date) AS recent_transaction_date
    FROM 
        user_transactions
    GROUP BY 
        user_id
)

SELECT 
    rt.recent_transaction_date AS transaction_date,
    ut.user_id,
    COUNT(ut.product_id) AS purchase_count
FROM 
    recent_transactions rt
JOIN 
    user_transactions ut
ON 
    rt.user_id = ut.user_id AND rt.recent_transaction_date = ut.transaction_date
GROUP BY 
    rt.recent_transaction_date, ut.user_id
ORDER BY 
    rt.recent_transaction_date;

-------------------------------ex5-------------------------------------

SELECT 
    user_id,
    tweet_date,
    ROUND(AVG(tweet_count) OVER (
        PARTITION BY user_id 
        ORDER BY tweet_date 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) AS rolling_avg_3d
FROM 
    tweets
ORDER BY 
    user_id, tweet_date;


-------------------------------ex6-------------------------------------


-------------------------------ex7-------------------------------------

select category, product, total_spend 
from(
          select category, product, SUM(spend) AS total_spend,
          ROW_NUMBER() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) AS rank
          from product_spend 
          WHERE EXTRACT(YEAR from transaction_date) = '2022'
          GROUP BY category, product
          ) ranked_sales
where rank <= 2
-------------------------------ex8-------------------------------------



