#!/usr/bin/zsh
# This script automatically generates symlinks from the home directory to this directory

currDir="$DOTFILES"
cd $currDir
declare -a files=(".bashrc" ".zshrc" ".vimrc" ".Xresources")
declare -a directories=(".config/bspwm" ".config/sxhkd" ".config/ncmpcpp" ".config/nvim")

for file in ${files[@]}; do
	echo $file
	if [ ! -f "$HOME/$file" ]; then
		echo "Creating symlink for $file"
		ln -s $currDir/$file $HOME/$file
	else
		if read confirm"?$HOME/$file already exists. Oldify existing file? (y/N)" && [[ $confirm == [yY] ]]; then
			echo "Oldifying existing file: $file"
			mv ~/$file ~/$file.old1
		fi
	fi
done

for directory in ${directories[@]}; do
	if [ ! -d $HOME/$directory ]; then
		echo "Creating symlink for $directory"
		ln -s $currDir/$directory $HOME/$directory
	else
		if read confirm"?$HOME/$directory already exists. Oldify existing directory? (y/N)" && [[ $confirm == [yY] ]]; then
			echo "Oldifying existing directory: $directory"
			mv ~/$directory ~/$directory.old1
		fi
	fi
done
