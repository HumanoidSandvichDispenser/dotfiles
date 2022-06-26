export LC_ALL="en_US.UTF-8"
export CRAYON_HOME=$HOME/crayon/crayon-2.1.0-mono
export PATH=$PATH:$HOME/bin:$CRAYON_HOME:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/.local/bin
export PYTHONPATH=$PYTHONPATH:/usr/lib/python3.8/site-packages:/home/sandvich/git/python-modules
export VISUAL=nvim
export EDITOR=nvim
export CALCRC=$HOME/.calcrc
export WINEPATH=$HOME/.wine
export MGFXC_WINE_PATH=$HOME/.winemonogame
export PEPE_PATH=$HOME/mnt/pepes
export MSBuildSDKsPath="/usr/share/dotnet/sdk/$(dotnet --version)/Sdks"

# User configuration
export MANPATH=/usr/local/man:$MANPATH
export LANG=en_US.UTF-8

# If you installed the dotfiles to another directory, 
# set $DOTFILES to that directory.
export DOTFILES="$HOME/git/dotfiles"
export WALLPAPERS="/usr/share/backgrounds/sandvich"
export NVIMPATH="$DOTFILES/.config/nvim"

[ $DISPLAY ] && setxkbmap -option caps:super && xset r rate 300 50
