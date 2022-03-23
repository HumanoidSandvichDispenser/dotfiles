#! /bin/sh
#
# view-clipboard-image.sh
# Copyright (C) 2022 sandvich <sandvich@manjaro>
#


clipboard_image_file="/tmp/view-clipboard-image.png"

# Place the image in our clipboard into a temporary file. If the file is a
# valid image, display it onto sxiv. Otherwise notify the user that the
# clipboard does not contain an image.
xclip -o -selection clipboard > $clipboard_image_file && (identify \
    $clipboard_image_file && sxiv $clipboard_image_file || notify-send -a \
    "view-clipboard-image.sh" "Clipboard does not contain image data")
