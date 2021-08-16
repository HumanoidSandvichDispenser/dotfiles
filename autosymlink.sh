#!/usr/bin/zsh
# This script automatically generates symlinks from the home directory to this directory

currDir="$HOME/git/dotfiles"
cd $currDir
declare -a files=(".bashrc" ".zshrc" ".vimrc" ".Xresources")
declare -a directories=(".config/bspwm" ".config/sxhkd" ".config/ncmpcpp" ".config/polybar-config")

for file in ${files[@]}; do
    echo $file
    if [ ! -f "~/$file" ]; then
        echo "Creating symlink for $file"
        ln -s $currDir/$file $HOME/$file
    else
        echo "Oldifying existing file: $file"
        mv ~/$file ~/$file.old1
    fi
done

for directory in ${directories[@]}; do
    if [ ! -f "~/$directory" ]; then
        echo "Creating symlink for $directory"
        ln -s $currDir/$directory $HOME/$directory
    else
        echo "Oldifying existing directory: $directory"
        mv ~/$file ~/$file.old1
    fi
done
