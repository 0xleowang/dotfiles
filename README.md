# dotfiles

## Instructions

1. Generate an SSH key and add it to your Github account: [guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
2. Clone the repository:
```bash
git clone git@github.com:0xleowang/dotfiles.git ~/.dotfiles
```
3. Start installation:
```bash
./install.sh
```

## Add packages to Brewfile
1. Run:
```bash
brew bundle dump --file=Brewfile.local --describe
```
2. Copy the package with description from `Brewfile.local` to `Brewfile`
3. Commit
