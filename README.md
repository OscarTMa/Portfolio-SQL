# 🚀 Data Analyst Portfolio | Oscar Tibaduiza

Hi there! I am a Data Analyst focused on **Cloud Analytics (GCP)** and **Visual Storytelling (Tableau)**. 
This repository documents my journey solving real-world business problems using a Modern Data Stack.

## 🛠️ Tech Stack & Tools
* **Cloud & Warehousing:** Google Cloud Platform (GCP), BigQuery.
* **Data Processing:** SQL (Standard & Legacy), Excel.
* **Visualization:** Tableau Public, Draw.io (Data Modeling).
* **Documentation:** Markdown, GitHub.

---

## 📂 Featured Projects

| Project | Tech Stack | Key Description | Dashboard |
| :--- | :--- | :--- | :--- |
| **01. Global Superstore** | SQL, Excel | Sales & Profit analysis for a global retailer. | |
| **02. Netflix Catalog** | BigQuery, Tableau | Content strategy analysis & trend forecasting. | [View](https://public.tableau.com/views/OscarTibaduizaNetflixContentAnalysis/Tableaudebord1?:language=fr-FR&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link) |
| **03. Data Science Salaries** | BigQuery, SQL | Market research on salaries by experience & remote work. | [View](https://public.tableau.com/views/OscarTMTopSalaries2023/Tableaudebord1?:language=fr-FR&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link) |
| **04. E-Commerce Logistics** | BigQuery, Draw.io | Supply chain optimization & Quadrant Analysis (Olist). | [View](https://public.tableau.com/views/Ecommerce_17666808507180/Mastertable?:language=fr-FR&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link) |
| **05. Customer Retention** | BigQuery, SQL | **Advanced Cohort Analysis** to measure user loyalty. | [View](https://public.tableau.com/views/OATMCustomer_Retention/Feuille1?:language=fr-FR&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link) |
| **06. HR Analytics** | BigQuery, SQL (Self Join) | Organizational hierarchy & span of control analysis. | [View](https://public.tableau.com/views/HRAnalyticsManagementSpanofContro/Tableaudebord1) |
| **07. Inventory Audit** | BigQuery, SQL (Cross Join) | Supply chain "gap detection" for missing stock. | [View](https://public.tableau.com/views/InventoryAudit/Feuille1) |
| **08. Marketing Funnel** | BigQuery, SQL (Full Join) | Data integrity audit reconciling Marketing vs Sales leads. | [View](https://public.tableau.com/views/LeadsReconciliation/Tableaudebord1?:language=fr-FR&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link) |
| **09. European Soccer** | BigQuery, SQL (Multi Join) | Complex schema denormalization (4-table join). | [View](https://public.tableau.com/views/Goalsforleague/Tableaudebord1) |
| **10. Financial Stocks** | BigQuery, SQL (Union) | Historical trend analysis combining multi-period data. | [View](https://public.tableau.com/views/HistoricalAnalysis_17692054448560/Feuille1) |

---

## 🧠 Data Modeling & Analytics Philosophy
My approach goes beyond simple charts. I focus on **structuring complex data** to build strategic dashboards that drive decision-making. This portfolio demonstrates a progression from basic analysis to advanced data modeling techniques:

* **Advanced SQL Modeling:** Utilizing CTEs, Window Functions, and complex relational techniques (Self, Cross, Full Outer, and Multiple Joins) to reshape normalized data for analysis.
* **Strategic Visuals:** Creating Cohort Heatmaps for retention, Quadrant Analyses for segmentation, and Hierarchical Tree Maps for organizational structure.
* **Data Integrity Audits:** Using SQL to visualize "invisible" data gaps and reconcile disconnected systems across departments.
---

## Architecture
```mermaid
graph LR
    %% Estilos Personalizados para Resaltar
    classDef gcp fill:#e8f0fe,stroke:#4285f4,stroke-width:3px,color:#0d47a1;
    classDef drive fill:#f1f8e9,stroke:#33691e,stroke-width:2px,color:#1b5e20;
    classDef tableau fill:#fff3e0,stroke:#e65100,stroke-width:3px,color:#e65100;
    classDef sql fill:#fff,stroke:#4285f4,stroke-width:1px,stroke-dasharray: 5 5,color:#4285f4;

    %% Nodos Principales
    subgraph Cloud ["🔵 Google Cloud Platform (GCP)"]
        direction TB
        BQ("<b>BigQuery Data Warehouse</b>"):::gcp
        Logic("<b>SQL Scripting</b><br>(Joins, CTEs, Windows)"):::sql
    end

    Storage("<b>Google Drive</b><br>(Staging Area / Sheets)"):::drive
    Viz("<b>Tableau Public</b><br>(Dashboarding & Storytelling)"):::tableau

    %% Conexiones
    Logic --> BQ
    BQ -->|Export Processed Data| Storage
    Storage -->|Live Connection| Viz
```
---
## Architecture 2
```mermaid 
graph LR
    %% Definición de estilos
    classDef gcp fill:#e8f0fe,stroke:#4285f4,stroke-width:3px,color:#000000,rx:10,ry:10;
    classDef drive fill:#e6f4ea,stroke:#0f9d58,stroke-width:3px,color:#000000,rx:10,ry:10;
    classDef tableau fill:#fff0e0,stroke:#e97627,stroke-width:3px,color:#000000,rx:10,ry:10;
    classDef github fill:#f6f8fa,stroke:#24292e,stroke-width:3px,color:#000000,rx:10,ry:10;
    
    %% BLOQUE 1: GCP
    subgraph B1 [" "]
        direction TB
        %% EL FIX: Comillas dobles alrededor de todo el texto HTML
        Header1["<b>1. Data Processing & Logic</b><br>(Google Cloud Platform)"]:::gcpHeader
        List1["• Ingesta de datos crudos.<br>• Consultas SQL complejas<br>(CTEs, Window Functions).<br>• Limpieza y Transformación."]:::leftAlign
    end
    class B1 gcp;

    %% FLECHA 1
    B1 == "Export Processed Data (CSV)" ==> B2

    %% BLOQUE 2: Drive
    subgraph B2 [" "]
        direction TB
        Header2["<b>2. Staging Area</b><br>(Google Drive)"]:::driveHeader
        List2["• Almacenamiento seguro.<br>• Puente de conexión entre<br>la nube y el BI.<br>• Organización de Datasets."]:::leftAlign
    end
    class B2 drive;

    %% FLECHA 2
    B2 == "Live Connection" ==> B3

    %% BLOQUE 3: Tableau
    subgraph B3 [" "]
        direction TB
        Header3["<b>3. Visualization</b><br>(Tableau Public)"]:::tableauHeader
        List3["• Dashboards interactivos.<br>• Diseño de KPIs.<br>• Filtros y Parámetros.<br>• Storytelling visual."]:::leftAlign
    end
    class B3 tableau;

    %% FLECHA 3
    B3 == "Documentation" ==> B4

    %% BLOQUE 4: GitHub
    subgraph B4 [" "]
        direction TB
        Header4["<b>4. Portfolio & Versioning</b><br>(GitHub)"]:::githubHeader
        List4["• Repositorio de código SQL.<br>• Documentación técnica.<br>• Presentación profesional<br>del proyecto."]:::leftAlign
```

---

*Connect with me on [linkedin.com/in/oscartibaduiza](https://www.linkedin.com/in/oscartibaduiza/)*
