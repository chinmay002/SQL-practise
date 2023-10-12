with cte as(
select artist,avg(year_rank) as avg_yearly_rank,COUNT(DISTINCT year) AS number_of_years_present  from billboard_top_100_year_end
where year >=Year(current_timestamp) - 20
group by 1)


SELECT
    artist
    , avg_yearly_rank
    , number_of_years_present
    , (100 - avg_yearly_rank) * number_of_years_present AS score
FROM cte
ORDER BY 4 DESC
