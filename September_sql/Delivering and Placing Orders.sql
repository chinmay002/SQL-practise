You have been asked to investigate whether there is a correlation between the average total order value and the average time in minutes between placing an order and having it delivered per restaurant.
You have also been told that the column order_total represents the gross order total for each order. Therefore, you'll need to calculate the net order total.
The gross order total is the total of the order before adding the tip and deducting the discount and refund.




with cte as (
    select restaurant_id
    , avg(order_total) as x
    , avg(timestampdiff(minute, customer_placed_order_datetime, delivered_to_consumer_datetime)) as y
    from delivery_details
    group by 1
)
select (avg(x*y) - avg(x)*avg(y)) / (
    sqrt(avg(x*x) - power(avg(x), 2)) *
    sqrt(avg(y*y) - power(avg(y), 2))
) as corr
from cte
