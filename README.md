HR Employee Retention & Performance Analysis (SQL Project)

Project Overview

This project analyzes HR workforce data using SQL to understand employee retention patterns, salary distribution, department performance, recruitment effectiveness, and the relationship between attendance and job performance.

The dataset contains 311 employees and includes information such as department, salary, satisfaction score, performance rating, absences, recruitment source, and termination reason.

The goal of this analysis is to generate meaningful business insights that can support HR decision-making and improve retention strategies.


Project Objectives
Analyze total workforce and overall salary trends
Identify main reasons for employee turnover
Compare department-level headcount and compensation
Evaluate gender-based salary distribution
Measure recruitment source effectiveness
Examine the relationship between punctuality and performance
Assess managerial impact on team satisfaction


Tools & Technologies Used
MySQL
SQL (GROUP BY, CASE, HAVING, Aggregations, Filtering)
Data Cleaning & Validation
Business Insight Interpretation


Key Findings
1. General Workforce Overview
Total Employees: 311
Average Salary: $69,020.68
Average Satisfaction: 3.89 / 5
Average Absences: ~10 days
The workforce shows moderate satisfaction levels with stable attendance patterns.

2. Department Analysis
Production is the largest department (209 employees)
IT/IS and Software Engineering have the highest average salaries (~$95k–$97k)
Production has the highest headcount but comparatively lower salary levels.

3. Gender Pay Analysis
Female Average Salary: $67,786 (176 employees)
Male Average Salary: $70,629 (135 employees)
A slight salary gap favoring male employees exists within this dataset.

4. Attrition Insights
Top reasons employees leave:
Another position (20 employees)
Unhappy (14 employees)
More money (11 employees)
Career change (9 employees)
Career growth and compensation are the primary drivers of turnover.

5. Recruitment Source Performance
Indeed (87 hires) and LinkedIn (76 hires) generate the highest number of hires
Employee referrals show higher-than-average salaries ($77,862)
Recruitment channels differ in both volume and quality of hires.

6. Performance vs Attendance
Employees rated "Exceeds" or "Fully Meets" show almost zero late days
Employees on a Performance Improvement Plan (PIP) average 4.3 late days
Punctuality is a strong indicator of overall job performance.


Business Recommendations
Improve engagement strategies in large departments such as Production
Address career growth and salary concerns to reduce turnover
Monitor pay equity regularly
Focus on recruitment channels with better retention outcomes
Use attendance patterns as an early performance risk indicator


Project Structure
hr-employee-retention-sql-analysis/
README.md
hr_analysis_queries.sql
insights_summary.md
screenshots/


How to Run
1. Import the HR dataset into MySQL.
2. Create or use the appropriate database.
3. Run the queries from hr_analysis_queries.sql.
4. Review the output to interpret insights.


Author
Santosh BK
Aspiring Data Analyst | SQL | Data Analysis | Business Insights
