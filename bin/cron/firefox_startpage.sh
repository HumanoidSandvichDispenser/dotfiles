#! /bin/sh
#
# firefox_startup.sh
# Copyright (C) 2020 sandvich <sandvich@sandvich-pc>
#
# Distributed under terms of the MIT license.
#

if lsof -i :8085; then
	echo "Firefox startup page is running..." > /tmp/firefox_startup.output
else
	http-server /home/sandvich/git/dotfiles/firefox_startpage/ -p 8085
fi
