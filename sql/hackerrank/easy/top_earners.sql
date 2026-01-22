
/*
Title: Top Earners
Platform: HackerRank
Category: Aggregation
Difficulty: Easy
SQL Dialect: MS SQL Server

Problem Summary:
Find the maximum total earnings (salary * months) and the number of employees earning that amount.

Approach:
- Compute total earnings per employee
- Group by total earnings
- Order results in descending order
- Select the top result
*/

SELECT TOP 1
    CONCAT(
        salary * months,
        ' ',
        COUNT(*)
    ) AS [result]
FROM Employee
GROUP BY salary * months
ORDER BY salary * months DESC;
