#! /bin/sh
#
# scrot-clip.sh
# Copyright (C) 2021 sandvich <sandvich@manjaro>
#
# Distributed under terms of the MIT license.
#

# exit if kdialog is not installed
# it is required for save file dialogs
which zenity || (notify-send -a "scrot-clip.sh" "zenity not found"; exit)

filename=$(date +"/tmp/scrot_%Y-%m-%d_%H:%M:%S.png")

#scrot -sf '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f'
scrot --select --freeze --line width=2 "$filename" && xclip -selection clipboard -target image/png "$filename" || exit

action=$(dunstify --action="save,Save to File" --action="upload,Upload to imgbb" "Copied to clipboard")

case "$action" in
    "save")
        zenity --file-selection --save | xargs cp $filename
        ;;
    "upload")
        api_key=""
        name=$(rofi -dmenu -p " image name" -theme $DOTFILES/rofi-input-box.rasi)
        [ -n "$name" ] && [ "$name" != "" ] && imgbb-upload.py $api_key $filename --name $name
        ;;
esac
