SELECT DISTINCT song_name
FROM billboard_top_100_year_end
WHERE 
  year_rank = 1 AND
  YEAR(CURRENT_DATE) - year <= 20
