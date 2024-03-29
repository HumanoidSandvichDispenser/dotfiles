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

choice=$(echo -e "$options" | rofi -dmenu -theme $DOTFILES/rofi-menu.rasi -p "  Uptime $(uptime -p | cut -c 4-)")

echo $choice

case $choice in
    $lock)
        slock -m "$(fortune)"
        ;;
    $sleep)
        loginctl suspend
        #systemctl suspend &
        #slock -m "$(fortune)"
        ;;
    $logout)
        ~/bin/confirmation-menu.sh "  Logout" " Cancel" " Logout" && bspc quit
        ;;
    $reboot)
        ~/bin/confirmation-menu.sh "  Reboot" " Cancel" " Reboot" && reboot
        ;;
    $shutdown)
        ~/bin/confirmation-menu.sh "  Shut down" " Cancel" " Shut down" && shutdown now
        ;;
esac
