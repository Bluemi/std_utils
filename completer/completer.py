#!/usr/bin/python3

import os
import sys


CODE_FILE_ENDINGS = {'.cpp', '.hpp', '.c', '.h', '.rs', '.java', '.py', '.sh', '.html', '.css'}


def print_usage():
    print('usage: completer.py')


def main():
    complete_op()


def complete_op():
    result_files = set()
    for root, _, files in os.walk("."):
        for f in files:
            fileext = os.path.splitext(f)[1]
            if fileext in CODE_FILE_ENDINGS:
                if f == 'mod.rs':
                    parent_dir = os.path.split(root)[1]
                    result_files.add('{}{}'.format(parent_dir, '.rs'))
                else:
                    result_files.add(f)

    result = ' '.join(result_files)
    print(result)


if __name__ == '__main__':
    main()
