#! /bin/sed 2,3!d;s/^#.//
# This script must be sourced from within a shell
# and not executed.
export LC_ALL="en_US.UTF-8"
export CRAYON_HOME=$HOME/crayon/crayon-2.1.0-mono
export PATH=$PATH:$HOME/bin:$CRAYON_HOME
#export PATH=$HOME/.pyenv/shims:$PATH:$HOME/bin:$CRAYON_HOME
#export PYTHONPATH=$PYTHONPATH:/usr/lib/python3.8/site-packages
export VISUAL=nvim
export EDITOR=nvim
export CALCRC=$HOME/.calcrc
export WINEPATH=$HOME/.wine
export MGFXC_WINE_PATH=$HOME/.winemonogame
export PEPE_PATH=$HOME/mnt/pepes

# User configuration
export MANPATH=/usr/local/man:$MANPATH
export LANG=en_US.UTF-8

# If you installed the dotfiles to another directory, 
# set $DOTFILES to that directory.
export DOTFILES="$HOME/git/dotfiles"
export WALLPAPERS="/usr/share/backgrounds/sandvich"
