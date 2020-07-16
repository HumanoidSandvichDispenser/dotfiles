#! /bin/sh
#
# checkUpdates.sh
# Copyright (C) 2020 sandvich <sandvich@sandvich-pc>
#
# Distributed under terms of the MIT license.
#

echo "checking for updates..."
if [[ "$PACKAGE_MANAGER" == "pamac" ]]; then
	pamac checkupdates -q | wc -l > /tmp/updates.txt
else
	checkupdates | wc -l > /tmp/updates.txt
fi
