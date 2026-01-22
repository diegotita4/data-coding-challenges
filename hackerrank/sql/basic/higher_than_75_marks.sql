
/*
Title: Higher Than 75 Marks
Platform: HackerRank
Category: Filtering & Ordering
Difficulty: Easy
SQL Dialect: MS SQL Server

Problem Summary:
Retrieve the names of students who scored more than 75 marks, ordered by the last three characters of their names. If there is a tie, order by ID.

Approach:
- Filter by marks
- Sort using string function
- Apply secondary ordering by ID
*/

SELECT
    Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY
    RIGHT(Name, 3) ASC
    , ID ASC;
