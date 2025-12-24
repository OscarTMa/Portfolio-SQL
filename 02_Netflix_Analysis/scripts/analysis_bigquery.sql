/*
PROJECT: Netflix Catalog Analysis
INFRASTRUCTURE: Google Cloud Platform (GCP) - BigQuery
AUTHOR: Oscar Tibaduiza
*/

-- 1. OVERVIEW: Data Preview
-- Quick check of the uploaded dataset
SELECT * FROM `netflix_data.netflix_titles` 
LIMIT 5;

-- 2. CONTENT DISTRIBUTION (Movies vs TV Shows)
-- Used for the Donut Chart in Tableau
SELECT 
    type, 
    COUNT(*) as Total_Content
FROM `netflix_data.netflix_titles`
GROUP BY type;

-- 3. TOP 10 PRODUCING COUNTRIES
-- Filtering NULLs to ensure data quality in the Map Visualization
SELECT 
    country, 
    COUNT(*) as Content_Count
FROM `netflix_data.netflix_titles`
WHERE country IS NOT NULL 
GROUP BY country
ORDER BY Content_Count DESC
LIMIT 10;

-- 4. CATALOG GROWTH OVER TIME
-- analyzing the content strategy shift since 2015
SELECT 
    release_year, 
    type, 
    COUNT(*) as Count_Per_Year
FROM `netflix_data.netflix_titles`
WHERE release_year >= 2015 
GROUP BY release_year, type
ORDER BY release_year ASC;

-- 5. AVERAGE MOVIE DURATION
-- Data Cleaning: Extracting the number from "90 min" string format
-- Logic: Split string by space, take the first part, convert to Integer safely.
SELECT 
    type,
    ROUND(AVG(SAFE_CAST(SPLIT(duration, ' ')[OFFSET(0)] AS INT64)), 0) as Avg_Duration_Mins
FROM `netflix_data.netflix_titles`
WHERE type = 'Movie' AND duration IS NOT NULL
GROUP BY type;
