#! /bin/sh
#
# nvim-colorscheme.sh
# Copyright (C) 2021 sandvich <sandvich@sandvich-pc>
#
# Distributed under terms of the MIT license.
#


[[ -f $DOTFILES/colorschemes/$1.Xresources ]] || (echo "Colorscheme \"$1\" not found" && exit 1)

xrdb -merge $DOTFILES/colorschemes/$1.Xresources

for path in $(nvr --nostart --serverlist); do
    # signal every neovim instance to set colorscheme
    nvr --nostart --servername $path -cc "call SetColorscheme('$1')"
done

echo "call SetColorscheme('$1')" > /tmp/colorscheme.vim

# signal st to reload config
kill -USR1 $(pidof st)
