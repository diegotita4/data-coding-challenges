
"""
Title: Print Function
Platform: HackerRank
Difficulty: Easy
Language: Python 3

Problem Summary:
Print the numbers from 1 to n consecutively without spaces or line breaks.

Approach:
- Iterate from 1 to n using a loop.
- Print each number without spaces using the end parameter.
"""

n = int(input())

for i in range(1, n + 1):
    print(i + 1, end='')
