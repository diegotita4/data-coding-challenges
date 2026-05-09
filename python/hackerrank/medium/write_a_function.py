
"""
Title: Write a function
Platform: HackerRank
Difficulty: Medium
Language: Python 3

Problem Summary:
Brief description of the problem.

Approach:
High-level explanation of the chosen solution strategy.
"""


def is_leap(year):

    return (
        (year % 4 == 0 and year % 100 != 0)
        or (year % 400 == 0)
    )
