DOTCONFIG=$(HOME)/.config
LOCAL=$(HOME)/opt
LOCALBIN=$(LOCAL)/bin
CHEAT_VERSION=4.0.4
CHEAT_BINARY=$(LOCALBIN)/cheat
PACKAGE_MANAGER=apt-get install -y
.ONESHELL:

all: deps configall
deps: must-have-deps nice-to-have-deps
must-have-deps: initialize basic-system-deps nvm anaconda nvim fzf python-deps
nice-to-have-deps: extra-system-deps dust reredirect colorscripts lf cheat

configall: config config-optional
config: config-git config-tmux config-vim
config-optional: config-zsh config-kitty

clean: clean-vim clean-zsh clean-git clean-anaconda clean-cheat clean-kitty clean-tmux

initialize:
	mkdir -p ~/.local/share/fonts
	mkdir -p $(LOCALBIN)
	ln -s $(PWD)/bin/* $(LOCALBIN)

vim82:
	add-apt-repository -y ppa:jonathonf/vim
	apt-get install vim

nvim:
	wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -O $(LOCALBIN)/nvim
	chmod +x wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -O $(LOCALBIN)/nvim

fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git $(LOCAL)/fzf
	$(LOCAL)/fzf/install --all --no-fish --64
	ln -s $(OPT)/fzf/bin/* $(LOCALBIN)/

basic-system-deps:
	$(PACKAGE_MANAGER) git curl wget build-essential cmake unzip tmux

extra-system-deps:
	$(PACKAGE_MANAGER) git-lfs imagemagick direnv zsh taskwarrior kitty cargo ffmpeg sox

dust:
	cargo install du-dust

nvm:
	./setup-nvm

reredirect:
	git clone https://github.com/jerome-pouiller/reredirect/ /tmp/reredirect
	cd /tmp/reredicect
	make
	cp reredicect $(LOCALBIN)
	cp relink $(LOCALBIN)
	cd $(OLDPWD)
	rm -rf /tmp/reredirect

colorscripts:
	cp -r shell-color-scripts $(LOCAL)
	cp shell-color-scripts/colorscript.sh $(LOCALBIN)/colorscript

lf:
	wget  -qO- https://github.com/gokcehan/lf/releases/download/r25/lf-linux-amd64.tar.gz  | \
		tar xz > $(LOCALBIN)/lf

anaconda:
	wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh -O anaconda.sh
	bash anaconda.sh -b -p $(LOCAL)/anaconda3
	rm anaconda.sh
	ln -s $(PWD)/flake8 $(DOTCONFIG)/flake8

python-deps:
	$(LOCAL)/anaconda3/bin/pip install -Ur requirements.txt

cheat:
	wget -O - https://github.com/cheat/cheat/releases/download/$(CHEAT_VERSION)/cheat-linux-amd64.gz | \
		gunzip > $(LOCALBIN)/cheat
	chmod +x $(LOCALBIN)/cheat
	mkdir -p $(DOTCONFIG)/cheat
	mkdir -p $(DOTCONFIG)/cheat/cheatsheets
	mkdir -p $(DOTCONFIG)/cheat/cheatsheets/personal
	ln -s $(PWD)/cheatsheets/* $(HOME)/.config/cheat/cheatsheets/personal/
	git clone https://github.com/cheat/cheatsheets $(DOTCONFIG)/cheat/cheatsheets/community
	$(LOCALBIN)/cheat --init > $(DOTCONFIG)/cheat/conf.yml

config-git:
	ln -s $(PWD)/.gitconfig $(HOME)/.gitconfig
	ln -s $(PWD)/.git-templates $(HOME)/.git-templates

config-kitty:
	mkdir -p $(DOTCONFIG)/kitty/
	ln -s $(PWD)/kitty.conf $(DOTCONFIG)/kitty/kitty.conf
	git clone --depth 1 git@github.com:dexpota/kitty-themes.git $(DOTCONFIG)/kitty/kitty-themes
	ln -s $(DOTCONFIG)/kitty/kitty-themes/themes/Dracula.conf $(DOTCONFIG)/kitty/theme.conf

config-vim:
	./setup-vim

config-zsh:
	./setup-zsh

config-tmux:
	git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm
	ln -s $(PWD)/.tmux.conf $(HOME)/
	$(HOME)/.tmux/plugins/tpm/bin/install_plugins

clean-vim:
	rm $(HOME)/.vimrc $(DOTCONFIG)/nvim/init.vim $(HOME)/.vim

clean-zsh:
	rm $(HOME)/.zshrc $(HOME)/.p10k.zsh $(HOME)/.fzf.zsh $(HOME)/.taskrc
	rm -rf $(HOME)/.oh-my-zsh

clean-git:
	rm $(HOME)/.git-templates $(HOME)/.gitconfig

clean-anaconda:
	rm -rf $(LOCAL)/anaconda3
	rm $(DOTCONFIG)/flake8

clean-cheat:
	rm $(LOCALBIN)/cheat
	rm -rf $(DOTCONFIG)/cheat

clean-kitty:
	rm -rf $(DOTCONFIG)/kitty

clean-tmux:
	rm $(HOME)/.tmux.conf
	rm -rf $(HOME)/.tmux/plugins/tpm
