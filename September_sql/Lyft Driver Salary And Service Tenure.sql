select 
AVG(abs(datediff(start_date, end_date))/yearly_salary) as date_Diff_days
from lyft_drivers
where end_date is not null
