
/*
Title: Average Population of Each Continent
Platform: HackerRank
Category: Aggregation & Joins
Difficulty: Easy
SQL Dialect: MS SQL Server

Problem Summary:
Compute the average city population for each continent and round it down to the nearest integer.

Approach:
- Join CITY and COUNTRY tables
- Group by continent
- Compute average population
- Apply FLOOR to round down
*/

SELECT
    CO.CONTINENT AS [continent_name]
    , FLOOR(AVG(CAST(CI.POPULATION AS BIGINT))) AS [avg_population]
FROM CITY AS CI
INNER JOIN COUNTRY AS CO
    ON CO.CODE = CI.COUNTRYCODE
GROUP BY CO.CONTINENT;
