export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}"  ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

mkdir -p $HOME/.config/coc
ln -s $(pwd)/vim/.vimrc $HOME/.vimrc
ln -s $(pwd)/vim/.vim $HOME/.vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
vim -c 'CocInstall -sync coc-python coc-snippets coc-clangd coc-texlab coc-json coc-html|qall'

vim -c 'CocInstall -sync https://github.com/SvenBecker/vscode-pytorch|qall'

pip show neovim && pip install neovim

mkdir -p ${HOME}/.config/nvim
ln -s $(pwd)/vim/init.vim ${HOME}/.config/nvim/init.vim
