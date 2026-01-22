
/*
Title: The Blunder
Platform: HackerRank
Category: Aggregation & Type Casting
Difficulty: Easy
SQL Dialect: MS SQL Server

Problem Summary:
Calculate the ceiling of the difference between the average salary and the average salary with all zeros removed.

Approach:
- Compute the average of the original salary
- Remove zeros from salary values using string replacement
- Cast back to numeric type
- Apply CEILING to the final difference
*/

SELECT
    CEILING(
        AVG(CAST(Salary AS DECIMAL(10,2))) - 
        AVG(CAST(NULLIF(REPLACE(CAST(Salary AS VARCHAR(20)), '0', ''), '') AS DECIMAL(10, 2)))
    ) AS [error]
FROM EMPLOYEES;
