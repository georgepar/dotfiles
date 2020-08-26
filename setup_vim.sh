cp .vimrc $HOME/.vimrc
cp -r .vim $HOME/

vim +qa

pushd $HOME/.vim/bundle/YouCompleteMe/

python install.py --clang-completer

popd
