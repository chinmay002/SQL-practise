'''
You have been asked to find the top 3 merchants for each day with the highest number of orders on that day.
In the event of a tie, multiple merchants may share the same spot, but each day at least one merchant must be in first, second, and third place.
Your output should include the date in the format YYYY-MM-DD, the name of the merchant, and their place in the daily ranking.
'''



SELECT order_day,
       name,
       ranking
FROM
  (SELECT merchant_id,
          CAST(order_timestamp AS DATE) AS order_day,
          DENSE_RANK() OVER (PARTITION BY CAST(order_timestamp AS DATE)
                             ORDER BY COUNT(customer_id) DESC) AS ranking
   FROM order_details
   GROUP BY order_day,
            merchant_id) AS orders_rank
JOIN merchant_details ON merchant_details.id = orders_rank.merchant_id
WHERE ranking < 4
ORDER BY order_day,
         ranking;
