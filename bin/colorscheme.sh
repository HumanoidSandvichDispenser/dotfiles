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

#echo "autocmd VimEnter * PackerLoad $1" > /var/tmp/colorscheme.vim
echo "colorscheme $1" > /var/tmp/colorscheme.vim
echo "$1" > /var/tmp/colorscheme

# signal st and tabbed to reload config
kill -USR1 $(pidof st)
kill -USR1 $(pidof tabbed)

# restart polybar
polybar-msg cmd restart

inactive_border=$(get-xresource.sh "background")
active_border=$(get-xresource.sh "background4")
focused_border=$(get-xresource.sh "foreground")

background=$(xgetres "background")
background_alt=$(xgetres "background-alt")
background1=$(xgetres "background1")
background2=$(xgetres "background2")
background3=$(xgetres "background3")
background4=$(xgetres "background4")
background_dark=$(xgetres "background-dark")
foreground=$(xgetres "foreground")
red=$(xgetres "color1")
green=$(xgetres "color2")
yellow=$(xgetres "color3")
blue=$(xgetres "color4")
magenta=$(xgetres "color5")
cyan=$(xgetres "color6")
gray=$(xgetres "color8")
accent=$(xgetres "accent")

bspc config normal_border_color $inactive_border
bspc config active_border_color $active_border
bspc config focused_border_color $focused_border

feh --bg-scale $WALLPAPERS/$1.png --bg-scale $WALLPAPERS/$1.png
echo "slock.image: $WALLPAPERS/$1.png" > /var/tmp/wallpaper.Xresources && xrdb -merge /var/tmp/wallpaper.Xresources

format-file.py $DOTFILES/fmt/rofi-colors.rasi.fmt \
               --al=$background \
               --bg=$background \
               --bg1=$background1 \
               --bg2=$background2 \
               --bg3=$background3 \
               --bg4=$background4 \
               --fg=$foreground \
               --accent=$accent \
               > $DOTFILES/rofi-colors.rasi

mkdir -p ~/.config/alacritty
format-file.py $DOTFILES/fmt/alacritty-colors.toml.fmt \
               --bg=$background \
               --fg=$foreground \
               --red=$red \
               --green=$green \
               --yellow=$yellow \
               --blue=$blue \
               --magenta=$magenta \
               --cyan=$cyan \
               --gray=$gray \
               > ~/.config/alacritty/alacritty.toml

mkdir -p ~/.config/wired
format-file.py $DOTFILES/fmt/wired.ron.fmt \
               --bg=$background \
               --bg-dark=$background_dark \
               --bg4=$background4 \
               --fg=$foreground \
               --red=$red \
               --green=$green \
               --blue=$blue \
               --accent=$accent \
               > ~/.config/wired/wired.ron
