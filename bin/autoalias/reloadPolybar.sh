#! /bin/sh
#
# reloadPolybar.sh
# Copyright (C) 2019 sandvich <sandvich@sandvich-pc>
#
# Distributed under terms of the MIT license.
#


killall polybar
sh ~/.config/polybar/launch.sh &
