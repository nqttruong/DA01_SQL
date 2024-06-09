--------------------ex1---------------------------
select name from students
where marks > 75
order by right(name, 3) , id
--------------------ex2---------------------------
select user_id, UPPER(left(name, 1)) || lower(substring(name from 2 for length(name))) as name
 from Users
order by user_id
--------------------ex3---------------------------
select manufacturer, ('$'  || ROUND(SUM(total_sales)/1000000, 0) || ' ' || 'million') as sale
from pharmacy_sales 
GROUP BY manufacturer
ORDER BY SUM(total_sales) desc, manufacturer asc
--------------------ex4---------------------------
select EXTRACT(MONTH FROM submit_date) as mth, product_id as product, ROUND((AVG(stars)), 2) as avg_stars
from reviews 
GROUP BY product_id, EXTRACT(MONTH FROM submit_date)
ORDER BY EXTRACT(MONTH FROM submit_date), product_id
--------------------ex5---------------------------
SELECT sender_id, COUNT(message_id) as message_count FROM messages
WHERE EXTRACT(MONTH from sent_date) = '8'AND EXTRACT(YEAR FROM sent_date) = '2022'
GROUP BY sender_id
ORDER BY COUNT(message_id) DESC
limit 2
--------------------ex6---------------------------
select tweet_id from Tweets
where length(content) > 15
--------------------ex7---------------------------

--------------------ex8---------------------------
select COUNT(ID) from employees
where joining_date between '2022-01-01' and '2022-07-01'
--------------------ex9---------------------------
select POSITION('a' in first_name) from worker;
--------------------ex10---------------------------
select substring(title from length(winery) + 2 for 4 ) from winemag_p2
where country = 'Macedonia'
