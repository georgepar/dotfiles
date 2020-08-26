# Link dotfiles
ln -s .zshrc $HOME/.zshrc
ln -s .p10k.zsh $HOME/.p10k.zsh
ln -s .taskrc $HOME/.taskrc

# Install Oh my zsh
export KEEP_ZSHRC=yes 
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh navigation tools
sh -c "$(curl -fsSL https://raw.githubusercontent.com/psprint/zsh-navigation-tools/master/doc/install.sh)"

# Install p10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git 
cp -r powerlevel10k ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/
cp -r powerlevel10k/* ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/
rm -rf powerlevel10k

# Install fonts
git clone https://github.com/romkatv/powerlevel10k-media/
mkdir -p ~/.local/share/fonts
cp powerlevel10k-media/*.ttf ~/.local/share/fonts
rm -rf powerlevel10k-media

# Set zsh default shell (requires password)
chsh -s $(which zsh)
