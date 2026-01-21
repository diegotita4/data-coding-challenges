
/*
Title: Weather Observation Station 17
Platform: HackerRank
Category: Filtering & Ordering
Difficulty: Easy
SQL Dialect: MS SQL Server

Problem Summary:
Find the western longitude where the latitude is the smallest value greater than 38.7780, rounded to 4 decimal places.

Approach:
- Filter LAT_N above threshold
- Order ascending
- Select top result
- Explicit rounding and casting
*/

SELECT TOP 1
    CAST(ROUND(LONG_W, 4) AS DECIMAL(10, 4)) AS [western_longitude]
FROM STATION
WHERE LAT_N > 38.7780
ORDER BY LAT_N ASC;
