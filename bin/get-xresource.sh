#! /bin/sh
#
# get-xresource.sh
# Copyright (C) 2021 sandvich <sandvich@manjaro>
#
# Distributed under terms of the MIT license.
#
# Returns the value of a given Xresource key

xrdb -query | grep "$1" -m 1 | cut -f 2
