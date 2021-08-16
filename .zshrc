# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases and Exports
export DOTFILES="$HOME/git/dotfiles"
source $DOTFILES/common.sh

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
    echo -en "\e]P0282828"
    echo -en "\e]P8282828"
    echo -en "\e]P1fB4934"
    echo -en "\e]P9FB4934"
    echo -en "\e]P2B8BB26"
    echo -en "\e]PAB8BB26"
    echo -en "\e]P3FABD2F"
    echo -en "\e]PBFABD2F"
    echo -en "\e]P483A598"
    echo -en "\e]PC83A598"
    echo -en "\e]P5D3869B"
    echo -en "\e]PDD3869B"
    echo -en "\e]P68EC07C"
    echo -en "\e]PE8EC07C"
    echo -en "\e]P7EBDBB2"
    echo -en "\e]PFFBF1C7"
    clear
fi

export LESS_TERMCAP_mb=$CYAN
export LESS_TERMCAP_md=$LCYAN
export LESS_TERMCAP_me=$RESTORE
export LESS_TERMCAP_se=$RESTORE
export LESS_TERMCAP_so=$LRED
export LESS_TERMCAP_ue=$RESTORE
export LESS_TERMCAP_us=$BLUE

export SUDO_PROMPT="${LGREEN}sudo:${RESTORE}  Password for ${CYAN}%p$RESTORE: "

alias edit=nvim
alias qe=vim # Vim is quicker to load
alias ncmpcpp="ncmpcpp -b ~/.config/ncmpcpp/keybinds"
alias lock="qdbus org.freedesktop.ScreenSaver /ScreenSaver Lock"
alias vibrant="nvidia-settings -a 'DigitalVibrance=300'" # Nvidia only
alias crayon="mono $CRAYON_HOME/crayon.exe"
alias overlay="pqiv --click-through --keep-above --transparent-background --hide-info-box"
alias pepes="sxiv -P $PEPE_PATH" # requires my fork of sxiv

# Set package manager
export PACKAGE_MANAGER=pacman

# Set terminal emulator
export TERMINAL=st

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# source plugins
source $DOTFILES/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source $DOTFILES/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# plugin configuration
[[ -f $DOTFILES/.p10k.zsh ]] && source $DOTFILES/.p10k.zsh
export ZSH_AUTOSUGGEST_STRATEGY=(completion)

# functions
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

# Commands to run on startup
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

eval "$(pyenv init -)"
