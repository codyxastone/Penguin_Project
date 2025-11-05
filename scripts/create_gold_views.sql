/*
==================================================
Create gold level views for aggregation
==================================================
Script purpose:
	Running this script will add a primary key named 'id' as well as create three views that are filtered results
	from the silver.penguins_size table. Each view is filtered to one species of penguin
*/

--Add a primary key to the table named 'id'
ALTER TABLE your_table
ADD id INT IDENTITY(1,1) PRIMARY KEY;
GO
--Create a view of from the silver.penguins_size table that his filtered for aggregation by the speciece to only show adelie
CREATE VIEW gold.penguins_adelie AS(
	SELECT 
	id,
	species,
	island,
	culmen_length_mm,
	culmen_depth_mm,
	flipper_length_mm,
	body_mass_g,
	sex
	FROM silver.penguins_size
	WHERE species = 'Adelie'
);
GO
--Create a view of from the silver.penguins_size table that his filtered for aggregation by the speciece to only show chinstrap
CREATE VIEW gold.penguins_chinstrap AS(
	SELECT 
	id,
	species,
	island,
	culmen_length_mm,
	culmen_depth_mm,
	flipper_length_mm,
	body_mass_g,
	sex
	FROM silver.penguins_size
	WHERE species = 'chinstrap'
);
GO
--Create a view of from the silver.penguins_size table that his filtered for aggregation by the speciece to only show gentoo
CREATE VIEW gold.penguins_gentoo AS(
	SELECT 
	id,
	species,
	island,
	culmen_length_mm,
	culmen_depth_mm,
	flipper_length_mm,
	body_mass_g,
	sex
	FROM silver.penguins_size
	WHERE species = 'gentoo'
);
