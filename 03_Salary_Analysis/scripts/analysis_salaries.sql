/*
PROJECT: Data Science Salary Analysis
INFRASTRUCTURE: Google BigQuery
GOAL: Analyze salary trends based on experience, remote work, and employment type.
*/

-- 1. DATA PREVIEW
SELECT * FROM `salary_data.ds_salaries` LIMIT 10;

-- 2. SALARY BY EXPERIENCE LEVEL (Data Transformation)
-- "EN" = Entry, "MI" = Mid, "SE" = Senior, "EX" = Executive
-- We use CASE WHEN to make labels readable for the dashboard.
SELECT 
    CASE experience_level
        WHEN 'EN' THEN 'Entry-Level'
        WHEN 'MI' THEN 'Mid-Level'
        WHEN 'SE' THEN 'Senior-Level'
        WHEN 'EX' THEN 'Executive-Level'
        ELSE experience_level
    END AS Experience_Category,
    
    ROUND(AVG(salary_in_usd), 2) AS Avg_Salary_USD,
    COUNT(*) AS Number_of_Jobs
FROM `salary_data.ds_salaries`
GROUP BY Experience_Category
ORDER BY Avg_Salary_USD ASC;

-- 3. REMOTE WORK IMPACT ON SALARY
-- remote_ratio: 0 (On-site), 50 (Hybrid), 100 (Remote)
SELECT 
    CASE remote_ratio
        WHEN 0 THEN 'On-Site'
        WHEN 50 THEN 'Hybrid'
        WHEN 100 THEN 'Fully Remote'
    END AS Work_Model,
    ROUND(AVG(salary_in_usd), 2) AS Avg_Salary_USD
FROM `salary_data.ds_salaries`
GROUP BY Work_Model
ORDER BY Avg_Salary_USD DESC;

-- 4. TOP PAYING ROLES (Best Jobs in 2023)
-- Filtering for roles with significant sample size (> 5 records) to avoid outliers
SELECT 
    job_title, 
    ROUND(AVG(salary_in_usd), 2) AS Avg_Salary_USD
FROM `salary_data.ds_salaries`
GROUP BY job_title
HAVING COUNT(*) > 5 
ORDER BY Avg_Salary_USD DESC
LIMIT 10;

-- 5. SALARY CLASS SEGMENTATION (Business Logic)
-- Creating a custom bucket to classify jobs as Low, Medium, or High Pay
SELECT 
    job_title,
    salary_in_usd,
    CASE 
        WHEN salary_in_usd < 50000 THEN 'Low'
        WHEN salary_in_usd BETWEEN 50000 AND 100000 THEN 'Medium'
        WHEN salary_in_usd > 100000 THEN 'High'
    END AS Salary_Tier
FROM `salary_data.ds_salaries`
ORDER BY salary_in_usd DESC;
