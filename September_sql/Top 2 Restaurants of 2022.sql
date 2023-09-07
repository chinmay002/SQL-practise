Christmas is quickly approaching, and your team anticipates an increase in sales. To predict the busiest restaurants, they wanted to identify the top two restaurants by ID in terms of sales in 2022.
The output should include the restaurant IDs and their corresponding sales.
Note: Please remember that if an order has a blank value for actual_delivery_time, it has been canceled and therefore does not count towards monthly sales.



SELECT restaurant_id, total
FROM(
SELECT restaurant_id,
SUM(sales_amount) AS total,
DENSE_RANK() OVER( ORDER BY SUM(sales_amount) DESC) AS rnk
FROM order_value a
JOIN delivery_orders b
ON a.delivery_id = b.delivery_id
WHERE YEAR(actual_delivery_time) = 2022
GROUP BY 1)sq
WHERE rnk <=2
