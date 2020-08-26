CHEAT_VERSION=4.0.4

mkdir -p $HOME/bin
CHEAT_BINARY=$HOME/bin/cheat

wget -O - https://github.com/cheat/cheat/releases/download/$CHEAT_VERSION/cheat-linux-amd64.gz | gunzip > $CHEAT_BINARY
chmod +x $CHEAT_BINARY

mkdir -p $HOME/.config/cheat
mkdir -p $HOME/.config/cheat/cheatsheets
mkdir -p $HOME/.config/cheat/cheatsheets/personal
cp cheatsheets/* $HOME/.config/cheat/cheatsheets/personal/

$CHEAT_BINARY --init > $HOME/.config/cheat/conf.yml

git clone https://github.com/cheat/cheatsheets $HOME/.config/cheat/cheatsheets/community
