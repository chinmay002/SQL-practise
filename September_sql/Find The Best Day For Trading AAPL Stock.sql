with cte as (
select day(date) as day_of_month,avg(open)as avg_open,
     avg(close)as avg_close, 
     avg(close)- avg(open) as diff from aapl_historical_stock_price
group by 1
order by 4 desc
limit 1)

select day_of_month,avg_open,avg_close from cte
