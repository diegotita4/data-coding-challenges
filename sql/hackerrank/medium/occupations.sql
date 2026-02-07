
/*
Title: Occupations
Platform: HackerRank
Difficulty: Medium
SQL Dialect: MS SQL Server

Problem Summary:
Transform a list of names and occupations into a table where each occupation appears as a column, ordered alphabetically by name.

Approach:
- Assign a row number to each name within its occupation ordered alphabetically.
- Use conditional aggregation to pivot occupations into separate columns.
- Group by row number to align names across occupations.
- Order the final output by row number.
*/

WITH ranked AS (
    SELECT
        Name
        , Occupation
        , ROW_NUMBER() OVER (
            PARTITION BY Occupation
            ORDER BY Name
        ) AS [rn]
    FROM OCCUPATIONS
)
SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS [Doctor]
    , MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS [Professor]
    , MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS [Singer]
    , MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS [Actor]
FROM ranked
GROUP BY rn
ORDER BY rn;
