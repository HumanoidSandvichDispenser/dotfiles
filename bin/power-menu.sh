#! /bin/sh
#
# pacman-menu.sh
# Copyright (C) 2021 sandvich <sandvich@manjaro>
#
# Distributed under terms of the MIT license.
#

lock=" Lock"
sleep="⏾ Sleep"
logout=" Logout"
reboot=" Reboot"
shutdown=" Shut down"

options="$lock
$sleep
$logout
$reboot
$shutdown"

choice=$(echo -e "$options" | rofi -dmenu -theme ~/git/dotfiles/rofi-menu.rasi -p "  Uptime $(uptime -p | cut -c 4-)")

echo $choice

case $choice in
    $lock)
        qdbus org.freedesktop.ScreenSaver /ScreenSaver Lock
        ;;
    $sleep)
        systemctl suspend
        ;;
    $logout)
        ~/bin/confirmation-menu.sh "  Logout" " Cancel" " Logout" && systemctl stop lightdm
        ;;
    $reboot)
        ~/bin/confirmation-menu.sh "  Reboot" " Cancel" " Reboot" && reboot
        ;;
    $shutdown)
        ~/bin/confirmation-menu.sh "  Shut down" " Cancel" " Shut down" && shutdown now
        ;;
esac
