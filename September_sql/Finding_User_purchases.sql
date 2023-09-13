Write a query that'll identify returning active users. 
A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of 
these returning active users.


select distinct(tab1.user_id) from (select user_id, created_at - LAG(created_at) OVER (PARTITION BY 
user_id ORDER BY created_at) as days_elapsed from 
amazon_transactions)tab1 where tab1.days_elapsed<=7
