# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sandvich/.oh-my-zsh"

# Set package manager
# Arch, Manjaro: pacman
# Manjaro: pamac
export PACKAGE_MANAGER="pacman"

# If you installed the dotfiles to another directory, 
# set $DOTFILES to that directory.
export DOTFILES="$HOME/git/dotfiles"

export TERMINAL=xst

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ -f $DOTFILES/.p10k.zsh ]] && source $DOTFILES/.p10k.zsh

# Autocomplete
#[[ -d $HOME/git/zsh-autocomplete/ ]] && source $HOME/git/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# Functions
checkUpdates() {
	[ -f /var/tmp/updates.txt ] && echo $(</var/tmp/updates.txt) || echo 0
}

viewdoc() {
	pandoc --to=pdf --pdf-engine=pdflatex -V geometry:margin=0.5in $1 | zathura -
}

youtubeaudio() {
	if [ $# -eq 2 ]; then
		youtube-dl -x --audio-format mp3 --output $2 $1
	elif [ $# -eq 1 ]; then
		youtube-dl -x --audio-format mp3 $1
	fi
}

stminify() {
	if [ $# -eq 1 ]; then
		st -c st-floating $1
	fi
}

type-clipboard() {
	xdotool type "`xclip -selection c -o`"
}

oldify() {
	if [[ "$1" == *.old ]]; then
		newname=$(basename "$1" .old)
		mv "$1" "$newname"
	else
		mv "$1" "$1.old"
	fi
}

virtual-sink() {
	pacmd load-module module-null-sink sink_name=VirtualMic
	pacmd update-sink-proplist VirtualMic device.description=VirtualMic
	pacmd load-module module-loopback source=VirtualMic
}

# Aliases and Exports
export LC_ALL="en_US.UTF-8"
export PATH=$PATH:$HOME/bin
export PYTHONPATH=$PYTHONPATH:/usr/lib/python3.8/site-packages
export VISUAL=nvim
export EDITOR=nvim
export CALCRC=$HOME/.calcrc

# Color constants
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

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0282828" #black
    echo -en "\e]P8282828" #darkgrey
    echo -en "\e]P1FB4934" #darkred
    echo -en "\e]P9FB4934" #red
    echo -en "\e]P2B8BB26" #darkgreen
    echo -en "\e]PAB8BB26" #green
    echo -en "\e]P3FABD2F" #brown
    echo -en "\e]PBFABD2F" #yellow
    echo -en "\e]P483A598" #darkblue
    echo -en "\e]PC83A598" #blue
    echo -en "\e]P5D3869B" #darkmagenta
    echo -en "\e]PDD3869B" #magenta
    echo -en "\e]P68EC07C" #darkcyan
    echo -en "\e]PE8EC07C" #cyan
    echo -en "\e]P7EBDBB2" #lightgrey
    echo -en "\e]PFFBF1C7" #white
    clear #for background artifacting
fi

export LESS_TERMCAP_mb=$CYAN
export LESS_TERMCAP_md=$LCYAN
export LESS_TERMCAP_me=$RESTORE
export LESS_TERMCAP_se=$RESTORE
export LESS_TERMCAP_so=$LRED
export LESS_TERMCAP_ue=$RESTORE
export LESS_TERMCAP_us=$BLUE

export SUDO_PROMPT="${LGREEN}[sudo] ${RESTORE} Password for ${CYAN}%p$RESTORE: "

alias edit=nvim
alias qe=vim # Vim is quicker to load
alias ncmpcpp="ncmpcpp -b ~/.config/ncmpcpp/keybinds"
alias update="sudo pacman -Syu && checkUpdates.sh && updates=$(checkUpdates)"
alias pacman_clear_cache="sudo pacman -Sc"
alias pamac_clear_cache="pacman_clear_cache; paccache -r -vuk0; paccache -r -v"
alias lock="qdbus org.freedesktop.ScreenSaver /ScreenSaver Lock"
alias vibrant="nvidia-settings -a 'DigitalVibrance=300'" # Nvidia only
alias betty="~/git/betty/main.rb"

# Commands to run on startup
[[ $- == "i" ]] && stty -ixon
updates=$(checkUpdates)
if [ "$updates" != "1" -a "$updates" != "0" ]; then
	echo -e "${CYAN}  $PACKAGE_MANAGER ${RESTORE}$updates available package updates. ${BLUE}'update' ${RESTORE}to install."
elif [ "$updates" "==" "1" ]; then
	echo "${CYAN}  $PACKAGE_MANAGER ${RESTORE}1 availabe package update. ${BLUE}'update' ${RESTORE}to install."
fi

setopt autocd

# Options
set -o vi # Enable vim keybinds in prompt
HISTFILE=~/.zshrc

# Keybinds
bindkey -M vicmd "?" history-incremental-search-backward # https://github.com/dule/dotenv/blob/master/zshrc
bindkey -M vicmd "/" history-incremental-search-forward
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd 'u' undo

LS_COLORS="di=34;43:*rc=32"; export LS_COLORS

# node.js version manager
source /usr/share/nvm/init-nvm.sh
