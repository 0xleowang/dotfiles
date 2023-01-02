##############################################################################
# Variables
##############################################################################
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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

##############################################################################
# Oh-my-zsh
##############################################################################
HYPHEN_INSENSITIVE="true"

# update automatically without asking
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 30 # (in days)

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# plugins
plugins=(
    zsh-autosuggestions
    z
)

source $ZSH/oh-my-zsh.sh

# activate starship
eval "$(starship init zsh)"

# auto-suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

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

###############################################################################
# Alias
###############################################################################
alias mm="micromamba"
alias vi="nvim"
alias vim="nvim"
alias zshconfig="nvim $ZDOTDIR/.zshrc"
alias ls="command exa -laFh --git --group-directories-first"
alias lst="command exa -laFh --git --tree --level=2 --group-directories-first"
alias exa="command exa -laFh --git --group-directories-first"
alias trail="<<<'${(F)path}'"
alias rm=trash
