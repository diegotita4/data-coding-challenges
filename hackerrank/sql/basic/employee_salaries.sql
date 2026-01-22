
/*
Title: Employee Salaries
Platform: HackerRank
Category: Filtering
Difficulty: Easy
SQL Dialect: MS SQL Server

Problem Summary:
Retrieve employee names where the salary is greater than 2000 and the number of months worked is less than 10.

Approach:
- Apply numeric filters
- Order results by employee ID
*/

SELECT
    name
FROM Employee
WHERE salary > 2000
    AND months < 10
ORDER BY employee_id ASC;
