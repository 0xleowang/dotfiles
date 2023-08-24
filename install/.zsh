#!/bin/zsh

echo "\n<<< Installing ZSH >>>\n"

# Installation was carried in the Brewfile
# Changing the default shell to the ZSH installed by Homebrew

if [[ $(uname -m) == "arm64" ]]; then
  # Apple Silicon
  ZSH_PATH="/opt/homebrew/bin/zsh"
else
  # Intel
  ZSH_PATH="/usr/local/bin/zsh"
fi

if ! grep -Fxq $ZSH_PATH /etc/shells; then
  echo "Enter superuser password to edit /etc/shells"
  echo $ZSH_PATH | sudo tee -a /etc/shells >/dev/null
else
  echo "$ZSH_PATH already exists in /etc/shells"
fi

if [ $SHELL != $ZSH_PATH ]; then
  echo "Enter user password to change login shell"
  chsh -s $ZSH_PATH
else
  echo "$SHELL has already been set to $ZSH_PATH"
fi

# Install Zap as the Zsh plugin manager
if exists zap; then
  echo "Zap has been installed."
else
  echo "Installing Zap ..."
  zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
fi

