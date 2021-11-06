#! /bin/sh
#
# clip-history.sh
# Copyright (C) 2021 sandvich <sandvich@arch>
#
# Distributed under terms of the MIT license.
#

cd ~/.cache/clipman

# sort clips by date
sortclips() {
    for line in *.clip; do
        stat -c '%Y %n' "$line"
    done | sort -rn | cut -d ' ' -f2
}

# clips[preview title]="file"
declare -A clips
clips_sorted_keys=""

for clip in $(sortclips); do
    i=$((i + 1))

    # escape all backslashes, as this will be piped into dmenu from echo -en
    clip_target=$(cat "${clip}h")
    if [[ "$clip_target" == "image/png" ]] || [[ "$clip_target" == "image/jpg" ]]; then
        file_size=$(du -bh $clip | awk '{print $1}')
        preview_line="Image ($file_size)"
    else
        preview_line=$(head -n 1 $clip | sed -E 's/([^\])(\\n)/\1\\\2/g')
    fi
    [[ "$preview_line" == "" ]] && continue
    clips[$preview_line]="$clip"
    clips_sorted_keys="$clips_sorted_keys$preview_line\n"
done

# get index of the output selected
selected_preview=$(echo -en "$clips_sorted_keys" | rofi -dmenu \
    -theme $DOTFILES/rofi-menu-input-no-icon.rasi -p "" || exit 1) || exit 1

echo "Selected: $selected_preview"

selected_file=${clips[$selected_preview]}

echo "File: $selected_file"

clip_target=$(cat "${selected_file}h") # clip headers end with .cliph

xclip -selection clipboard -target $clip_target $selected_file
