/*
PROYECTO: Análisis de Ventas Global Superstore
OBJETIVO: Responder preguntas de negocio sobre rendimiento y beneficios.
*/

-- 1. EDA Básico: Revisar la data y verificar totales
SELECT COUNT(*) AS Total_Orders, SUM(Sales) AS Total_Revenue
FROM Superstore_Sales;

-- 2. Análisis de Ventas por Categoría (¿Qué vendemos más?)
-- Uso de GROUP BY y ORDER BY para ranking
SELECT 
    Category, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit
FROM Superstore_Sales
GROUP BY Category
ORDER BY Total_Profit DESC;

-- 3. Top 5 Productos más vendidos (Best Sellers)
-- Uso de LIMIT (PostgreSQL) o TOP (SQL Server)
SELECT TOP 5 ProductName, SUM(Quantity) AS Units_Sold
FROM Superstore_Sales
GROUP BY ProductName
ORDER BY Units_Sold DESC;

-- 4. Rentabilidad por Región (¿Dónde perdemos dinero?)
-- Uso de CASE para etiquetar el margen de beneficio
SELECT 
    Region,
    SUM(Sales) AS Revenue,
    SUM(Profit) AS Profit,
    CASE 
        WHEN SUM(Profit) < 0 THEN 'Pérdida'
        WHEN SUM(Profit) BETWEEN 0 AND 10000 THEN 'Bajo Margen'
        ELSE 'Alta Rentabilidad'
    END AS Profit_Status
FROM Superstore_Sales
GROUP BY Region
ORDER BY Profit DESC;

-- 5. Clientes con alto valor (Ventas > $5,000)
-- Uso de HAVING para filtrar después de agrupar
SELECT CustomerName, SUM(Sales) AS Total_Spent
FROM Superstore_Sales
GROUP BY CustomerName
HAVING SUM(Sales) > 5000
ORDER BY Total_Spent DESC;
