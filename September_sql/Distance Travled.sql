
--Find the top 10 users that have traveled the greatest distance. Output their id, name and a total distance traveled.



select user_id,name,sum(distance) as traveled_distance from lyft_rides_log l

join lyft_users u on l.user_id = u.id  
group by 1,2
order by 3 desc
limit 10
