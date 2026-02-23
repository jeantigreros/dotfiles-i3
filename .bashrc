[[ $- != *i* ]] && return

if [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        [ -f "$rc" ] && . "$rc"
    done
fi
unset rc

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

shopt -s cmdhist
shopt -s histappend
HISTSIZE=5000
HISTFILESIZE=10000
HISTCONTROL=ignoredups:erasedups

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
set show-all-if-ambiguous on
set completion-ignore-case on
set bell-style none

[[ -s /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

alias ls='ls --color=auto'

# Git prompt
if [ -f /usr/share/bash-completion/completions/git ]; then
    source /usr/share/bash-completion/completions/git
fi
export GIT_PS1_SHOWDIRTYSTATE=1

# 256-color PS1
USER_COLOR="\[\033[38;5;231m\]"   # white
HOST_COLOR="\[\033[38;5;160m\]"   # red
GIT_COLOR="\[\033[38;5;252m\]"    # idk
RESET_COLOR="\[\033[0m\]"

PS1="${USER_COLOR}\u${RESET_COLOR}@${HOST_COLOR}\h${RESET_COLOR}${USER_COLOR}\w${RESET_COLOR}\$(__git_ps1 \" ${GIT_COLOR}(%s)${RESET_COLOR}\")\$ "

doom() {
    ~/.config/emacs/bin/doom "$@"
}

ggs() { git status; }
ggm() {
    [ $# -eq 0 ] && { echo "Usage: ggm <commit>"; return 1; }
    git commit -m "$*"
}
ggp() { git push -u; }
ggb() { git branch; }
gga() {
    [ $# -eq 0 ] && { echo "Usage: gga <files>"; return 1; }
    git add "$@"
}

untar() {
    [ $# -eq 0 ] && { echo "Usage: untar <files.tar.gz>"; return 1; }
    tar -xvf "$1"
}

openports() {
    local port="${1:-3000}"
    lsof -i "tcp:$port"
}

set completion-query-items 0

export PNPM_HOME="$HOME/.local/share/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"
