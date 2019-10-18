# Get Package Manager
PACMAN=$(which pacman 2> /dev/null)
APT=$(which apt-get 2> /dev/null)
YUM=$(which yum 2> /dev/null)

echo -e "\e[34mInstalling \e[39mVundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo -e "\e[34mInstalling \e[39mvim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "\e[34mInstalling \e[39mzsh, oh-my-zsh..."
if [[ ! -z $PACMAN ]]; then
	pacman -Syu && pacman -S zsh 
elif [[ ! -z $APT ]]; then
	apt-get update && apt-get install zsh 
elif [[ ! -z $YUM ]]; then
	yum update && yum -y install zsh 
else
	echo -e "\e[91mCan not find your package manager. Please report this as an issue or create a pull request with the new package manager."
	echo -e "If you would like to install manually, the package name is: \e[39mzsh"
fi

mkdir -p ~/Downloads/
cd ~/Downloads/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sh install.sh
