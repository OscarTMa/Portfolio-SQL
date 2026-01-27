# 📢 Marketing vs Sales Reconciliation (Funnel Audit)

## 📌 Project Overview
A common friction point in business is the discrepancy between Marketing data (Google Analytics/Ads) and Sales data (CRM). This project performs a **Data Integrity Audit** to reconcile two disjointed datasets, identifying leads that were lost during system integration or manually entered without attribution.

## 📊 Pipeline Health Dashboard
View the reconciliation report on Tableau Public:

[![View on Tableau Public](https://img.shields.io/badge/Tableau-View_Funnel_Audit-E97627?style=for-the-badge&logo=tableau&logoColor=white)](https://public.tableau.com/views/LeadsReconciliation/Tableaudebord1?:language=fr-FR&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## 🧠 Technical Concept: The FULL OUTER JOIN
To find missing records on *both sides* simultaneously, standard joins fail:
* `LEFT JOIN` misses leads that exist only in Sales (Manual entries).
* `RIGHT JOIN` misses leads that exist only in Marketing (Integration errors).
* **`FULL OUTER JOIN`** preserves all records, allowing us to use `COALESCE` to handle NULLs and flag discrepancies.

```sql
SELECT 
    COALESCE(w.Lead_ID, c.Lead_ID) AS ID,
    CASE 
        WHEN w.ID IS NULL THEN 'Missing in Web'
        WHEN c.ID IS NULL THEN 'Missing in CRM'
        ELSE 'Match'
    END AS Status
FROM web_data w
FULL OUTER JOIN crm_data c ON w.ID = c.ID;
```

## 🔎 Key Findings
Integration Failure: Lead #103 (Charlie) was captured by Marketing but never reached the CRM. This represents potential lost revenue.

Attribution Gap: Lead #105 (Eve) was converted by Sales but lacks a marketing source, indicating an untracked channel (likely phone or referral).

## Architecture
```mermaid
graph LR
    %% Estilos
    classDef mkt fill:#bbdefb,stroke:#1976d2,stroke-width:2px;
    classDef crm fill:#c8e6c9,stroke:#388e3c,stroke-width:2px;
    classDef error fill:#ffcdd2,stroke:#d32f2f,stroke-width:2px,stroke-dasharray: 5 5;
    classDef match fill:#e0e0e0,stroke:#616161,stroke-width:2px;

    %% Nodos
    Web(Web Analytics):::mkt
    Sales(CRM Sales):::crm
    
    %% Resultado del Join
    subgraph Result ["FULL OUTER JOIN RESULT"]
        Left[Only in Web<br>(Lost Lead)]:::error
        Center[In Both<br>(Match)]:::match
        Right[Only in CRM<br>(Manual Entry)]:::error
    end

    %% Conexiones
    Web --> Left
    Web --> Center
    Sales --> Center
    Sales --> Right
```
