#!/usr/bin/python3


import sys
import os.path
import string


def print_usage():
    print('usage:\n\tcpp-new CLASSPATH [--class]')


def main():
    if len(sys.argv) < 2:
        print_usage()
        return
    class_path = sys.argv[1]
    if class_path.startswith('./'):
        class_path = class_path[2:]
    class_path = os.path.splitext(class_path)[0]  # remove extension
    path_to, file_name = os.path.split(class_path)
    is_class = False

    if len(sys.argv) == 3 and sys.argv[2] == '--class':
        is_class = True

    include_guard_name = []

    for index, c in enumerate(file_name):
        if c in string.ascii_uppercase and index != 0:
            include_guard_name.append('_')
        include_guard_name.append(c)

    include_guard = '__{}_CLASS__'.format(''.join(include_guard_name).upper())

    os.makedirs(path_to, exist_ok=True)

    class_name = []
    last_was_underscore = False
    for index, c in enumerate(file_name):
        if c == '_':
            last_was_underscore = True
        else:
            if index == 0 or last_was_underscore:
                class_name.append(c.upper())
            else:
                class_name.append(c)
    class_name = ''.join(class_name)

    if os.path.exists(class_path + '.hpp'):
        print('ERROR: File {}.hpp already exists'.format(class_path))
        return

    if os.path.exists(class_path + '.cpp'):
        print('ERROR: File {}.cpp already exists'.format(class_path))
        return

    with open(class_path + '.hpp', 'w') as f:
        f.write('#ifndef {}\n'.format(include_guard))
        f.write('#define {}\n\n'.format(include_guard))
        if is_class:
            f.write('class {} {{\n'.format(class_name))
            f.write('};\n\n')
        f.write('#endif')

    with open(class_path + '.cpp', 'w') as f:
        f.write('#include "{}"\n'.format(file_name + '.hpp'))


if __name__ == '__main__':
    main()
