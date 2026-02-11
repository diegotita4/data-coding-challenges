
/*
Title: Interviews
Platform: HackerRank
Difficulty: Hard
SQL Dialect: MS SQL Server

Problem Summary:
For each contest, compute aggregated statistics across all related colleges and challenges, including submissions, accepted submissions, views, and unique views. Exclude contests with zero total activity.

Approach:
- Join Contests → Colleges → Challenges to define contest scope.
- Pre-aggregate Submission_Stats and View_Stats by challenge_id.
- LEFT JOIN aggregated stats to avoid row multiplication.
- Use COALESCE to handle NULL values.
- Aggregate results at contest level.
- Filter contests with no activity using HAVING.
*/

SELECT
    CON.contest_id
    , CON.hacker_id
    , CON.name
    , SUM(COALESCE(SS.total_submissions, 0)) AS [total_submissions]
    , SUM(COALESCE(SS.total_accepted_submissions, 0)) AS [total_accepted_submissions]
    , SUM(COALESCE(VS.total_views, 0)) AS [total_views]
    , SUM(COALESCE(VS.total_unique_views, 0)) AS [total_unique_views]
FROM Contests AS CON
JOIN Colleges AS COL
    ON COL.contest_id = CON.contest_id
JOIN Challenges AS CH
    ON CH.college_id = COL.college_id
LEFT JOIN (
    SELECT
        challenge_id
        , SUM(total_submissions) AS [total_submissions]
        , SUM(total_accepted_submissions) AS [total_accepted_submissions]
    FROM Submission_Stats
    GROUP BY challenge_id
) AS SS
    ON SS.challenge_id = CH.challenge_id
LEFT JOIN (
    SELECT
        challenge_id
        , SUM(total_views) AS [total_views]
        , SUM(total_unique_views) AS [total_unique_views]
    FROM View_Stats
    GROUP BY challenge_id
) AS VS
    ON VS.challenge_id = CH.challenge_id
GROUP BY
    CON.contest_id
    , CON.hacker_id
    , CON.name
HAVING
    SUM(COALESCE(SS.total_submissions, 0))
        + SUM(COALESCE(SS.total_accepted_submissions, 0))
        + SUM(COALESCE(VS.total_views, 0))
        + SUM(COALESCE(VS.total_unique_views, 0)) > 0
ORDER BY CON.contest_id;
