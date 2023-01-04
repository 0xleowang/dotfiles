# Setup Zap
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh" "$zshrc"

##############################################################################
# Variables
##############################################################################

# Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Disable gatekeeper for Homebrew
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Replace cat by bat for nullcmd
export NULLCMD=bat

# Set directories for n (the Node version manager)
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"

# PATH
# $path is array and $PATH is a scalar (string)
typeset -U path
path=(
    "$N_PREFIX/bin"
    $path
)

###############################################################################
# Aliases
###############################################################################
for file in ~/.zsh_aliases/*(D);
    source $file

###############################################################################
# Manage Zsh Plugins by Zap
###############################################################################
# Plugins
plug "zsh-users/zsh-autosuggestions" 
plug "zsh-users/zsh-syntax-highlighting"
plug "agkozak/zsh-z"
plug "jeffreytse/zsh-vi-mode"

# Completions
plug "zsh-users/zsh-completions"

# Enable menu selection
zstyle ':completion:*' menu yes select

###############################################################################
# Prompt
###############################################################################
# activate starship
eval "$(starship init zsh)"

###############################################################################
# mamba initialize 
###############################################################################
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/usr/local/bin/micromamba";
export MAMBA_ROOT_PREFIX="/Users/elev3n/.micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/Users/elev3n/.micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/Users/elev3n/.micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/Users/elev3n/.micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
###############################################################################

