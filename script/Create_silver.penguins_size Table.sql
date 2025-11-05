/* 
============================================================
Create table silver.penguins
============================================================
Script Purpose:
	Checks to see if the talbe: 'silver.penguins' exists within the database
	if so, it will drop the table then create a new one. If no table exists
	it will create the table.
*/

USE PenguinDatabase;
GO
--Check if table exists within 'PenguinDatabase' if so, drop it
IF OBJECT_ID ('silver.penguins' , 'U') IS NOT NULL
	DROP TABLE silver.penguins;


--Create Table
CREATE TABLE silver.penguins(
	species NVARCHAR(50),
	island NVARCHAR(50),
	culmen_length_mm NVARCHAR(50),
	culmen_depth_mm NVARCHAR(50),
	flipper_length INT,
	body_mass_g Int,
	sex NVARCHAR(50)
)
