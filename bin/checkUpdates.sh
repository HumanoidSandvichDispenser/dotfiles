#! /bin/sh
#
# checkUpdates.sh
# Copyright (C) 2020 sandvich <sandvich@sandvich-pc>
#
# Distributed under terms of the MIT license.
#


pamac checkupdates -q | wc -l > $HOME/bin/updates.txt
