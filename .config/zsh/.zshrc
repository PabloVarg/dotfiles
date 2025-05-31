# Colors
autoload -U colors && colors

# Options
setopt INCAPPENDHISTORY HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_SPACE
setopt AUTOCD AUTO_PUSHD
setopt ALWAYS_TO_END
setopt EXTENDEDGLOB
unsetopt CASE_GLOB
unsetopt BEEP
bindkey -e

# Completion
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Bash word style
autoload -U select-word-style
select-word-style bash

# Inlude hidden files in completion
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v

export KEYTIMEOUT=1

# Correct keys
autoload -U edit-command-line
zle -N edit-command-line
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

[[ -n "${key[Home]}"       ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"        ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"     ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}"  ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"     ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"         ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"       ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"       ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"      ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"     ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"   ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}"  ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H"      backward-kill-word
bindkey "^X^e"    edit-command-line
bindkey "^R"      history-incremental-pattern-search-backward
bindkey "^[l"     clear-screen

# History
HISTSIZE=1000
SAVEHIST=1000

# Variables
ZSH_CUSTOM=$HOME/.config/zsh
ZSH_CACHE_DIR=$HOME/.cache/zsh
HISTFILE=$ZSH_CACHE_DIR/.zsh_history
ZSH_THEME=$ZSH_CUSTOM/prompt

# Load theme
if [[ -f $ZSH_THEME ]]; then
    source $ZSH_THEME
fi

# Load aliases
if [[ -f $ZSH_CUSTOM/.aliases ]]; then
    source $ZSH_CUSTOM/.aliases
fi

# Make cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# Syntax highlighting
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Tmux
if command -v tmux &> /dev/null && [ -z $TMUX ] && [ -z $INSIDE_EMACS ] && [ -z $VIMRUNTIME ] && [[ -z $XDG_VTNR || $DISPLAY ]] && [ -z $lf ] && [ -z $SSH_TTY ]; then
    tmux attach -t "${TMUX_TARGET:-terminal}" || tmux new -s "${TMUX_TARGET:-terminal}" && exit
fi
