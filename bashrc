[[ $- != *i* ]] && return
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

if [[ -f ~/.fzf.bash ]]; then
    source ~/.fzf.bash
fi

shopt -s cmdhist
shopt -s histappend
# Set history size
HISTSIZE=100000
HISTFILESIZE=10000
HISTCONTROL=ignoredups:erasedups

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
set show-all-if-ambiguous on
set completion-ignore-case on
set bell-style none

[[ -s /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
# sudo [dnf apt pacman -S] bash-completion

if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
fi
export GIT_PS1_SHOWDIRTYSTATE=1

# 256-color PS1
HOST_COLOR="\[\033[38;5;31m\]"   # blue
GIT_COLOR="\[\033[38;5;252m\]"    # light gray
RESET_COLOR="\[\033[0m\]"

PS1="${RESET_COLOR}\u${RESET_COLOR}@${HOST_COLOR}\h${RESET_COLOR}${RESET_COLOR}\w${RESET_COLOR}\$(__git_ps1 \" ${GIT_COLOR}(%s)${RESET_COLOR}\")\$ "

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

ggb() {
  git branch
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

set completion-query-items 0

# pnpm
export PNPM_HOME="/home/j/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH=$JAVA_HOME/bin:$PATH
export MOZ_ENABLE_WAYLAND=1
