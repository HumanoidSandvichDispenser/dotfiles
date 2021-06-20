#! /bin/sh
#
# confirmation-menu.sh
# Copyright (C) 2021 sandvich <sandvich@manjaro>
#
# Distributed under terms of the MIT license.
#
# Returns true if user picks yes, otherwise returns false

prompt=$([ "$1" == "" ] && echo "Are you sure?" || echo "$1")
negative=$([ "$2" == "" ] && echo " No" || echo "$2")
affirmative=$([ "$3" == "" ] && echo " Yes" || echo "$3")

options="$negative
$affirmative"

choice=$(echo -e "$options" | rofi -dmenu -theme ~/git/dotfiles/rofi-confirmation.rasi -p "$prompt")

[ "$choice" = "$affirmative" ]
