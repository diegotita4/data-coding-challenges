
/*
Title: Print Prime Numbers
Platform: HackerRank
Difficulty: Medium
SQL Dialect: MS SQL Server

Problem Summary:
Print all prime numbers from 2 to 1000 separated by '&'.

Approach:
- Generate numbers from 2 to 1000 using a recursive CTE.
- For each number, check that no smaller number greater than 1 divides it exactly.
- Use NOT EXISTS to filter only prime numbers.
- Concatenate results using STRING_AGG with '&' separator.
*/

WITH Numbers AS (
    SELECT
        2 AS [n]
    UNION ALL
    SELECT
        n + 1
    FROM Numbers
    WHERE n < 1000
)
SELECT
    STRING_AGG(n, '&')
FROM Numbers AS N_1
WHERE NOT EXISTS (
    SELECT
        1
    FROM Numbers AS N_2
    WHERE N_2.n < N_1.n
        AND N_1.n % N_2.n = 0
        AND N_2.n > 1
)
OPTION (MAXRECURSION 1000);
