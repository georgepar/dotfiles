ln -s $(pwd)/.vimrc $HOME/.vimrc
ln -s $(pwd)/.vim $HOME/.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

pushd $HOME/.vim/bundle/YouCompleteMe/

$HOME/opt/anaconda3/bin/python install.py --clang-completer

popd
