/*
Employee Performance & Retention Analysis
Author: Santosh BK
Database: school_db
Table: hrdataset_v14

Objective:
To understand workforce distribution, salary patterns,
employee satisfaction, attrition reasons,
and manager impact on team performance.
*/

USE school_db;

-- 1. Data check before starting analysis

-- Check total records and missing values in important columns
SELECT 
    COUNT(*) AS total_records,
    SUM(CASE WHEN EmpID IS NULL THEN 1 ELSE 0 END) AS missing_empid,
    SUM(CASE WHEN Salary IS NULL THEN 1 ELSE 0 END) AS missing_salary,
    SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS missing_department
FROM hrdataset_v14;

-- Check if any duplicate Employee IDs exist
SELECT 
    EmpID,
    COUNT(*) AS total_count
FROM hrdataset_v14
GROUP BY EmpID
HAVING COUNT(*) > 1;


-- 2. Overall workforce overview

-- Total employees, active vs terminated, and overall averages
SELECT 
    COUNT(EmpID) AS total_headcount,
    SUM(CASE WHEN Termd = 0 THEN 1 ELSE 0 END) AS active_employees,
    SUM(CASE WHEN Termd = 1 THEN 1 ELSE 0 END) AS terminated_employees,
    ROUND(AVG(Salary),2) AS average_salary,
    ROUND(AVG(EmpSatisfaction),2) AS average_satisfaction
FROM hrdataset_v14;


-- 3. Department level analysis (only active employees)

-- Headcount, average salary, and engagement by department
SELECT 
    TRIM(Department) AS department_name,
    COUNT(EmpID) AS headcount,
    ROUND(AVG(Salary),2) AS avg_salary,
    ROUND(AVG(EngagementSurvey),2) AS avg_engagement
FROM hrdataset_v14
WHERE Termd = 0
GROUP BY TRIM(Department)
ORDER BY headcount DESC;


-- 4. Salary comparison by gender and race

-- Used to evaluate pay equity among active employees
SELECT 
    TRIM(Sex) AS gender,
    RaceDesc,
    COUNT(*) AS total_staff,
    ROUND(AVG(Salary),2) AS avg_salary
FROM hrdataset_v14
WHERE Termd = 0
GROUP BY TRIM(Sex), RaceDesc
ORDER BY avg_salary DESC;


-- 5. Attrition analysis

-- Understanding the main reasons employees leave
SELECT 
    TermReason,
    COUNT(*) AS total_exits,
    ROUND(AVG(EmpSatisfaction),2) AS last_satisfaction_score
FROM hrdataset_v14
WHERE Termd = 1
GROUP BY TermReason
ORDER BY total_exits DESC;


-- 6. Recruitment source effectiveness

-- Measure hiring volume and attrition by recruitment channel
SELECT 
    RecruitmentSource,
    COUNT(*) AS total_hires,
    ROUND(AVG(EmpSatisfaction),2) AS avg_satisfaction,
    SUM(CASE WHEN Termd = 1 THEN 1 ELSE 0 END) AS total_left
FROM hrdataset_v14
GROUP BY RecruitmentSource
ORDER BY total_hires DESC;


-- 7. Performance and attendance relationship

-- Check if performance rating relates to lateness and absence
SELECT 
    PerformanceScore,
    COUNT(*) AS total_employees,
    ROUND(AVG(DaysLateLast30),2) AS avg_late_days,
    ROUND(AVG(Absences),2) AS avg_absences
FROM hrdataset_v14
GROUP BY PerformanceScore
ORDER BY avg_late_days DESC;


-- 8. Manager effectiveness analysis

-- Compare team size, absence, and satisfaction under each manager
SELECT 
    ManagerName,
    COUNT(EmpID) AS team_size,
    ROUND(AVG(Absences),2) AS avg_team_absence,
    ROUND(AVG(EmpSatisfaction),2) AS avg_team_satisfaction
FROM hrdataset_v14
WHERE Termd = 0
GROUP BY ManagerName
HAVING COUNT(EmpID) > 5
ORDER BY avg_team_satisfaction DESC;