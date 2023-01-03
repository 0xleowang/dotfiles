#!/bin/zsh

echo "\n<<< Installing Homebrew >>>\n"

if exists brew; then
  echo "Homebrew exists -> installiation skipped"
else
  echo "Installing HomeBrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --verbose
