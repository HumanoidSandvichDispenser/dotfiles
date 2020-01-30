#! /bin/sh
#
# checkUpdates.sh
# Copyright (C) 2020 sandvich <sandvich@sandvich-pc>
#
# Distributed under terms of the MIT license.
#

if [[ "$PACKAGE_MANAGER" == "pamac" ]]; then
	pamac checkupdates -q | wc -l > $DOTFILES/bin/updates.txt
elif [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
	pacman -Qu | wc -l > $DOTFILES/bin/updates.txt
fi
