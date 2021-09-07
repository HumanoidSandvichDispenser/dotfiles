#! /bin/sh
#
# colorscheme.sh
# Copyright (C) 2021 sandvich <sandvich@sandvich-pc>
#
# Distributed under terms of the MIT license.
#


[[ -f $DOTFILES/colorschemes/$1.Xresources ]] || (echo "Colorscheme \"$1\" not found" && exit 1)

xrdb -merge $DOTFILES/colorschemes/$1.Xresources

#for path in $(nvr --nostart --serverlist); do
#    # signal every neovim instance to set colorscheme
#    nvr --nostart --servername $path -cc "call SetColorscheme('$1')"
#done

echo "call SetColorscheme('$1')" > /var/tmp/colorscheme.vim

# signal st and tabbed to reload config
kill -USR1 $(pidof st)
kill -USR1 $(pidof tabbed)

# restart polybar
polybar-msg cmd restart

inactive_border=$(get-xresource.sh "background")
active_border=$(get-xresource.sh "background3")
focused_border=$(get-xresource.sh "background4")

bspc config normal_border_color $inactive_border
bspc config active_border_color $active_border
bspc config focused_border_color $focused_border

feh --bg-scale $WALLPAPERS/$1.png
echo "slock.image: $WALLPAPERS/$1.png" > /var/tmp/wallpaper.Xresources && xrdb -merge /var/tmp/wallpaper.Xresources

format-file.py $DOTFILES/rofi-colors.rasi.fmt \
    --al=$(get-xresource.sh "background") \
    --bg=$(get-xresource.sh "background") \
    --bg1=$(get-xresource.sh "background1") \
    --bg2=$(get-xresource.sh "background2") \
    --bg3=$(get-xresource.sh "background3") \
    --bg4=$(get-xresource.sh "background4") \
    --fg=$(get-xresource.sh "foreground") \
    --accent=$(get-xresource.sh "accent") \
    > $DOTFILES/rofi-colors.rasi

