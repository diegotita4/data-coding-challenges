
/*
Title: Binary Tree Nodes
Platform: HackerRank
Difficulty: Medium
SQL Dialect: MS SQL Server

Problem Summary:
Classify each node in a binary search tree as Root, Inner, or Leaf based on parent-child relationships.

Approach:
- Identify root nodes where parent is NULL.
- Use a subquery to determine if a node appears as a parent of another node.
- Classify nodes with children as Inner nodes.
- Classify remaining nodes as Leaf nodes.
- Order results by node value.
*/

SELECT
    N AS [node]
    , CASE
        WHEN P IS NULL THEN 'Root'
        WHEN EXISTS (
            SELECT 1
            FROM BST AS BST_2
            WHERE BST_2.P = BST.N
        ) THEN 'Inner'
        ELSE 'Leaf'
    END AS [node_type]
FROM BST
ORDER BY [node] ASC;
