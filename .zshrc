# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    [ "$TERM" != "dumb" ] && source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases and Exports
#export DOTFILES="$HOME/git/dotfiles"
#source $DOTFILES/common.sh
source $HOME/.profile

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
    echo -en "\e]P02B303B"
    echo -en "\e]P82B303B"
    echo -en "\e]P1BF616A"
    echo -en "\e]P9BF616A"
    echo -en "\e]P2A3BE8C"
    echo -en "\e]PAA3BE8C"
    echo -en "\e]P3EBCB8B"
    echo -en "\e]PBEBCB8B"
    echo -en "\e]P48FA1B3"
    echo -en "\e]PC8FA1B3"
    echo -en "\e]P5B48EAD"
    echo -en "\e]PDB48EAD"
    echo -en "\e]P696B5B4"
    echo -en "\e]PE96B5B4"
    echo -en "\e]P7EFF1F5"
    echo -en "\e]PFEFF1F5"
    #clear
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
alias sunvim="sudo -E nvim"
alias ssh-socks="ssh -D 8090 -CN"
alias ssh-pi="ssh sandvich.cloudns.nz -p 2200"
alias du-sweep="du -sk * | sort -nr | head -10"

# Set package manager
export PACKAGE_MANAGER=pacman

# Set terminal emulator
export TERMINAL=st

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# autoload
autoload -U compinit && compinit
autoload -U select-word-style
select-word-style bash

if [ "$TERM" = "dumb" ]; then
    # emacs tramp fix
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    unfunction precmd
    unfunction preexec
    PS1='$ '
else
    # source plugins if we are actually in a terminal
    source $DOTFILES/.zsh/zsh-completions/zsh-completions.plugin.zsh
    source $DOTFILES/.zsh/powerlevel10k/powerlevel10k.zsh-theme
    source $DOTFILES/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $DOTFILES/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
fi

# plugin configuration
if [ "$TERM" = "linux" ]; then
    [[ -f $DOTFILES/.p10k-tty.zsh ]] && source $DOTFILES/.p10k-tty.zsh
elif [ "$TERM" != "dumb" ]; then
    [[ -f $DOTFILES/.p10k.zsh ]] && source $DOTFILES/.p10k.zsh
fi
export ZSH_AUTOSUGGEST_STRATEGY=(completion)
export ZVM_KEYTIMEOUT=0.2

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
    for file in $@; do
        if [[ "$file" == *.old ]]; then
            newname=$(basename "$file" .old)
            mv "$file" "$newname"
        else
            mv "$file" "$file.old"
        fi
    done
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
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1024

# Keybinds
bindkey -M vicmd "?" history-incremental-search-backward # https://github.com/dule/dotenv/blob/master/zshrc
bindkey -M vicmd "/" history-incremental-search-forward
bindkey -M viins "jj" vi-cmd-mode
bindkey -M vicmd "u" undo
bindkey "^H" backward-kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
export ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

LS_COLORS="di=34;43:*rc=32"; export LS_COLORS

PATH="/home/sandvich/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/sandvich/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/sandvich/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/sandvich/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/sandvich/perl5"; export PERL_MM_OPT;
