# 📊 HR Analytics: Attrition by Gender and Income Level

This project explores employee attrition based on gender and monthly income, using an HR dataset from IBM.

🔗 Interactive Tableau Dashboards:  
[View on Tableau Public](https://public.tableau.com/app/profile/saglara.garyaeva/vizzes)

---

📌 SQL Queries Overview

1. Attrition by Gender

SELECT
  gender,
  COUNT(*) AS total_employees,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_rate,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)::decimal / COUNT(*) * 100, 2) AS percent_attrition_rate
FROM hr_employees
GROUP BY gender
ORDER BY attrition_rate ASC;
Goal: Compare attrition rates between male and female employees.
Insight: Male employees leave slightly more often than female employees. Males also represent a larger portion of the workforce.


2. Attrition by Monthly Income Range

SELECT
  CASE
    WHEN monthlyincome < 3000 THEN '1. (<3000)'
    WHEN monthlyincome BETWEEN 3000 AND 4999 THEN '2. (between 3000 and 4999)'
    WHEN monthlyincome BETWEEN 5000 AND 6999 THEN '3. (between 5000 and 6999)'
    WHEN monthlyincome BETWEEN 7000 AND 9999 THEN '4. (between 7000 and 9999)'
    WHEN monthlyincome >= 10000 THEN '5. (>= 10000)'
  END AS income_range,
  COUNT(*) AS total_employees,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
  ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)::decimal / COUNT(*), 2) AS attrition_percent
FROM hr_employees
GROUP BY income_range
ORDER BY attrition_percent DESC;
Goal: Understand how salary levels influence employee attrition.
Insight: Lower-income employees show the highest attrition rates. The group earning below $3,000/month has the highest turnover.



🛠️ Tools Used

PostgreSQL – for querying the dataset
DBeaver – as a database client
Tableau Public – for data visualization and dashboard creation


📊 Dashboards
Created in Tableau:

📉 Attrition by Gender (bar chart with percentages)
💰 Attrition by Income Range (bar chart showing attrition % by income tier)
📁 Dataset


Data Source: IBM HR Analytics Employee Attrition & Performance

