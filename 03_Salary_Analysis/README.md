# 💸 Data Science Salary Analysis

## 📌 Project Description
This project analyzes salary trends within the Data Science industry. The goal is to determine how factors such as experience level, remote work arrangements, and job titles influence compensation worldwide.

## 📊 Interactive Dashboard
Explore the salary insights on Tableau Public:

[![View on Tableau Public](https://img.shields.io/badge/Tableau-View_Dashboard-E97627?style=for-the-badge&logo=tableau&logoColor=white)](TU_LINK_DE_TABLEAU_AQUI)

---

## ☁️ Project Architecture
* **Ingestion:** Raw CSV data uploaded to **Google BigQuery**.
* **Processing:** SQL used for data cleaning and categorical transformation (`CASE WHEN`).
* **Visualization:** Tableau Public connected via Google Sheets bridge.

## 🔎 Key Insights
* **Experience Pays:** Executive-level roles command significantly higher salaries compared to Senior roles, often doubling Entry-level compensation.
* **Remote Work:** Surprisingly, fully remote roles in this dataset showed competitive (and sometimes higher) average salaries compared to 100% on-site positions.
* **Top Roles:** Machine Learning Engineers and Data Architects currently top the salary charts.

## 🛠 SQL Skills Demonstrated
* **Data Transformation:** Using `CASE WHEN` statements to convert codes (EN, MI, SE) into readable business categories.
* **Aggregation & Filtering:** Utilizing `GROUP BY` combined with `HAVING` to filter out job titles with statistically insignificant sample sizes.
* **Business Logic:** Creating custom "Salary Tiers" based on numerical thresholds.

## 🧠 Theoretical Concepts
*(Paste NotebookLM explanation here)*
