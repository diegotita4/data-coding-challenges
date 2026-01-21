
/*
Title: Type of Triangle
Platform: HackerRank
Category: Conditional Logic
Difficulty: Easy
SQL Dialect: MS SQL Server

Problem Summary:
Given the lengths of three sides of a triangle, classify the triangle as Equilateral, Isosceles, Scalene, or Not A Triangle.

Approach:
- First validate if the three sides can form a valid triangle
- Then classify the triangle based on side equality
*/

SELECT
    CASE
        WHEN A + B <= C OR A + C <= B OR C + B <= A THEN 'Not A Triangle'
        WHEN A = B AND A = C THEN 'Equilateral'
        WHEN A <> B AND A <> C AND B <> C THEN 'Scalene'
        ELSE 'Isosceles'
    END AS [triangle_type]
FROM TRIANGLES;
