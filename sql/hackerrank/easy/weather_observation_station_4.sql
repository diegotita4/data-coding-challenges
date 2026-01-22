
/*
Title: Weather Observation Station 4
Platform: HackerRank
Category: Aggregation
Difficulty: Easy
SQL Dialect: MS SQL Server

Problem Summary:
Calculate the number of duplicate city entries in the STATION table.

Approach:
- Count total rows
- Count distinct city names
- Compute the difference
*/

SELECT
    COUNT(*) - COUNT(DISTINCT CITY) AS [difference]
FROM STATION;
