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

mkdir -p /tmp/scrot
filename="/tmp/scrot/$(date +%Y-%m-%d_%H%M%S).png"
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
    maim -u | feh - --no-xinerama -x &

    feh_pid=$!

    i=0
    window_id=""
    while true; do
        window_id="$(xdotool search --pid "$feh_pid")"
        [ -z $window_id ] || break # exit loop if feh has a window
        sleep 0.05
        [ "$i" -eq "20" ] && (notify-send -a "$(basename $0)" "Could not start feh"; exit 1)
        echo "waiting for feh..."
        i=$((i+1))
    done

    bspc node $window_id -t floating
    xdotool windowsize $window_id 100% 100%
    xdotool windowmove $window_id -4 -4

    maim -sb 2 > $filename
    kill $feh_pid
else
    maim -sub 2 --color "$color" -l --color "$color,0.5" > $filename || exit 1
fi

# kill feh running in the background when finished

xclip -selection clipboard -t image/png "$filename"

#action=$(dunstify --action="save,Save to File" --action="upload,Upload to imgbb" "Copied to clipboard")
action=$(notify-send --action="Save to file" "Copied image to clipboard" -i "$filename")

case "$action" in
    0)
        zenity --file-selection --confirm-overwrite --save | xargs cp "$filename"
        ;;
#    1)
#        api_key=$(cat ~/Secrets/imgbb-api-key)
#        name=$(rofi -dmenu -p " image name" -theme $DOTFILES/rofi-input-box.rasi)
#        [ -n "$name" ] && [ "$name" != "" ] && imgbb-upload.py "$api_key" "$filename" --name "$name"
#        ;;
esac
