
"""
Title: Python If-Else
Platform: HackerRank
Difficulty: Easy
Language: Python 3

Problem Summary:
Determine whether a number is "Weird" or "Not Weird" based on parity and numeric range conditions.

Approach:
- Check if the number is odd.
- For even numbers, evaluate the required numeric ranges.
- Print the corresponding classification.
"""


n = int(input())

if n % 2 == 1:
    print("Weird")

elif 2 <= n <= 5:
    print("Not Weird")

elif 6 <= n <= 20:
    print("Weird")

else:
    print("Not Weird")
