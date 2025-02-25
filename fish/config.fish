if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

# Git configuration aliases

function dotfiles --description "dotfiles commands with bare git repo"
    GIT_WORK_TREE=~ GIT_DIR=~/.cfg/ $argv
end

function config
    /usr/bin/git --git-dir=/home/j/.cfg --work-tree=/home/j $argv
end

function ccs 
    config status
end

function ccm 
    config commit -m "$argv"
end

function ccp 
    config push
end

function cca 
    config add $argv
end

function ggs 
    git status
end

function ggm 
    git commit -m "$argv"
end

function ggp 
    git push
end

function gga 
    git add $argv
end


export EDITOR="nvim"
export VISUAL="nvim"

# binds

bind \cl forward-char 
bind \el clear-screen

# pnpm
set -gx PNPM_HOME "/home/j/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Set root folder for jump.fish

set -g j_path "$HOME/dev"

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/j/.lmstudio/bin

# Created by `pipx` on 2025-02-18 00:42:11
set PATH $PATH /home/j/.local/bin
