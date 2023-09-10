select e.first_name, e.salary
from employee e
left join employee m
on e.manager_id = m.id
where e.salary > m.salary
