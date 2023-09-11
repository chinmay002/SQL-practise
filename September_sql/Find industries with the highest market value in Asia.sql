select industry ,sum(marketvalue) as total_marketvalue from forbes_global_2010_2014
where continent = 'Asia'
group by 1
order by 2 desc
limit 1
