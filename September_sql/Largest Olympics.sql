select games,count(distinct(id)) as athletes_count from olympics_athletes_events
group by 1
order by 2 desc
limit 1
