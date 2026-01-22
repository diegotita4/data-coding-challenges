
/*
Title: Population Density Difference
Platform: HackerRank
Category: Aggregation
Difficulty: Easy
SQL Dialect: MS SQL Server

Problem Summary:
Calculate the difference between the maximum and minimum population values in the CITY table.

Approach:
- Use aggregate functions MAX and MIN
- Compute the difference
*/

SELECT
    MAX(CAST(POPULATION AS BIGINT)) -
    MIN(CAST(POPULATION AS BIGINT)) AS [population_difference]
FROM CITY;
