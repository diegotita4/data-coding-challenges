
/*
Title: Olivander's Inventory
Platform: HackerRank
Difficulty: Medium
SQL Dialect: MS SQL Server

Problem Summary:
Retrieve the least expensive non-evil wand for each combination of power and age, ordered by descending power and age.

Approach:
- Join wands with their properties to exclude evil wands.
- Use a CTE to compute the minimum coins needed per power and age.
- Join back to retrieve the full wand details matching the minimum cost.
- Sort results by power and age in descending order.
*/

WITH min_coins_needed AS (
    SELECT
        W.power
        , WP.age
        , MIN(W.coins_needed) AS [min_coins_needed]
    FROM Wands AS W
    JOIN Wands_Property AS WP
        ON W.code = WP.code
    WHERE WP.is_evil = 0
    GROUP BY
        W.power
        , WP.age
)
SELECT
    W.id
    , WP.age
    , W.coins_needed
    , W.power
FROM Wands AS W
JOIN Wands_Property AS WP
    ON W.code = WP.code
JOIN min_coins_needed AS MCN
    ON W.power = MCN.power
        AND WP.age = MCN.age
        AND W.coins_needed = MCN.min_coins_needed
ORDER BY
    W.power DESC
    , WP.age DESC;
