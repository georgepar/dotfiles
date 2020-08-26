sudo apt-get install -y \
    git curl wget zsh build-essential cmake \
    imagemagick direnv unzip tmux taskwarrior vim htop

mkdir -p $HOME/bin

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
$HOME/.fzf/install --bin
mv $HOME/.fzf/bin/* $HOME/bin/
rm -rf $HOME/.fzf
