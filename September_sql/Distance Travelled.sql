SELECT b.id, b.name, SUM(distance) AS total_dist
FROM lyft_rides_log a INNER JOIN lyft_users b
ON a.user_id = b.id
group by 1
order by 3 desc
limit 10
