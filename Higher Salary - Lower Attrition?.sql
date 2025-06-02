select
case when monthlyincome < 3000 then '1. (<3000)'
     when monthlyincome between 3000 and 4999 then '2. (between 3000 and 4999)'
     when monthlyincome between 5000 and 6999 then '3. (between 5000 and 6999)'
     when monthlyincome between 7000 and 9999 then '4. (between 7000 and 9999)'
     when monthlyincome >= 10000 then '5. (>= 10000)'
end as income_range,
count(*) as total_employees,
sum(case when attrition = 'Yes' then 1 else 0 end) as employees_left,
round(sum(case when attrition = 'Yes' then 1 else 0 end)::decimal / count(*), 2) as attrition_percent
from hr_employees
group by income_range
order by attrition_percent desc;
