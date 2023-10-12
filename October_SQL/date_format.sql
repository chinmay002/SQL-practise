select date_format(ds_checkin,'%w') as day_of_week, count(id_guest)
from airbnb_contacts
group by day_of_week
order by 2 desc
limit 1
