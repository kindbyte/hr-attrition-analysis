select 
age_group,
count(*) as total_employees
from 
(select case
	when age < 25 then 'less than 25'
	when age between 25 and 35 then 'between 25 and 35'
	when age between 35 and 45 then 'between 35 and 45'
	when age between 45 and 55 then 'between 45 and 55'
	else '56+'
	end as age_group,
	case 
		when age < 25 then '1'
	when age between 25 and 35 then '2'
	when age between 35 and 45 then '3'
	when age between 45 and 55 then '4'
	else '5'
	end as age_order
	from hr_employees) as sub
group by age_order, age_group
order by age_order asc;