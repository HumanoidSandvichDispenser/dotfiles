#! /bin/sh
#
# scrot-clip.sh
# Copyright (C) 2021 sandvich <sandvich@manjaro>
#
# Distributed under terms of the MIT license.
#

# exit if kdialog is not installed
# it is required for save file dialogs
which zenity > /dev/null || (notify-send -a "$(basename $0)" "zenity not found"; exit 1)

# get options
while getopts ":f" opt; do
    case $opt in
        f)
            freeze=1
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
        esac
done

if [ -n "$freeze" ]; then
    maim -u | feh - -xF &

    feh_pid=$!

    i=0
    while [ -z "$(xdotool search --pid "$feh_pid")" ]; do
        sleep 0.05
        [ "$i" -eq "20" ] && (notify-send -a "$(basename $0)" "Could not start feh"; exit 1)
        echo "waiting for feh..."
        i=$((i+1))
    done

    maim -s -b 4 -r invert | xclip -selection clipboard -t image/png
else
    maim -s -b 4 --color "1,1,1" -l --color "1,1,1,0.3" | xclip -selection clipboard -t image/png
fi
    


kill $feh_pid
# kill feh running in the background when finished

action=$(dunstify --action="save,Save to File" --action="upload,Upload to imgbb" "Copied to clipboard")

case "$action" in
    "save")
        xclip -selection clipboard -t image/png > /tmp/clipboard.png
        zenity --file-selection --save | xargs cp /tmp/clipboard.png
        ;;
    "upload")
        api_key=""
        name=$(rofi -dmenu -p " image name" -theme $DOTFILES/rofi-input-box.rasi)
        [ -n "$name" ] && [ "$name" != "" ] && imgbb-upload.py $api_key /tmp/clipboard.png --name $name
        ;;
esac
