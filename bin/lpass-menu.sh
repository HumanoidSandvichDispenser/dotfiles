#! /bin/sh
#
# lpass-login.sh
# Copyright (C) 2021 sandvich <sandvich@arch>
#
# Distributed under terms of the MIT license.
#
# A script to display LastPass passwords using rofi and lpass CLI.


# if we are not logged in, login given the secrets.
if ! lpass status; then
    notify-send -a "lpass-menu.sh" "Login" "Logging into LastPass..."
    lpass-login.sh $(xgetres lpass.email) $(xgetres lpass.password) \
        && notify-send -a "lpass-menu.sh" "Login" "Successfully logged into LastPass"
fi

# <span size="0"></span> to hide the password ID, but include it so we know what
# ID of the password is after selecting through rofi. The password ID is required
# to get the password through the lpass CLI.
passwords=$(lpass ls --format="<b>%an</b>&#10;%au <span size=\"0\">[%ai]</span>")

[ -n "$passwords" ] && \
    result=$(echo -n "$passwords" |\
    rofi -dmenu -i -markup -markup-rows \
    -theme $DOTFILES/rofi-menu-input-no-icon.rasi -p " lpass" |\
    sed -E 's/.*\[([0-9]+)\].*/\1/gm;t;d')

[ -n "$result" ] && lpass show -cp $result

echo $result
