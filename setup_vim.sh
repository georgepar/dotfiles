mkdir -p $HOME/.config/coc
ln -s $(pwd)/.vimrc $HOME/.vimrc
ln -s $(pwd)/.vim $HOME/.vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
vim -c 'CocInstall -sync coc-python coc-snippets coc-clangd coc-texlab coc-json coc-html|qall'

vim -c 'CocInstall -sync https://github.com/SvenBecker/vscode-pytorch|qall'
