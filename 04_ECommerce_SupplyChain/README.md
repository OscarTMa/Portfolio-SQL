# 📦 Olist E-Commerce Supply Chain Analysis

## 📌 Project Description
Analysis of the Brazilian E-Commerce public dataset to evaluate logistics performance and sales distribution. This project focuses on **relational modeling**, joining multiple tables to extract insights about delivery times vs. estimated deadlines.

## 📊 Interactive Dashboard
[![View on Tableau Public](https://img.shields.io/badge/Tableau-View_Dashboard-E97627?style=for-the-badge&logo=tableau&logoColor=white)](TU_LINK_AQUI)

## 🏗 Data Architecture & Modeling
Unlike previous flat-file projects, this analysis uses a **Star Schema** approach involving relational joins.

![ER Diagram](./docs/schema_diagram.png) 
*(Asegúrate de guardar tu imagen de draw.io en una carpeta docs)*

## 🛠 Tech Stack
* **Modeling:** Draw.io (Entity Relationship Diagram).
* **Data Warehouse:** Google BigQuery (Multi-table ingestion).
* **SQL Logic:** `INNER JOIN` for merging Orders, Items, and Products. `TIMESTAMP_DIFF` for lead-time calculation.
* **Visualization:** Tableau Public.

## 🔎 Key Insights
* **Logistics:** The average delivery time is **X days**, with significant delays observed in the "Office Furniture" category.
* **Sales:** "Health & Beauty" and "Watches" are the top revenue-generating categories.
