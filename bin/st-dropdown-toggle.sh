#! /bin/sh
#
# st-dropdown-toggle.sh
# Copyright (C) 2021 sandvich <sandvich@manjaro>
#
# Distributed under terms of the MIT license.
#


alias searchdropdown="xdotool search --class st-dropdown"
pid=$(searchdropdown)
tabbedflags="-N st-dropdown -o #1d2021 -O #928374 -t #282828 -T #fbf1c7"

if [ "$pid" != "" ]; then
    bspc node "$pid" --flag hidden -f
    echo "Toggling visibility"
else
    (tabbed $tabbedflags st -w) &
    echo "Creating new dropdown instance"
    # wait for process to spawn
    i=0
    while ! searchdropdown && [[ $i -lt 5 ]]; do
        sleep 0.1
        let "i++"
        echo "Waiting for process to spawn..."
    done
    if searchdropdown; then
        $0  # recall script
    else
        echo "Failed to spawn dropdown instance"
    fi
fi
