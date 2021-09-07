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

filename="/tmp/$(date +%Y-%m-%d_%H%M%S).png"
color=$(convert-color.py $(xgetres accent))

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

    maim -sb 4 -r invert -l --color "$color,0.7" > $filename
else
    maim -sub 4 --color "$color" -l --color "$color,0.7" > $filename
fi

# kill feh running in the background when finished
kill $feh_pid

xclip -selection clipboard -t image/png "$filename"

action=$(dunstify --action="save,Save to File" --action="upload,Upload to imgbb" "Copied to clipboard")

case "$action" in
    "save")
        zenity --file-selection --confirm-overwrite --save | xargs cp "$filename"
        ;;
    "upload")
        api_key=$(cat ~/Secrets/imgbb-api-key)
        name=$(rofi -dmenu -p " image name" -theme $DOTFILES/rofi-input-box.rasi)
        [ -n "$name" ] && [ "$name" != "" ] && imgbb-upload.py "$api_key" "$filename" --name "$name"
        ;;
esac
