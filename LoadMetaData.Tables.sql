USE [AdventureWorksLT2014]
GO

/* MetaData.MetaDataTable from INFORMATION_SCHEMA.TABLES */
insert into MetaData.MetaDataTable (TableSchema, TableName, TableDesc)
select TABLE_SCHEMA, TABLE_NAME, TABLE_NAME
from INFORMATION_SCHEMA.TABLES ist
where not exists (
	select 1
	from MetaData.MetaDataTable mdt
	where mdt.TableName = ist.TABLE_NAME
);

/* MetaData.MetaDataColumn from INFORMATION_SCHEMA.COLUMNS */
WITH DataTypeConversion (DataType, DataTypeCs, DataTypeJs)  
AS  
(  
	select distinct DATA_TYPE, 
	case DATA_TYPE  
		when 'bit' then 'bool'
		when 'char' then 'string' 
		when 'date' then 'DateTime'
		when 'datetime' then 'DateTime'
		when 'datetime2' then 'DateTime'
		when 'money' then 'decimal' 
		when 'nchar' then 'string'
		when 'ntext' then 'string' 
		when 'numeric' then 'decimal'
		when 'nvarchar' then 'string'		
		when 'rowversion' then 'byte[]'		
		when 'text' then 'string'		
		when 'uniqueidentifier' then 'Guid'
		when 'xml' then 'string'
		when 'tinyint' then 'byte'
		when 'varbinary' then 'byte[]'
		else 'string'
	end as DataTypeJs,
	case DATA_TYPE 
		when 'bit' then 'boolean'
		when 'char' then 'string' 
		when 'date' then 'string'
		when 'datetime' then 'string'
		when 'datetime2' then 'string'
		when 'money' then 'number' 
		when 'nchar' then 'string'
		when 'ntext' then 'string' 
		when 'numeric' then 'number'
		when 'nvarchar' then 'string'		
		when 'rowversion' then 'string'		
		when 'text' then 'string'		
		when 'uniqueidentifier' then 'string'
		when 'xml' then 'string'
		when 'tinyint' then 'string'
		when 'varbinary' then 'string'
		else 'string'
	end as DataTypeCs
	from INFORMATION_SCHEMA.COLUMNS /* https://i.stack.imgur.com/CBhE9.png */
) 
insert into MetaData.MetaDataColumn(TableSchema, TableName, ColumnName, ColumnDesc, ColumnLabel, DataTypeJs, DataTypeCs) 
select TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, COLUMN_NAME, COLUMN_NAME, 
(select DataTypeJs from  DataTypeConversion where DataType = DATA_TYPE),
(select DataTypeCs from  DataTypeConversion where DataType = DATA_TYPE)
from INFORMATION_SCHEMA.COLUMNS isc
where not exists (
	select 1 from MetaData.MetaDataColumn mdc 	where mdc.TableName = isc.TABLE_NAME and mdc.ColumnName = isc.COLUMN_NAME
)