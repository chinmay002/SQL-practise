'''
The company you work for has asked you to look into the average order value per hour during rush hours in the San Jose area. 
Rush hour is from 15H - 17H inclusive.
'''




select Hour(customer_placed_order_datetime),
AVG(order_total + tip_amount - (discount_amount + refunded_amount)) as avg_earnings
from delivery_details
where Hour(customer_placed_order_datetime) between 15 and 17 
and delivery_region = 'San Jose'
group by Hour(customer_placed_order_datetime)
