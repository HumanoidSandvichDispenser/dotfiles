#! /bin/sh
#
# pacman-menu.sh
# Copyright (C) 2021 sandvich <sandvich@manjaro>
#
# Distributed under terms of the MIT license.
#

update=" Update database & packages"
force=" Force update packages & mirrors"
updateaur=" Update database & packages (AUR)"
forceaur=" Force update packages & mirrors (AUR)"
list=" List all packages"

options="$update
$force
$updateaur
$forceaur
$list"

choice=$(echo -e "$options" | rofi -dmenu -theme ~/git/dotfiles/rofi-menu.rasi -p "  $(pacman -Q | wc -l) installed packages")

echo $choice

case $choice in
	$update)
		$TERMINAL sudo pacman "-Syu"
		;;
	$force)
		$TERMINAL sudo pacman "-Syyu"
		;;
	$updateaur)
		$TERMINAL yay
		;;
	$forceaur)
		$TERMINAL yay "-Syyu"
		;;
	$list)
		echo "Listing all packages"
		pacman -Q >> /tmp/packages.txt
		$TERMINAL nvim "-R" /tmp/packages.txt
		;;
esac
