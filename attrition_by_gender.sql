select gender
, count(*) as total_employees
, sum(case when attrition = 'Yes' then 1 else 0 end) as attrition_rate
, round(sum(case when attrition = 'Yes' then 1 else 0 end)::decimal / count(*) * 100, 2) as percent_attrition_rate
from hr_employees
group by gender
order by attrition_rate asc;