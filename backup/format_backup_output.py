#!/usr/bin/env python3


import sys
import os.path
import shutil
from datetime import datetime


LOG_FILE = os.path.expanduser('~/.local/etc/backup_now/logs/log_{}.txt'.format(datetime.now().strftime('%d%m%Y_%H%M%S')))


class Colors:
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def format_size(size):
    pot_index = 0
    while size > 1024:
        size = size // 1024
        pot_index += 1
    sizes = [' B', 'kB', 'MB', 'GB', 'TB', 'EB']
    return '{}{}'.format(str(size).ljust(4), sizes[pot_index])

def main():
    print(Colors.OKBLUE + 'starting backup:' + Colors.ENDC)
    linewidth = shutil.get_terminal_size((80, 20))[0]
    log = []
    for line in sys.stdin:
        split_line = line.strip().split(' ', maxsplit=5)

        if len(split_line) == 6:
            date, time, action, update_size, info, filename = split_line
            if info[0] == '<' or action == 'del.':
                print('\r{}'.format(filename).ljust(linewidth), end='')
                try:
                    update_size = int(update_size)
                except ValueError:
                    print('{}ERR:{} failed to parse update_size: {}'.format(Colors.FAIL, Colors.ENDC, update_size), file=sys.stderr)
                    update_size = -1
                formated_size = format_size(update_size)
                log.append(['{} {} {} {} {}'.format(date, time, action, formated_size, filename), update_size])
        else:
            print('{}ERR:{} can\'t parse line: {}'.format(Colors.FAIL, Colors.ENDC, line), file=sys.stderr)

    # log
    log_sorted = sorted(log, key=lambda l: l[1], reverse=True)
    with open(LOG_FILE, 'w') as log_file:
        for line in log_sorted:
            log_file.write(line[0] + '\n')
    print('\n{}Backup complete{}\n\tLog: {}'.format(Colors.OKGREEN, Colors.ENDC, LOG_FILE))


if __name__ == '__main__':
    main()

