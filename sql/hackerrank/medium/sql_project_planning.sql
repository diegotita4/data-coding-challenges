
/*
Title: SQL Project Planning
Platform: HackerRank
Difficulty: Medium
SQL Dialect: MS SQL Server

Problem Summary:
Group consecutive project tasks into continuous projects and return their start and end dates ordered by project duration.

Approach:
- Use a window function to detect breaks between consecutive tasks.
- Flag the start of new projects using LAG.
- Generate project identifiers by cumulatively summing break flags.
- Aggregate tasks per project to obtain project start and end dates.
- Order projects by duration and start date.
*/

WITH lagged AS (
    SELECT
        Task_ID
        , Start_Date
        , End_Date
        , CASE
            WHEN Start_Date != LAG(End_Date) OVER (ORDER BY Start_Date) THEN 1
            ELSE 0
        END AS [is_new_project]
    FROM Projects
),
project_groups AS (
    SELECT
        Task_ID
        , Start_Date
        , End_Date
        , SUM(is_new_project) OVER (ORDER BY Start_Date) AS [project_id]
    FROM lagged
)
SELECT
    MIN(Start_Date) AS [project_start],
    MAX(End_Date) AS [project_end]
FROM project_groups
GROUP BY [project_id]
ORDER BY
    DATEDIFF(DAY, MIN(Start_Date), MAX(End_Date)) ASC
    , MIN(Start_Date) ASC;
