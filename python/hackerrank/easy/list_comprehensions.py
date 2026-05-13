
"""
Title: List Comprehensions
Platform: HackerRank
Difficulty: Easy
Language: Python 3

Problem Summary:
Generate all possible coordinates [i, j, k] within the given ranges, excluding those whose sum equals n.

Approach:
- Use nested list comprehensions to generate all coordinate combinations.
- Filter combinations where the sum of values is different from n.
"""


if __name__ == '__main__':
    x = int(input())
    y = int(input())
    z = int(input())
    n = int(input())
    
    result = [[i, j, k]
                for i in range(x + 1)
                for j in range(y + 1)
                for k in range(z + 1)
                if i + j + k != n]
    
    print(result)
