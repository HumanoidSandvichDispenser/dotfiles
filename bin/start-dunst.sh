#! /bin/sh
#
# start-dunst.sh
# Copyright (C) 2021 sandvich <sandvich@arch>
#
# Distributed under terms of the MIT license.
#

pidof dunst && kill $(pidof dunst)

dunst -config ~/.config/dunst/dunstrc \
    -cb "$(xgetres background)" \
    -lb "$(xgetres background)" \
    -nb "$(xgetres background)" \
    -cf "$(xgetres foreground)" \
    -lf "$(xgetres foreground)" \
    -nf "$(xgetres foreground)" \
    -bf "$(xgetres foreground)"
