
/*
Title: Weather Observation Station 5
Platform: HackerRank
Category: String Functions
Difficulty: Easy
SQL Dialect: MS SQL Server

Problem Summary:
Find the cities with the longest and shortest names. If there is a tie, return the alphabetically first city.

Approach:
- Compute city name length using LEN().
- Sort by length and city name.
- Select the top result for each case.
*/

SELECT TOP 1
    CITY
    , LEN(CITY) AS [city_length]
FROM STATION
ORDER BY
    LEN(CITY) DESC
    , CITY ASC

SELECT TOP 1
    CITY
    , LEN(CITY) AS [city_length]
FROM STATION
ORDER BY
    LEN(CITY) ASC
    , CITY ASC;
