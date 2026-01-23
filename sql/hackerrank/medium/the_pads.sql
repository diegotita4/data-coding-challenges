
/*
Title: The PADS
Platform: HackerRank
Category: Aggregation & String Functions
Difficulty: Medium
SQL Dialect: MS SQL Server

Problem Summary:
Generate formatted output using names and occupations, and display the count of each occupation in a specific format.

Approach:
- Format names using string concatenation
- Aggregate occupations using COUNT and GROUP BY
- Order results according to problem specifications
*/

SELECT
    CONCAT(Name, '(', LEFT(Occupation, 1), ')')
FROM OCCUPATIONS
ORDER BY Name ASC;

SELECT
    CONCAT('There are a total of ', COUNT(*) , ' ', LOWER(Occupation), 's.') AS [occupation_summary]
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY
    COUNT(*) ASC
    , Occupation ASC;
