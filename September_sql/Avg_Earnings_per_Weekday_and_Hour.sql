
You have been asked to calculate the average earnings per order segmented by a combination of weekday (all 7 days) and hour using the 
column customer_placed_order_datetime.
You have also been told that the column order_total represents the gross order total for each order. Therefore, you'll need to calculate the net order total.
The gross order total is the total of the order before adding the tip and deducting the discount and refund.
Note: In your output, the day of the week should be represented in text format (i.e., Monday). Also, round earnings to 2 decimals
'''

select DayName(customer_placed_order_datetime) as weekday,Hour(customer_placed_order_datetime) as HOUR,
round(avg(order_total+tip_amount-refunded_amount-discount_amount),2) as net_order 
from doordash_delivery
group by 1,2

