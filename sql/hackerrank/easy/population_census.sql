
/*
Title: Population Census
Platform: HackerRank
Category: Basic Joins
Difficulty: Easy
SQL Dialect: MS SQL Server

Problem Summary:
Calculate the total population of cities located in countries from the Asian continent.

Approach:
- Join CITY and COUNTRY tables
- Filter by continent
- Aggregate population
*/

SELECT
    SUM(CAST(CI.POPULATION AS BIGINT)) AS [sum_population]
FROM CITY AS CI
INNER JOIN COUNTRY AS CO
    ON CO.CODE = CI.COUNTRYCODE
WHERE CO.CONTINENT = 'Asia';
