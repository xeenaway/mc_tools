# -*- coding: UTF-8 -*-
"""
Module for fixing broken logs

"""

import os


def fix(broken_file_name):
    """
    Fixing function
    """

    with open(broken_file_name, 'r') as b_f, \
            open("res/restored-" + broken_file_name, "w") as r_f:
        for line in b_f:
            if not line.startswith('"\n') and not line.startswith('REC# '):
                if line.lstrip().startswith('Decrypted record'):
                    line = line.split(' : "')[1]

                r_f.write(line)


def main():
    """
    Main function
    """

    if not os.path.isdir("res"):
        os.mkdir("res")

    file_list = os.listdir(".")

    for name in file_list:
        if name.endswith(".jrn"):
            fix(name)
            print(name)

    print("Done.")


if __name__ == "__main__":
    main()
