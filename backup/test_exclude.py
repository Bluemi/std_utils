#!/usr/bin/python3


import os


with open('exclude.txt', 'r') as f:
    for line in f.readlines():
        line = line.strip()
        if line.startswith('- /'):
            path = os.path.join(os.path.expanduser('~'), line[3:])
            if line.endswith('/'):
                if not os.path.isdir(path):
                    print('Dir \"{}\" not found.'.format(path))
            else:
                if not os.path.isfile(path):
                    print('File \"{}\" not found.'.format(path))
