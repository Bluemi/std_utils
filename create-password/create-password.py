#!/usr/bin/env python3

import string
import random


def main():
    all_chars = string.ascii_letters + string.digits  #  + ".-_:%/&!$=+*#'\",;<>"
    pw = random.choices(all_chars, k=16)
    print(''.join(pw))


if __name__ == '__main__':
    main()

