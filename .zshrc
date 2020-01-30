# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sandvich/.oh-my-zsh"

# Set package manager
# Arch, Manjaro, Antergos: pacman
# Manjaro: pamac
# Debian, Ubuntu, Mint: apt or apt-get
export PACKAGE_MANAGER="pacman"

# If you installed the dotfiles to another directory, 
# set $DOTFILES to that directory.
export DOTFILES="$HOME/git/dotfiles"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#POWERLEVEL9K_MODE='awesome-fontconfig'
ZSH_THEME="powerlevel10k/powerlevel10k"
source $DOTFILES/.p10k.zsh
#POWERLEVEL9K_DISABLE_RPROMPT=true
#
## 110
#POWERLEVEL9K_USER_FOREGROUND='#949494'
#POWERLEVEL9K_USER_BACKGROUND='#262626'
#POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='#ffdeaf'
#POWERLEVEL9K_DIR_HOME_FOREGROUND='#949494' # 6
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='#ffdeaf'
#POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='#4E4E4E'
#POWERLEVEL9K_DIR_HOME_BACKGROUND='#4E4E4E' # 6
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='#4E4E4E'
#POWERLEVEL9K_DIR_ETC_BACKGROUND='6'
#POWERLEVEL9K_HOME_ICON='\uF015 '
#POWERLEVEL9K_HOME_SUB_ICON='\uF015 '
#POWERLEVEL9K_FOLDER_ICON='\uF07C '
#POWERLEVEL9K_ETC_ICON='⚙ '
#POWERLEVEL9K_SUDO_ICON=$'\uF09C '
#
#POWERLEVEL9K_STATUS_ERROR_BACKGROUND='#262626'
#POWERLEVEL9K_STATUS_ERROR_FOREGROUND='167'
#POWERLEVEL9K_STATUS_OK_BACKGROUND='#262626'
#POWERLEVEL9K_STATUS_VERBOSE='false'
#
#POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='0'
#POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='0'
#POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='#87AFAF'
#POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='#949494'
#
#POWERLEVEL9K_CUSTOM_PACKAGES="zsh_packages"
#POWERLEVEL9K_CUSTOM_PACKAGES_BACKGROUND='#262626'
#POWERLEVEL9K_CUSTOM_PACKAGES_FOREGROUND='#8ec07c'
#
#zsh_packages() {
#	if [ -z "$updates" ]; then return; fi
#	if [ "$updates" != "1" -a "$updates" != "0" ]; then
#		echo "  $updates"
#	elif [ "$updates" "==" "1" ]; then
#		echo " "
#	fi
#}
#
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status user custom_packages dir dir_writable vcs)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Functions
checkUpdates() {
	echo $(<$DOTFILES/bin/updates.txt)
}

# Aliases and Exports
export LC_ALL="en_US.UTF-8"
export PATH=$PATH:$HOME/bin
export PYTHONPATH=$PYTHONPATH:/usr/lib/python3.8/site-packages
export VISUAL=nvim
export EDITOR=nvim
export CALCRC=$HOME/.calcrc

export RESTORE=$(echo -en '\033[0m')
export RED=$(echo -en '\033[00;31m')
export GREEN=$(echo -en '\033[00;32m')
export YELLOW=$(echo -en '\033[00;33m')
export BLUE=$(echo -en '\033[00;34m')
export MAGENTA=$(echo -en '\033[00;35m')
export PURPLE=$(echo -en '\033[00;35m')
export CYAN=$(echo -en '\033[00;36m')
export LIGHTGRAY=$(echo -en '\033[00;37m')
export LRED=$(echo -en '\033[01;31m')
export LGREEN=$(echo -en '\033[01;32m')
export LYELLOW=$(echo -en '\033[01;33m')
export LBLUE=$(echo -en '\033[01;34m')
export LMAGENTA=$(echo -en '\033[01;35m')
export LPURPLE=$(echo -en '\033[01;35m')
export LCYAN=$(echo -en '\033[01;36m')
export WHITE=$(echo -en '\033[01;37m')

alias edit=nvim
alias qe=vim # Vim is quicker to load
alias ncmpcpp="ncmpcpp -b ~/.config/ncmpcpp/keybinds"
alias update="sudo pacman -Syu && checkUpdates.sh && updates=$(checkUpdates)"
alias pacman_clear_cache="sudo pacman -Sc"
alias pamac_clear_cache="pacman_clear_cache; paccache -r -vuk0; paccache -r -v"
alias lock="qdbus org.freedesktop.ScreenSaver /ScreenSaver Lock"
alias vibrant="nvidia-settings -a 'DigitalVibrance=300'" # Nvidia only

# Commands to run on startup
stty -ixon
updates=$(checkUpdates)
if [ "$updates" != "1" -a "$updates" != "0" ]; then
	echo -e "${CYAN}  Pamac ${RESTORE}$updates available package updates. ${BLUE}'update' ${RESTORE}to install."
elif [ "$updates" "==" "1" ]; then
	echo "${CYAN}  Pamac ${RESTORE}1 availabe package update. ${BLUE}'update' ${RESTORE}to install."
fi

# Options
set -o vi

# Keybinds
bindkey -M vicmd "?" history-incremental-search-backward # https://github.com/dule/dotenv/blob/master/zshrc
bindkey -M vicmd "/" history-incremental-search-forward
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd 'u' undo

LS_COLORS="di=34;43:*rc=32"; export LS_COLORS
