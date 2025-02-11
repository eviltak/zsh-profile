# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

fpath+=~/.zfunc

ZSHRC_DIR=$(dirname $(readlink -f "${(%):-%x}"))
source "$ZSHRC_DIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'r:|[._-]=* r:|=*'
zstyle :compinstall filename '$HOME/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install

source $HOME/antigen.zsh

antigen init $HOME/.antigenrc

# Cycle through history based on characters already typed on the line
# autoload -U up-line-or-beginning-search
# autoload -U down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search
# bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
# bindkey "$terminfo[kcud1]" down-line-or-beginning-search

### zsh-autocomplete
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

# all widgets
zstyle ':autocomplete:*' insert-unambiguous yes
### End zsh-autocomplete

bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word

bindkey "\e[3;5~" kill-word
bindkey '^H' backward-kill-word
bindkey "\e[3;6~" kill-line

EDITOR=vim
SUDO_EDITOR=vim

alias ls='ls --color=auto'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Use .zprofile for per-machine customizations
[[ ! -f ~/.zprofile ]] || source ~/.zprofile
