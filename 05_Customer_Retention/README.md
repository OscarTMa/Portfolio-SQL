# 👥 Customer Retention (Cohort Analysis)

## 📌 Project Description
Acquiring a customer is expensive, but keeping them is profitable. This project calculates the **Retention Rate** of a UK-based Online Retailer using **Cohort Analysis**. The goal is to visualize how user engagement decays over time (Month Lag).

## 📊 Interactive Dashboard
Explore the Cohort Heatmap on Tableau Public:

[![View on Tableau Public](https://img.shields.io/badge/Tableau-View_Heatmap-E97627?style=for-the-badge&logo=tableau&logoColor=white)](https://public.tableau.com/views/OATMCustomer_Retention/Feuille1?:language=fr-FR&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## 🧠 The Logic: What is a Cohort?
A cohort is a group of users who share a common characteristic—in this case, their **first purchase month**. We track these groups over time to see what percentage returns in subsequent months.

### Key SQL Techniques
* **Data Cleaning:** Converted `TIMESTAMP` to `DATE` to handle granularity issues.
* **CTE (Common Table Expressions):** Structured the query into logical steps (Clean -> Start Date -> Activity -> Lag).
* **Self-Joins:** Connected the transaction table to itself to compare "First Purchase" vs "Subsequent Purchases".

## 🔎 Key Insights
* **High Churn:** The steepest drop in customers occurs after **Month 0** (the first purchase), which is typical in retail.
* **Loyalty Pockets:** The cohort of **December 2010** showed unusually high retention in subsequent months, likely due to holiday seasonality.

## 🛠️ Visual Technique (Tableau)
* **Heatmap Visualization:** Used a square mark type with color intensity representing retention %.
* **Table Calculations:** Applied a `Percent of Total` calculation relative to the first month (Month 0 = 100%) to normalize the data across different cohort sizes.
