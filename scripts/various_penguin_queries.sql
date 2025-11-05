--Query to find the heaviest Gentoo Penguin
SELECT *
FROM gold.penguins_gentoo
ORDER BY body_mass_g DESC;

--Query to find the heaviest Chinstrap Penguin
SELECT *
FROM gold.penguins_chinstrap
ORDER BY body_mass_g DESC;

--Query to find the heaviest Adelie Penguin
SELECT *
FROM gold.penguins_adelie
ORDER BY body_mass_g DESC;

--Query to find the avg body mass for each island
SELECT 
island,
AVG(body_mass_g) AS avg_body_mass
FROM gold.penguins_size
GROUP BY island;

--Query to find the avg body mass for each Species
SELECT
species,
AVG(body_mass_g) AS avg_body_mass
FROM gold.penguins_size
GROUP BY species;

--Query to find the penguin count on each island
SELECT
Count(*) AS penguin_count_by_island,
island
FROM gold.penguins_size
GROUP BY island;

--Query to find penguin count by species
SELECT
COUNT(*) as penguin_count_by_species,
species
FROM gold.penguins_size
GROUP BY species;
