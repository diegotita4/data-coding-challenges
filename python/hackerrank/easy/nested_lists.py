
"""
Title: Nested Lists
Platform: HackerRank
Difficulty: Easy
Language: Python 3

Problem Summary:
Find and print the names of students with the second lowest grade in alphabetical order.

Approach:
- Store student names and grades in a nested list.
- Extract unique grades and identify the second lowest value.
- Filter students matching the second lowest grade.
- Sort matching names alphabetically and print them.
"""


if __name__ == '__main__':

    students = []

    for _ in range(int(input())):
        name = input()
        score = float(input())

        students.append([name, score])

    second_lowest_grade = sorted(set(
        [score for name, score in students]
    ))[1]

    names = sorted([
        name
        for name, score in students
        if score == second_lowest_grade
    ])

    for name in names:
        print(name)
