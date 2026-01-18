
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'EShopDb')
BEGIN
    CREATE DATABASE EShopDb;
END
GO

USE EShopDb;
GO

IF OBJECT_ID('Categories', 'U') IS NOT NULL
    DROP TABLE Categories;
GO

CREATE TABLE Categories (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255)
);
GO
IF OBJECT_ID('Products', 'U') IS NOT NULL
    DROP TABLE Products;
GO

CREATE TABLE Products (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Price DECIMAL(18,2) NOT NULL,
    Stock INT NOT NULL,
    CategoryId INT NOT NULL,
    CONSTRAINT FK_Products_Categories
        FOREIGN KEY (CategoryId)
        REFERENCES Categories(Id)
);
GO
SELECT 
    COLUMN_NAME AS [Tên cột],
    DATA_TYPE AS [Kiểu dữ liệu],
    IS_NULLABLE AS [Cho phép NULL]
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Products';
GO
