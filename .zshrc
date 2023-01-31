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
for file in ~/.aliases/*(D);
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
# conda initialize 
###############################################################################
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
###############################################################################

