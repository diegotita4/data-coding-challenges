
/*
Title: New Companies
Platform: HackerRank
Difficulty: Medium
SQL Dialect: MS SQL Server

Problem Summary:
For each company, return the total number of lead managers, senior managers, managers, and employees.

Approach:
- Join tables following the company hierarchy.
- Use COUNT(DISTINCT) to avoid duplication.
- Group by company and founder.
*/

SELECT
    C.company_code
    , C.founder
    , COUNT(DISTINCT LM.lead_manager_code)   AS [lead_managers]
    , COUNT(DISTINCT SM.senior_manager_code) AS [senior_managers]
    , COUNT(DISTINCT M.manager_code)         AS [managers]
    , COUNT(DISTINCT E.employee_code)        AS [employees]
FROM Company AS C
JOIN Lead_Manager AS LM
    ON LM.company_code = C.company_code
JOIN Senior_Manager AS SM
    ON SM.lead_manager_code = LM.lead_manager_code
JOIN Manager AS M
    ON M.senior_manager_code = SM.senior_manager_code
JOIN Employee AS E
    ON E.manager_code = M.manager_code
GROUP BY
    C.company_code
    , C.founder
ORDER BY C.company_code ASC;
