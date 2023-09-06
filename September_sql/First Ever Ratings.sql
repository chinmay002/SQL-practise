The company you work for is looking at their delivery drivers' first-ever delivery with the company.
You have been tasked with finding what percentage of drivers' first-ever completed orders have a rating of 0.
Note: Please remember that if an order has a blank value for actual_delivery_time, it has been canceled and therefore does not count as a completed delivery




WITH first_ratings AS
  (SELECT *,
          FIRST_VALUE(delivery_rating) OVER(PARTITION BY driver_id
                                            ORDER BY actual_delivery_time) AS first_rating
   FROM delivery_orders
   WHERE actual_delivery_time IS NOT NULL)
SELECT 100.0 *
  (SELECT COUNT(DISTINCT driver_id)
   FROM first_ratings
   WHERE first_rating = 0) /
  (SELECT COUNT(DISTINCT driver_id)
   FROM first_ratings) AS perc_zero_rating;
