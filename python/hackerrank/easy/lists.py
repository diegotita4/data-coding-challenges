
"""
Title: Lists
Platform: HackerRank
Difficulty: Easy
Language: Python 3

Problem Summary:
Execute a sequence of list operations based on user commands.

Approach:
- Store values in a mutable list.
- Parse each command and its arguments dynamically.
- Apply the corresponding list method for each operation.
- Print the list whenever requested.
"""


if __name__ == '__main__':
    N = int(input())

    output = []

    for _ in range(N):

        command, *args = input().split()

        if command == 'insert':
            output.insert(int(args[0]), int(args[1]))

        elif command == 'print':
            print(output)

        elif command == 'remove':
            output.remove(int(args[0]))

        elif command == 'append':
            output.append(int(args[0]))

        elif command == 'sort':
            output.sort()

        elif command == 'pop':
            output.pop()

        elif command == 'reverse':
            output.reverse()
