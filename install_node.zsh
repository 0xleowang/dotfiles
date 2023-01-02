#!/bin/zsh

echo "\n<<< Installing Node >>>\n"

# Node versions are managed by `n`, which is installed by Homebrew
# See .zshrc for N_PREFIX variable and addition to PATH 

if exists node; then
  echo "Node $(node --version) & NPV $(npm --version) already installed"
else
  echo "Installing Node & NPM with n..."
  n latest
fi
