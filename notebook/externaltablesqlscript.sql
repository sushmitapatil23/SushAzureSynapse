IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'azuresynapsesushcontainer_azuresynapsesushadlsgen2_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [azuresynapsesushcontainer_azuresynapsesushadlsgen2_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://azuresynapsesushcontainer@azuresynapsesushadlsgen2.dfs.core.windows.net' 
	)
GO

CREATE EXTERNAL TABLE [dbo].[EmployeeSalary] (
	[C1] nvarchar(4000),
	[C2] nvarchar(4000),
	[C3] nvarchar(4000),
	[C4] nvarchar(4000),
	[C5] nvarchar(4000)
	)
	WITH (
	LOCATION = 'synapsedemo/EmployeeSalary.txt',
	DATA_SOURCE = [azuresynapsesushcontainer_azuresynapsesushadlsgen2_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM [dbo].[EmployeeSalary]
GO