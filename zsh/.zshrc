# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle :compinstall filename '/home/bmiww/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=20000
setopt autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install

alias ls='ls --color=auto'
alias emacsclient='emacsclient --alternate-editor="" -c "$@"'

export PATH=$PATH:~/.local/bin
setxkbmap -option grp:switch,grp:win_space_toggle,grp_led:scroll us,lv -variant alt

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
antigen apply
