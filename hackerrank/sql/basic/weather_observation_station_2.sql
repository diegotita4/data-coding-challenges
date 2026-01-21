
/*
Title: Weather Observation Station 2
Platform: HackerRank
Category: Aggregation
Difficulty: Easy
SQL Dialect: MS SQL Server

Problem Summary:
Compute the sum of LAT_N and LONG_W rounded to 2 decimal places.

Approach:
- Aggregate using SUM
- Explicitly round results
- Cast to DECIMAL(10,2) for formatting
*/

SELECT
    CAST(ROUND(SUM(LAT_N), 2) AS DECIMAL(10, 2)) AS "sum_lat_n",
    CAST(ROUND(SUM(LONG_W), 2) AS DECIMAL(10, 2)) AS "sum_long_w"
FROM STATION;
