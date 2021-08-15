#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2021 sandvich <sandvich@manjaro>
#
# Distributed under terms of the MIT license.
#
# Syntax:
# format-file.py SOURCE [key=value ...]

import sys
from collections import defaultdict

def main():
    # required argument
    # path to the format file
    source = ""

    # defaultdict returns a default value if a key is not found
    # useful when a user does not input a keyword argument
    kwargs_fmt_def = defaultdict(lambda: "")

    # where we will be temporarily storing our keywords
    kwargs_fmt = {}

    arg: str
    for arg in sys.argv[1:]:
        split_args = arg.split("=")
        if (len(split_args) > 1):
            kwargs_fmt[split_args[0]] = split_args[1]
        else:
            if source == "":
                source = arg
            elif not arg.isspace():
                exit("format-file.py: too many arguments")

    # set the defaultdict to kwargs_fmt
    kwargs_fmt_def.update(kwargs_fmt)

    with open(source, "r") as source_file:
        print(source_file.read().format_map(kwargs_fmt_def))


if __name__ == "__main__":
    main()
