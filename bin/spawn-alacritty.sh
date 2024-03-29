#! /bin/sh
#
# spawn-alacritty.sh
# Copyright (C) 2023 sandvich <sandvich@artix>
#
# Distributed under terms of the MIT license.
#


ACTIVE_WINDOW=$(xdotool getactivewindow)
ACTIVE_WM_CLASS=$(xprop -id $ACTIVE_WINDOW | grep WM_CLASS)
if [[ $ACTIVE_WM_CLASS == *"Alacritty"* ]]
then
    # Get PID. If _NET_WM_PID isn't set, bail.
    PID=$(xprop -id $ACTIVE_WINDOW | grep _NET_WM_PID | grep -oP "\d+")
    if [[ "$PID" == "" ]]
    then
        alacritty
    fi
    # Get first child of terminal
    CHILD_PID=$(pgrep -P $PID)
    if [[ "$PID" == "" ]]
    then
        alacritty
    fi
    # Get current directory of child. The first child should be the shell.
    pushd "/proc/${CHILD_PID}/cwd"
    SHELL_CWD=$(pwd -P)
    popd
    # Start alacritty with the working directory
    alacritty --working-directory $SHELL_CWD
else
    alacritty
fi
