CHEAT_VERSION=4.0.4

CHEAT_BINARY=$HOME/opt/bin/cheat

wget -O - https://github.com/cheat/cheat/releases/download/$CHEAT_VERSION/cheat-linux-amd64.gz | gunzip > $CHEAT_BINARY
chmod +x $CHEAT_BINARY

mkdir -p $HOME/.config/cheat
mkdir -p $HOME/.config/cheat/cheatsheets
ln -s $(pwd)/cheatsheets/ $HOME/.config/cheat/cheatsheets/personal/

$CHEAT_BINARY --init > $HOME/.config/cheat/conf.yml

git clone https://github.com/cheat/cheatsheets $HOME/.config/cheat/cheatsheets/community
