cp .zshrc $HOME/
cp .p10k.zsh $HOME/
cp .taskrc $HOME/

export KEEP_ZSHRC=yes 
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/psprint/zsh-navigation-tools/master/doc/install.sh)"


git clone --depth=1 https://github.com/romkatv/powerlevel10k.git 
cp -r powerlevel10k ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/
cp -r powerlevel10k/* ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/
rm -rf powerlevel10k

git clone https://github.com/romkatv/powerlevel10k-media/
mkdir -p ~/.local/share/fonts
cp powerlevel10k-media/*.ttf ~/.local/share/fonts
rm -rf powerlevel10k-media

cp ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/

chsh -s $(which zsh)

