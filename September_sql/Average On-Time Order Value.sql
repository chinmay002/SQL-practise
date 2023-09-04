'''
The ideal time between when a customer places an order and when the order is delivered is below or equal to 45 minutes.
You have been tasked with evaluating delivery driver performance by calculating the average order value for each delivery driver who has delivered at least once within this 45-minute period.
Your output should contain the driver ID along with their corresponding average order value.
'''


select driver_id, avg(order_total) as average_order_value
from delivery_details
where driver_id in
(select driver_id
from delivery_details
where (timestampdiff(minute, customer_placed_order_datetime,delivered_to_consumer_datetime))<=45
)
group by driver_id
order by 2 desc
