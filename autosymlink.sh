#!/usr/bin/zsh
# This script automatically generates symlinks from the home directory to this directory

currDir="$HOME/git/dotfiles"
cd currDir
declare -a files=(".bashrc" ".zshrc" ".vimrc")
declare -a directories=(".config/bspwm" ".config/sxhkd" ".config/ncmpcpp")

for file in ${files[@]}; do
	if [ ! -f "./$file" ]; then
		echo "Creating symlink for $file"
		ln -s $currDir/$file $HOME/file
	fi
done

for directory in ${directories[@]}; do
	if [ ! -f "~/$directory" ]; then
		echo "Creating symlink for $directory"
		ln -s $currDir/$directory $HOME/directory
	fi
done
