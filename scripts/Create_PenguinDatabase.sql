/*
==========================================================
CREATE DATABASE AND SCHEMAS
==========================================================
Script Purpose:

	Check to see if PenguinDatabase exists, if not it will create the database
	along with the silver and gold schemas.

WARNING:
	Rinning this script will drop the entiere 'PenguinDatabase' if it exists.
	All data in the database will be permanently deleted. Ensure proper backups
	are up to date before running this script.
*/

USE master;
GO

--Drop and recreate the 'PenguinDatabase'
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'PenguinDatabase')
BEGIN
	ALTER DATABASE PenguinDatabase SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE PenguinDatabase;
END;
GO
--CREATE 'PenguinDatabase'
CREATE DATABASE PenguinDatabase;
GO

USE PenguinDatabase;
GO

CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
