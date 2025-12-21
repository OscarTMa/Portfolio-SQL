# 🛒 Análisis de Ventas - Global Superstore

## 📌 Descripción del Proyecto
Este proyecto utiliza SQL para analizar un dataset de ventas minoristas globales. El objetivo es identificar las categorías más rentables, los productos más vendidos y detectar regiones con pérdidas financieras.

## 🗂 Estructura del Proyecto
* **Dataset:** Kaggle Global Superstore
* **Base de Datos:** SQL Server / PostgreSQL
* **Conceptos Clave:** Agregaciones, Filtrado de Grupos (`HAVING`), Lógica Condicional (`CASE`).

## 🔎 Consultas Clave (Insights)
* **Categorías:** La categoría "Technology" presenta el mayor margen de beneficio a pesar de no tener el mayor volumen de unidades.
* **Regiones:** Se detectaron pérdidas operativas en ciertas regiones que requieren revisión de estrategia de precios.

## 🧠 Teoría Aplicada (Generado con NotebookLM)
### Diferencia entre WHERE y HAVING
En este análisis, utilizamos `HAVING` para filtrar clientes *después* de haber sumado sus compras totales.
* **WHERE:** Filtra filas individuales antes de agruparlas (ej. filtrar por año 2023).
* **HAVING:** Filtra los resultados agregados (ej. filtrar clientes cuya SUMA de ventas sea > 5000).

*(Ver `docs/theory_explanation.md` para la explicación completa)*.
