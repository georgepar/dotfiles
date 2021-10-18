sudo add-apt-repository ppa:jonathonf/vim

sudo apt-get install -y \
    git git-lfs curl wget zsh build-essential cmake \
    imagemagick direnv unzip tmux taskwarrior vim neovim htop

sudo snap install dust

git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/opt/fzf
$HOME/opt/fzf/install --all --no-bash --no-fish --64
ln -s $HOME/opt/fzf/bin/* $HOME/opt/bin/


curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}"  ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install node
npm install -g yarn neovim

git clone https://github.com/jerome-pouiller/reredirect/ /tmp/reredirect
pushd /tmp/reredicect
make
cp reredicect $HOME/opt/bin/
cp relink $HOME/opt/bin
popd
rm -rf /tmp/reredirect


cp -r shell-color-scripts ${HOME}/opt/
cp shell-color-scripts/colorscript.sh ${HOME}/opt/bin/colorscript
