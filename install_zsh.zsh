#!/bin/zsh

echo "\n<<< Installing ZSH >>>\n"

# Installation was carried in the Brewfile
# Changing the default shell to the ZSH installed by Homebrew

if ! grep -Fxq /usr/local/bin/zsh /etc/shells; then
  echo "Enter superuser password to edit /etc/shells"
  echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells >/dev/null
fi

if [ $SHELL = "/bin/zsh" ]; then
  echo "Enter user password to change login shell"
  chsh -s '/usr/local/bin/zsh'
fi 

