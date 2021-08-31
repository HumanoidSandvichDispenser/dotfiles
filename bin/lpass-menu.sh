passwords=$(lpass ls --format="<b>%an</b>&#10;%au <span size=\"0\">[%ai]</span>")

[ -n "$passwords" ] && \
    result=$(echo -n "$passwords" |\
    rofi -dmenu -i -markup -markup-rows \
    -theme $DOTFILES/rofi-menu-input-no-icon.rasi -p " lpass" |\
    sed -E 's/.*\[([0-9]+)\].*/\1/gm;t;d')

[ -n "$result" ] && lpass show -cp $result

echo $result
