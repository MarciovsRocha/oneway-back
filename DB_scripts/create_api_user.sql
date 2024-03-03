/*
 * Create new logon [master]
 */

CREATE LOGIN [api_user] 
	WITH PASSWORD = 'bHoiwym4oUGArVGh';
GO

/*
 * create new user based on logon [oneway]
 */

CREATE USER api_user
	FOR LOGIN api_user
	WITH DEFAULT_SCHEMA = dbo
GO

-- grant SELECT [oneway]
EXEC sp_addrolemember N'db_datareader', N'api_user';
GO

-- grant INSERT, DELETE, UPDATE [oneway]
EXEC sp_addrolemember N'db_datawriter', N'api_user';
GO
