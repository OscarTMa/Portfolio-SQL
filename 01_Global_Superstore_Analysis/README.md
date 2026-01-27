# 🌍 Global Superstore Sales Analysis

## 📌 Project Overview
This foundational project involves an **Exploratory Data Analysis (EDA)** of a global retail dataset. The primary goal was to establish a baseline understanding of sales performance, profitability, and shipping efficiency across different international markets and product categories.

It serves as the entry point into data analysis, focusing on fundamental questioning and data exploration techniques.

## 📊 Dashboard & Visuals
(Optional: If you have a Tableau link for this project, put it here. Otherwise, you can remove this section or add a screenshot of an Excel pivot table).

[![View on Tableau Public](https://img.shields.io/badge/Tableau-View_Dashboard-E97627?style=for-the-badge&logo=tableau&logoColor=white)]()

## 🎯 Business Questions Addressed
The analysis aimed to answer high-level business questions for stakeholders:
* What are our top-selling products and categories?
* Which global regions are generating the most profit versus the most revenue?
* Are shipping modes impacting delivery times?

## 🛠️ Tech Stack & Key Skills
* **Technology:** SQL (Google BigQuery), Excel (Source Data review).
* **Key Skills:**
    * **Data Aggregation:** Using `SUM()`, `AVG()`, and `COUNT()` to summarize massive datasets.
    * **Filtering & Segmentation:** Using `WHERE` clauses to isolate specific markets (e.g., "EU Market" vs. "US Market").
    * **Sorting & Ranking:** Using `ORDER BY` to identify top performers (best-sellers) and laggards.

## 🔎 Example Analysis (SQL)
A core part of the analysis was identifying the top 10 products by total sales revenue to understand inventory priorities.

```sql
-- Identifying Top 10 Performing Products by Revenue
SELECT 
    Product_Name,
    Category,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    SUM(Quantity) AS Total_Units_Sold
FROM `retail_data.global_superstore`
GROUP BY Product_Name, Category
ORDER BY Total_Revenue DESC
LIMIT 10;

```
## 🚀 Conclusion
This project established the necessary groundwork for data manipulation. By answering fundamental business questions, it paved the way for more complex analyses (like the cohort or funnel analysis in later projects) in the portfolio journey.

