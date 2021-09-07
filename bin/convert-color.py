#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2021 sandvich <sandvich@manjaro>
#
# Distributed under terms of the MIT license.

# Converts color formats
# Valid formats: rgb, rgb_f, hsv, hex, hex12

import click
from typing import NamedTuple

class rgb():
    r: int
    g: int
    b: int

    def __init__(self, r, g, b):
        self.r = r
        self.g = g
        self.b = b

    def to_float(self):
        return rgb_f(float(self.r) / 256, float(self.g) / 256, float(self.b) / 256)

    def to_hex(self):
        return "#%02x%02x%02x" % (self.r, self.g, self.b)

    def from_hex(self, hex: str):
        hex = hex.lstrip("#")
        rgb_tuple = tuple(int(hex[i:i + 2], 16) for i in (0, 2, 4))
        self.r = rgb_tuple[0]
        self.g = rgb_tuple[1]
        self.b = rgb_tuple[2]

    def to_string(self):
        return "%d,%d,%d" % (self.r, self.g, self.b)

class rgb_f():
    r: float
    g: float
    b: float

    def __init__(self, r, g, b):
        self.r = r
        self.g = g
        self.b = b

    def to_int(self):
        return rgb_f(self.r * 256, self.g * 256, self.b * 256)

    def to_string(self):
        return "%f,%f,%f" % (self.r, self.g, self.b)


@click.command("convert-color.py")
@click.argument("input")
@click.option("-i", "--input-format")
@click.option("-o", "--output-format")
def main(input, input_format, output_format):
    rgb_input = rgb(0, 0, 0)
    rgb_input.from_hex(input)
    print(rgb_input.to_float().to_string())

if __name__ == "__main__":
    main()
