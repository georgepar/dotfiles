mkdir -p ${HOME}/.config/kitty/
ln -s $(pwd)/kitty.conf ${HOME}/.config/kitty/kitty.conf

git clone --depth 1 git@github.com:dexpota/kitty-themes.git ${HOME}/.config/kitty/kitty-themes

ln -s ${HOME}/.config/kitty/kitty-themes/themes/Dracula.conf ${HOME}/.config/kitty/theme.conf
