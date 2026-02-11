
/*
Title: 15 Days of Learning SQL
Platform: HackerRank
Difficulty: Hard
SQL Dialect: MS SQL Server

Problem Summary:
For each day starting from 2016-03-01:
1. Count hackers who submitted at least once every day from the start.
2. Identify the hacker with the maximum submissions that day.

Approach:
- Aggregate daily submissions per hacker.
- Rank hackers per day using ROW_NUMBER.
- Compute cumulative submission days per hacker using window functions.
- Validate continuous participation by comparing cumulative count with calendar day difference.
- Join results and order by date.
*/

WITH daily_submissions AS (
    SELECT
        submission_date
        , hacker_id
        , COUNT(*) AS [count_submissions]
    FROM Submissions
    GROUP BY
        submission_date
        , hacker_id
),
top_hacker_per_day AS (
    SELECT
        submission_date
        , hacker_id
    FROM (
        SELECT
            submission_date
            , hacker_id
            , ROW_NUMBER() OVER (
                PARTITION BY submission_date
                ORDER BY
                    count_submissions DESC
                    , hacker_id ASC
            ) AS [rn]
        FROM daily_submissions
    ) AS [T]
    WHERE rn = 1
),
daily_hackers AS (
    SELECT DISTINCT
        submission_date
        , hacker_id
    FROM Submissions
),
hacker_days AS (
    SELECT
        submission_date
        , hacker_id
        , COUNT(*) OVER (
            PARTITION BY hacker_id
            ORDER BY submission_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS [days_so_far]
    FROM daily_hackers
),
valid_hackers AS (
    SELECT
        submission_date
        , hacker_id
    FROM hacker_days
    WHERE days_so_far = DATEDIFF(day, '2016-03-01', submission_date) + 1
),
valid_hacker_count AS (
    SELECT
        submission_date
        , COUNT(*) AS [total_hackers]
    FROM valid_hackers
    GROUP BY submission_date
)
SELECT
    V.submission_date
    , V.total_hackers
    , T.hacker_id
    , H.name
FROM valid_hacker_count AS V
JOIN top_hacker_per_day AS T
    ON V.submission_date = T.submission_date
JOIN Hackers AS H
    ON T.hacker_id = H.hacker_id
ORDER BY V.submission_date;
