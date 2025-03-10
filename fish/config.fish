if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

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

function fish_user_key_bindings
    fish_vi_key_bindings  # Ensure Vi mode is enabled
    bind -M insert \cf forward-char  # Bind Ctrl + F in insert mode
end



export EDITOR="nvim"
export VISUAL="nvim"

# binds

#bind \cf forward-char
#bind \el clear-screen

# pnpm
set -gx PNPM_HOME "/home/j/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Set root folder for jump.fish

set -g j_path "$HOME/dev"

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

fish_user_key_bindings
