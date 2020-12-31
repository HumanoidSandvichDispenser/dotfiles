#! /bin/sh
#
# clip_ocr.sh
# Copyright (C) 2020 sandvich <sandvich@sandvich-pc>
#
# Distributed under terms of the MIT license.
#

SCR_IMG=`mktemp`
trap "rm $SCR_IMG*" EXIT

# increase image quality with option -q from default 75 to 100
if scrot -s $SCR_IMG.png -q 100; then

	# post processing
	mogrify -modulate 100,0 -resize 400% $SCR_IMG.png 

	tesseract --psm 6 $SCR_IMG.png $SCR_IMG eng # &> /dev/null

	result=`cat $SCR_IMG.txt | sed "s/(?<!\\n)\n(?!\n)/ /" | xargs`
	
	notify-send "Copied Recognized Text" "$result"
	echo $result | xclip
else
	echo "failed to get image clip"
fi
