# This script automatically generates symlinks from the home directory to this directory

dir="$HOME/git/dotfiles"
files=".bashrc .zshrc .vimrc"

for file in $files; do
	echo "Creating symlink for $file"
	#ln -s $dir/$file ~/$file
done
