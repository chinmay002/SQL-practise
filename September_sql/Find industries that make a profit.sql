select industry ,min(sales) as min_sales, avg(profits) as avg_profits from forbes_global_2010_2014
group by 1
order by 2 
