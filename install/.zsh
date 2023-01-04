#!/bin/zsh

echo "\n<<< Installing ZSH >>>\n"

# Installation was carried in the Brewfile
# Changing the default shell to the ZSH installed by Homebrew

if ! grep -Fxq /usr/local/bin/zsh /etc/shells; then
  echo "Enter superuser password to edit /etc/shells"
  echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells >/dev/null
else
  echo "/usr/local/bin/zsh already exists in /etc/shells"
fi

if [ $SHELL = "/bin/zsh" ]; then
  echo "Enter user password to change login shell"
  chsh -s '/usr/local/bin/zsh'
else
  echo "$SHELL has already been set to /usr/local/bin/zsh"
fi

# Install Zap as the Zsh plugin manager
if exists zap; then
  echo "Zap has been installed."
else
  echo "Installing Zap ..."
  git clone https://github.com/zap-zsh/zap.git "$HOME/.local/share/zap" > /dev/null 2>&1
  mkdir -p "$HOME/.local/share/zap/plugins"
fi

