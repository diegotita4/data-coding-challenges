
/*
Title: Weather Observation Station 15
Platform: HackerRank
Category: Subqueries / Ordering
Difficulty: Easy
SQL Dialect: MS SQL Server

Problem Summary:
Find the western longitude for the largest latitude less than 137.2345, rounded to 4 decimal places.

Approach:
- Filter LAT_N below threshold
- Order descending
- Select top result
- Explicit rounding and casting
*/

SELECT TOP 1
    CAST(ROUND(LONG_W, 4) AS DECIMAL(10, 4)) AS [western_longitude]
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC;
