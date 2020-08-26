chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp .zshrc $HOME/
cp .p10k.zsh $HOME/
cp .taskrc $HOME/
