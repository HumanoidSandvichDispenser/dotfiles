# This script automatically generates symlinks from the home directory to this directory

currDir="$HOME/git/dotfiles"
declare -a files=(".bashrc" ".zshrc" ".vimrc")
declare -a directories=(".config/bspwm" ".config/sxhkd")

for file in ${files[@]}; do
	if [ ! -f "$file" ]; then
		echo "Creating symlink for $file"
		ln -s $currDir/$file ~/$file
	fi
done

for directory in ${directories[@]}; do
	if [ ! -f "$directory" ]; then
		echo "Creating symlink for $directory"
		ln -s $currDir/$directory ~/$directory
	fi
done
