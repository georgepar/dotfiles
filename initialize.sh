mkdir -p ~/.local/share/fonts
mkdir -p $HOME/opt/bin

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s $(pwd)/bin/* $HOME/opt/bin/
ln -s $(pwd)/.tmux.conf $HOME/

~/.tmux/plugins/tpm/bin/install_plugins
