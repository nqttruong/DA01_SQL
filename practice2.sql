------------------ex1--------------------
select distinct city from station
where id % 2 = 0
  
-----------------ex2---------------------
select count(city) - count(distinct city) from station
------------------ex3--------------------



-------------------ex4-------------------
SELECT round(SUM(item_count*order_occurrences) /SUM(order_occurrences) , 1) AS mean
FROM items_per_order;
------------------ex5--------------------
SELECT candidate_id FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3
------------------ex6--------------------
SELECT DISTINCT USER_ID, EXTRACT(DAY FROM MAX(post_date) - MIN(post_date))FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021
GROUP BY USER_ID
HAVING COUNT(user_id) > 2
ORDER BY USER_ID
------------------ex7--------------------
SELECT card_name, MAX(issued_amount) - MIN(issued_amount) FROM monthly_cards_issued
GROUP BY card_name
ORDER BY card_name desc
-----------------ex8---------------------
SELECT manufacturer, 
        COUNT(drug) as drug_count, 
        ABS(SUM(cogs-total_sales)) as total_loss 
        FROM pharmacy_sales
where cogs-total_sales >= 0
GROUP BY manufacturer
ORDER BY ABS(SUM(cogs - total_sales)) DESC
-----------------ex9---------------------
select * from Cinema
where id % 2 = 1 and description not like 'boring'
order by id desc
-----------------ex10---------------------
select teacher_id, count(distinct subject_id) as cnt
from Teacher
group by teacher_id
-----------------ex11---------------------
select user_id, count(follower_id) as followers_count
from Followers
group by user_id
order by user_id
-----------------ex12---------------------
select class
from Courses
group by class
having count(student) >= 5



