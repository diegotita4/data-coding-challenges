
"""
Title: Finding the Percentage
Platform: HackerRank
Difficulty: Easy
Language: Python 3

Problem Summary:
Store student grades in a dictionary and compute the average score for a queried student.

Approach:
- Store student names as dictionary keys and scores as lists.
- Retrieve the queried student's scores.
- Compute the average using sum and length.
- Format the result to two decimal places.
"""


if __name__ == '__main__':
    n = int(input())
    student_marks = {}

    for _ in range(n):
        name, *line = input().split()
        scores = list(map(float, line))
        student_marks[name] = scores

    query_name = input()

    marks = student_marks[query_name]

    result = sum(marks) / len(marks)

    print(f"{result:.2f}")
