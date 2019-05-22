
SET QUOTED_IDENTIFIER OFF;
GO
USE [AdventureWorksLT2014];
GO
IF SCHEMA_ID(N'MetaData') IS NULL EXECUTE(N'CREATE SCHEMA [MetaData]');
GO

IF OBJECT_ID('MetaData.MetaDataTable', 'U') IS NOT NULL  
	DROP TABLE MetaData.MetaDataTable
IF OBJECT_ID('MetaData.MetaDataColumn', 'U') IS NOT NULL  
	DROP TABLE MetaData.MetaDataColumn
GO

CREATE TABLE MetaData.MetaDataTable(
TableSchema nvarchar(50) NOT NULL,
TableName nvarchar(50) NOT NULL,
-- custom meta-data
TableDesc nvarchar(max) NOT NULL,
TableResourceName nvarchar(max)  NULL,
--
PRIMARY KEY CLUSTERED ( TableSchema ASC,TableName ASC ))
GO

CREATE TABLE MetaData.MetaDataColumn(
TableSchema nvarchar(50) NOT NULL,
TableName nvarchar(50) NOT NULL,
ColumnName nvarchar(50) NOT NULL,
-- custom meta-data
ColumnDesc nvarchar(max) NOT NULL,
ColumnLabel nvarchar(max) NOT NULL,
DataTypeJs nvarchar(128) NOT NULL,
DataTypeCs nvarchar(128) NOT NULL,
--
PRIMARY KEY CLUSTERED ( TableSchema ASC,TableName ASC,ColumnName ASC ))
GO


