#!/bin/zsh

echo "\n<<< Installing ZSH >>>\n"

# Installation was carried in the Brewfile
# Changing the default shell to the ZSH installed by Homebrew

echo "Enter superuser password to edit /etc/shells"
echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells'

echo "Enter user password to change login shell"
chsh -s '/usr/local/bin/zsh'

