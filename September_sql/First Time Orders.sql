

with cte1 as(
select o.merchant_id, m.name, count(o.id) as total_order from order_details
o join merchant_details m on o.merchant_id = m.id
group by 1),

cte2 as(
select merchant_id, count(customer_id) as first_order from(
select customer_id, merchant_id, rank() over(partition by customer_id
order by order_timestamp) as ranking from order_details) as temp
where ranking = 1 group by 1)

select cte1.name, cte1.total_order, coalesce(cte2.first_order, 0) as first_order from cte1 left join cte2 on 
cte1.merchant_id = cte2.merchant_id


