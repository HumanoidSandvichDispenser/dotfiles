#! /bin/sh
#
# checkUpdates.sh
# Copyright (C) 2020 sandvich <sandvich@sandvich-pc>
#
# Distributed under terms of the MIT license.
#

echo "checking for updates..."
if [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
	checkupdates | wc -l | tee /var/tmp/updates.txt # output to stdout and to update file
fi
