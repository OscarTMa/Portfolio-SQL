# 📦 Supply Chain Audit (Inventory Gap Analysis)

## 📌 Project Overview
In logistics, "missing data" is often more dangerous than "bad data". Standard SQL queries only return existing records, failing to report products that are completely missing from a warehouse. This project uses a **CROSS JOIN** technique to generate a theoretical matrix of all possible Product-Warehouse combinations to identify stockouts.

## 📊 Inventory Matrix
View the audit report on Tableau Public:

[![View on Tableau Public](https://img.shields.io/badge/Tableau-View_Audit_Matrix-E97627?style=for-the-badge&logo=tableau&logoColor=white)](https://public.tableau.com/views/InventoryAudit/Feuille1?:language=fr-FR&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## 🧠 Technical Concept: The CROSS JOIN
To find gaps, we first need to define the "perfect state" where every warehouse stocks every product.

1.  **Generate Scaffolding:** `Products` × `Warehouses` (Cartesian Product).
2.  **Map Reality:** Left Join the actual `Inventory` table to the scaffold.
3.  **Flag Gaps:** Any NULL result in the join indicates a missing product record (0 stock).

```sql
-- Generating the "Perfect" Inventory List
SELECT w.Warehouse, p.Product
FROM Warehouses w
CROSS JOIN Products p;
```

## 🔎 Key Findings
Critical Alert: The South Warehouse is completely out of stock for Laptops (Row didn't exist in source system).

Replenishment Needed: Desk Chairs are below the safety stock threshold (20 units) in the South region.
