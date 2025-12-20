#!/usr/bin/env python3

import string
import secrets


def main():
    chars = string.ascii_letters + string.digits + ".-_:%/&!$=+*#'\",;<>"
    pw = create_pw(chars, k=16)
    print(''.join(pw))


def create_pw(chars, k=16):
    pw = [secrets.choice(chars) for _ in range(k)]
    return ''.join(pw)


if __name__ == '__main__':
    main()

