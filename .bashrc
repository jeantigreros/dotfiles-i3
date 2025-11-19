# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

source ~/.fzf.bash
shopt -s cmdhist
shopt -s histappend
# Set history size
HISTSIZE=5000
HISTFILESIZE=10000
HISTCONTROL=ignoredups:erasedups

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
set show-all-if-ambiguous on
set completion-ignore-case on
set bell-style none

[[ -s /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
# sudo [dnf apt pacman -S] bash-completion

RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
YELLOW="\[\033[0;33m\]"
RESET="\[\033[0m\]"

export PS1="j@${BLUE}fedora${RESET}:\w${RESET}\$ "

doom() {
  ~/.config/emacs/bin/doom "$@"
}

ggs() {
  git status
}

ggm() {
  if [ $# -eq 0 ]; then
    echo "Usage: ggm <commit>"
    return 1
  fi
  git commit -m "$*"
}

ggp() {
  git push -u
}

gga() {
  if [ $# -eq 0 ]; then
    echo "Usage: gga <files>"
    return 1
  fi
  git add "$@"
}

untar() {
  if [ $# -eq 0 ];then
    echo "Usage: untar <files.tar.gz>"
    return 1
  fi
  tar -xvf "$1"
}

openports() {
  local port="${1:-3000}"
  lsof -i "tcp:$port"
}
