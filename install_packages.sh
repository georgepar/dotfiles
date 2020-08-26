sudo apt-get install -y \
    git git-lfs curl wget zsh build-essential cmake \
    imagemagick direnv unzip tmux taskwarrior vim htop

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
$HOME/.fzf/install --bin
mv $HOME/.fzf/bin/* $HOME/opt/bin/
rm -rf $HOME/.fzf
