-- Creación de la tabla para importar el dataset de Superstore
CREATE TABLE Superstore_Sales (
    RowID INT,
    OrderID VARCHAR(255),
    OrderDate DATE,
    ShipDate DATE,
    ShipMode VARCHAR(50),
    CustomerID VARCHAR(255),
    CustomerName VARCHAR(255),
    Segment VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    Region VARCHAR(50),
    ProductID VARCHAR(255),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    ProductName VARCHAR(255),
    Sales DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(5, 2),
    Profit DECIMAL(10, 2)
);
