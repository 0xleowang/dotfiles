# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
    ".bin"
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

# Theme
plug "romkatv/powerlevel10k"

# Enable menu selection
zstyle ':completion:*' menu yes select

###############################################################################
# conda initialize
###############################################################################
if [[ $(uname -m) == "arm64" ]]; then
  # Apple Silicon
  CONDA_PATH="/opt/homebrew/Caskroom/miniconda"
else
  # Intel
  CONDA_PATH="/usr/local/Caskroom/miniconda"
fi
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$CONDA_PATH/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$CONDA_PATH/base/etc/profile.d/conda.sh" ]; then
        . "$CONDA_PATH/base/etc/profile.d/conda.sh"  # commented out by conda initialize
    else
        export PATH="$CONDA_PATH/base/bin:$PATH"  # commented out by conda initialize
    fi
fi
unset __conda_setup
###############################################################################

###############################################################################
# Prompt
###############################################################################
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

