#!/bin/python3

import os
import os.path


PROMPT_COLOR = r'\[\033[33m\]'
RESET_COLOR = r'\[\033[00m\]'
TARGET_LENGTH = 50


def get_cwd_no_home():
    cwd = os.getcwd()
    home = os.path.expanduser('~')
    return cwd.replace(home, '~')


def main(): 
    cwd = get_cwd_no_home()
    minized_path = minimize_path(cwd)
    prompt = '{}{}{}'.format(PROMPT_COLOR, minized_path, RESET_COLOR)
    print(minized_path, end='')


def split_all(path):
    if path == '/':
        return ['/']
    return [p for p in path.split('/') if p]


def get_len_distribution(dirs_len, dirs_target_len):
    if dirs_len == 0:
        return []
    distribution = [0] * dirs_len
    index = 0
    while dirs_target_len > 0:
        dirs_target_len -= 1
        distribution[index] += 1
        index = (index + 1) % dirs_len

    distribution.reverse()
    return distribution


def minimize_path(path):
    dirs, current = os.path.split(path)
    dirs = split_all(dirs)

    # how long should dirs be
    target_dirs_len = TARGET_LENGTH - (len(current) + len(dirs))
    target_dirs_len = max(0, target_dirs_len)

    distribution = get_len_distribution(len(dirs), target_dirs_len)

    result_dirs = []
    for length, d in zip(distribution, dirs):
        result_dirs.append(minimize(d, length))
    result_dirs.append(current)
    return os.path.join(*result_dirs)

def minimize(path, length):
    return path[:min(len(path), length)]


if __name__ == '__main__':
    main()
