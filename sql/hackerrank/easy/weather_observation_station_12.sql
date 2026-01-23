
/*
Title: Weather Observation Station 12
Platform: HackerRank
Difficulty: Easy
SQL Dialect: MS SQL Server

Problem Summary:
Retrieve distinct city names that do not start and do not end with a vowel.

Approach:
- Use LIKE with character sets
- Exclude cities starting or ending with vowels
*/

SELECT DISTINCT
    CITY
FROM STATION
WHERE CITY NOT LIKE '[aeiou]%'
    AND CITY NOT LIKE '%[aeiou]';
