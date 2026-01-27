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


graph TD
    %% Estilos
    classDef warehouse fill:#fff9c4,stroke:#fbc02d,stroke-width:2px;
    classDef product fill:#e1bee7,stroke:#8e24aa,stroke-width:2px;
    classDef result fill:#ffccbc,stroke:#d84315,stroke-width:2px;

    subgraph W ["Table A: Warehouses"]
        W1[North WH]:::warehouse
        W2[South WH]:::warehouse
    end

    subgraph P ["Table B: Products"]
        P1[Laptop]:::product
        P2[Mug]:::product
    end

    subgraph R ["Result: CROSS JOIN (Cartesian Product)"]
        R1[North - Laptop]:::result
        R2[North - Mug]:::result
        R3[South - Laptop]:::result
        R4[South - Mug]:::result
    end

    %% Conexiones
    W1 --> R1 & R2
    W2 --> R3 & R4
    P1 --> R1 & R3
    P2 --> R2 & R4



