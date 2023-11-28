#!/usr/bin/env python3


import time
from datetime import datetime
import os.path
import subprocess


def main():
    files_process = subprocess.run('/bin/bash -lixc exit 2>&1 | sed -n \'s/^+* \(source\|\.\) //p\'', shell=True, capture_output=True)
    stdout = files_process.stdout.decode('utf-8')

    files = [f.strip().split(' ')[0] for f in stdout.split('\n') if os.path.isfile(f.strip())]
    files_timestamps = list(zip(files, map(os.path.getmtime, files)))
    files_timestamps = sorted(files_timestamps, key=lambda fts: fts[1])

    print('TIMESTAMP         FILE')
    for f, ts in files_timestamps:
        print(datetime.fromtimestamp(ts).strftime('%d.%m.%Y %H:%M'), f, sep='  ')


if __name__ == '__main__':
    main()

