
/*
Title: Symmetric Pairs
Platform: HackerRank
Difficulty: Medium
SQL Dialect: MS SQL Server

Problem Summary:
Identify symmetric function pairs where one row mirrors another, ensuring proper handling of duplicate self-pairs.

Approach:
- Self-join the functions table to detect mirrored pairs.
- Use conditional filtering to avoid duplicate pair ordering.
- Handle self-pairs separately by verifying duplicate occurrences.
- Order results by X value.
*/

SELECT
    F.X
    , F.Y
FROM Functions AS F
JOIN Functions AS F_2
    ON F.X = F_2.Y
        AND F.Y = F_2.X
GROUP BY
    F.X
    , F.Y
HAVING COUNT(*) > 1
    OR F.X < F.Y
ORDER BY F.X ASC;
