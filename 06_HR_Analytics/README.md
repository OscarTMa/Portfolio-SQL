# 👥 HR Hierarchy Analysis (Self-Join)

## 📌 Project Overview
Analyzing organizational structure typically requires hierarchical data. This project uses a **Self-Join** technique to map employees to their managers within the same dataset, visualizing the reporting lines and team distribution across different office locations (Northwind Traders Dataset).

## 📊 Interactive Dashboard
Explore the organizational tree:

[![View on Tableau Public](https://img.shields.io/badge/Tableau-View_Org_Chart-E97627?style=for-the-badge&logo=tableau&logoColor=white)](https://public.tableau.com/views/HRAnalyticsManagementSpanofContro/Tableaudebord1?:language=fr-FR&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## 🧠 Technical Concept: The SELF JOIN
Most HR databases store employees in a single table. To analyze "Who reports to whom", we must join the table to itself.

* **Left Side (Table A):** Represents the *Subordinate*.
* **Right Side (Table B):** Represents the *Manager*.
* **Join Key:** `A.ReportsTo = B.EmployeeID`.

```sql
SELECT 
    A.employeeName AS Employee,
    B.employeeName AS Manager
FROM employees A
LEFT JOIN employees B 
  ON A.reportsTo = B.employeeID;
```
## Grphique

graph LR
    %% Estilos
    classDef table fill:#e1f5fe,stroke:#01579b,stroke-width:2px;
    
    %% Nodos
    A[("Employees Table<br>(Subordinates)")]:::table
    
    %% Relación Recursiva
    A -->|Link: ReportsTo = EmployeeID| A
    
    %% Nota Explicativa
    subgraph Logic ["Logic: SELF JOIN"]
    direction TB
    N1[Table A looks at Table A<br>to find the Manager Name]
    end
