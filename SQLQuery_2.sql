USE master

DECLARE @dbname NVARCHAR(128), @sqlcommand NVARCHAR(MAX) = ''
DECLARE @tablenameproduct NVARCHAR(128), @tablenamegrocery NVARCHAR(128)
SET @dbname = 'GroceriesDB'
SET @tablenameproduct = 'Product'
SET @tablenamegrocery = 'Grocery'

IF NOT (EXISTS (SELECT name FROM sys.databases 
WHERE ('[' + name + ']' = @dbname 
OR name = @dbname)))
BEGIN    
    SET @sqlcommand = 'CREATE DATABASE ' + @dbname + ';';
    EXEC(@sqlcommand);
    SET @sqlcommand = '';
END

USE GroceriesDB

IF OBJECT_ID('dbo.Product', 'U') IS NOT NULL 
BEGIN
    SET @sqlcommand = 'DROP TABLE ' + @tablenameproduct + ';';
    EXEC(@sqlcommand);
SET @sqlcommand = '';
END

SET @sqlcommand = 'CREATE TABLE ' + @tablenameproduct + ' (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(128),
    prix DECIMAL(10,2));';

EXEC(@sqlcommand);
SET @sqlcommand = '';

INSERT INTO dbo.Product VALUES('Product1', 60.00);
INSERT INTO dbo.Product VALUES('Product2', 34.60);
INSERT INTO dbo.Product VALUES('Product3', 100.01);

IF OBJECT_ID('dbo.Grocery', 'U') IS NOT NULL 
BEGIN
    SET @sqlcommand = 'DROP TABLE ' + @tablenamegrocery + ';';
    EXEC(@sqlcommand);
SET @sqlcommand = '';
END

SET @sqlcommand = 'CREATE TABLE ' + @tablenamegrocery + ' (
    id INT PRIMARY KEY IDENTITY(1,1),
    total DECIMAL(10,2),
    date DATE);';

EXEC(@sqlcommand);
SET @sqlcommand = '';

INSERT INTO dbo.Grocery VALUES(1134.92, '2024-12-03');
INSERT INTO dbo.Grocery VALUES(109890.12, '2023-09-09');
