DOTCONFIG=$(HOME)/.config
LOCAL=$(HOME)/opt
LOCALBIN=$(LOCAL)/bin
CHEAT_VERSION=4.0.4
CHEAT_BINARY=$(LOCALBIN)/cheat
GO_VERSION=1.17.2
MINICONDA_VERSION=4.10.3
PACKAGE_MANAGER=apt-get install -y


.ONESHELL:

all: deps configall my-python-deps
deps: must-have-deps nice-to-have-deps
system-deps: basic-system-deps extra-system-deps
must-have-deps: initialize nvm miniconda rust go nvim fzf python-deps lsps
nice-to-have-deps: rust-utils reredirect colorscripts lf cheat

configall: config config-optional
config: config-zsh config-git config-tmux config-vim
config-optional: config-kitty

clean: clean-vim clean-zsh clean-git clean-miniconda clean-cheat clean-kitty clean-tmux clean-fzf clean-go clean-nvm clean-local clean-rust

initialize:
	mkdir -p $(HOME)/.local/share/fonts
	mkdir -p $(LOCALBIN)

clean-local:
	rm -rf $(LOCAL)

shellcheck:
	wget https://github.com/koalaman/shellcheck/releases/download/stable/shellcheck-stable.linux.x86_64.tar.xz
	tar xvf shellcheck-stable.linux.x86_64.tar.xz
	mv shellcheck-stable/shellcheck $(LOCALBIN)/shellcheck
	chmod +x $(LOCALBIN)/shellcheck
	rm -r shellcheck-stable shellcheck-stable.linux.x86_64.tar.xz

go:
	wget -qO- https://dl.google.com/go/go$(GO_VERSION).linux-amd64.tar.gz | tar xzv -C ~/opt/

glow:
	wget https://github.com/charmbracelet/glow/releases/download/v1.4.1/glow_1.4.1_linux_x86_64.tar.gz -O /tmp/glow.tar.gz
	cd /tmp && tar xvf glow.tar.gz && mv glow $(LOCALBIN)/ && rm glow.tar.gz && cd -

clean-go:
	rm -rf $(LOCAL)/go || echo "Nothing to clean for go"

obsidian:
	wget https://github.com/obsidianmd/obsidian-releases/releases/download/v0.12.19/Obsidian-0.12.19.AppImage -O $(LOCALBIN)/obsidian
	chmod +x $(LOCALBIN)/obsidian

rust:
	curl https://sh.rustup.rs -sSf | sh -s -- -y

clean-rust:
	rm -rf $(HOME)/.cargo

vim82:
	add-apt-repository -y ppa:jonathonf/vim
	apt-get install vim

nvim:
	wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -O $(LOCALBIN)/nvim || wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -O $(LOCALBIN)/nvim
	chmod +x $(LOCALBIN)/nvim

fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git $(LOCAL)/fzf
	$(LOCAL)/fzf/install --all --no-fish
	ln -s $(LOCAL)/fzf/bin/fzf $(LOCALBIN)/
	ln -s $(LOCAL)/fzf/bin/fzf-tmux $(LOCALBIN)/

clean-fzf:
	rm -rf $(LOCAL)/fzf || echo "Nothing to clean for fzf"
	rm $(LOCALBIN)/fzf  || echo "Nothing to clean for fzf"
	rm $(LOCALBIN)/fzf-tmux || echo "Nothing to clean for fzf"

basic-system-deps:
	$(PACKAGE_MANAGER) git curl wget build-essential cmake unzip tmux

extra-system-deps:
	$(PACKAGE_MANAGER) git-lfs imagemagick direnv zsh taskwarrior kitty ffmpeg sox

rust-utils:
	$(HOME)/.cargo/bin/cargo install du-dust fd-find exa ripgrep git-delta bat procs grex cargo-cache
	curl -sS https://webinstall.dev/zoxide | bash
	wget https://github.com/dbrgn/tealdeer/releases/download/v1.4.1/tldr-linux-x86_64-musl -O $(LOCALBIN)/tldr
	chmod +x $(LOCALBIN)/tldr
	$(HOME)/.cargo/bin/cargo cache -a

nvm:
	./setup-nvm

clean-nvm:
	rm -rf $(HOME)/.nvm || echo "Nothing to clean for nvm"

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
	chmod +x $(LOCALBIN)/lf

miniconda:
	wget https://repo.anaconda.com/miniconda/Miniconda3-py38_$(MINICONDA_VERSION)-Linux-x86_64.sh -O miniconda.sh
	bash miniconda.sh -b -p $(LOCAL)/miniconda3
	rm miniconda.sh
	ln -s $(PWD)/flake8 $(DOTCONFIG)/flake8

clean-miniconda:
	rm -rf $(LOCAL)/miniconda3 || echo "Nothing to clean for miniconda"
	rm $(DOTCONFIG)/flake8 || echo "Nothing to clean for flake8"

python-deps:
	$(LOCAL)/miniconda3/bin/pip install -Ur requirements.txt

my-python-deps:
	$(LOCAL)/miniconda3/bin/pip install -Ur prog-requirements.txt

cheat:
	wget -O - https://github.com/cheat/cheat/releases/download/$(CHEAT_VERSION)/cheat-linux-amd64.gz | gunzip > $(LOCALBIN)/cheat
	chmod +x $(LOCALBIN)/cheat
	mkdir -p $(DOTCONFIG)/cheat
	mkdir -p $(DOTCONFIG)/cheat/cheatsheets
	mkdir -p $(DOTCONFIG)/cheat/cheatsheets/personal
	ln -s $(PWD)/cheatsheets/* $(HOME)/.config/cheat/cheatsheets/personal/
	git clone https://github.com/cheat/cheatsheets $(DOTCONFIG)/cheat/cheatsheets/community
	$(LOCALBIN)/cheat --init > $(DOTCONFIG)/cheat/conf.yml

clean-cheat:
	rm $(LOCALBIN)/cheat || echo "Nothing to clean for cheat"
	rm -rf $(DOTCONFIG)/cheat || echo "Nothing to clean for cheat"


config-git:
	ln -s $(PWD)/.gitconfig $(HOME)/.gitconfig
	ln -s $(PWD)/.git-templates $(HOME)/.git-templates

clean-git:
	rm $(HOME)/.git-templates $(HOME)/.gitconfig || echo "Nothing to clean for git"


config-kitty:
	mkdir -p $(DOTCONFIG)/kitty/
	ln -s $(PWD)/kitty.conf $(DOTCONFIG)/kitty/kitty.conf
	git clone --depth 1 git@github.com:dexpota/kitty-themes.git $(DOTCONFIG)/kitty/kitty-themes
	ln -s $(DOTCONFIG)/kitty/kitty-themes/themes/Dracula.conf $(DOTCONFIG)/kitty/theme.conf

clean-kitty:
	rm -rf $(DOTCONFIG)/kitty || echo "Nothing to clean for kitty"

config-vim:
	./setup-vim

clean-vim:
	rm $(HOME)/.vimrc $(DOTCONFIG)/nvim/init.vim $(HOME)/.vim || echo "Nothing to clean for vim"

config-zsh:
	cat $(HOME)/.zshrc || echo "No zshrc found"
	rm $(HOME)/.zshrc || echo "No zshrc found"
	./setup-zsh
	chmod -R g-w,o-w $(HOME)/.oh-my-zsh/cache/completions || echo "No folder cache completions"

clean-zsh:
	rm $(HOME)/.zshrc $(HOME)/.p10k.zsh $(HOME)/.fzf.zsh $(HOME)/.taskrc || echo "Nothing to clean for zsh"
	rm -rf $(HOME)/.oh-my-zsh || echo "Nothing to clean for oh my zsh"

config-tmux:
	git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm
	ln -s $(PWD)/.tmux.conf $(HOME)/
	$(HOME)/.tmux/plugins/tpm/bin/install_plugins

clean-tmux:
	rm $(HOME)/.tmux.conf || echo "Nothing to clean for tmux"
	rm -rf $(HOME)/.tmux/plugins/tpm || echo "Nothing to clean for tmux plugins"

lsps:
	./setup-lsps

clean-lsps:
	rm $(HOME)/go/bin/gopls
	rm -rf $(HOME)/pkg/mod/golang.org/x/tools/gopls*
	npm install -g bash-language-server \
		diagnostic-languageserver \
		dockerfile-language-server-nodejs \
		vscode-langservers-extracted \
		pyright \
		typescript \
		typescript-language-server \
		yaml-language-server
	$(HOME)/opt/miniconda3/bin/pip uninstall cmake-language-server
	rm $(LOCALBIN)/clangd
	rm $(LOCALBIN)/rust-analyzer
	rm $(LOCALBIN)/texlab
	rm $(LOCALBIN)/zeta-note-linux
	rm $(LOCALBIN)/lua-language-server
	rm $(LOCAL)/sumneko_lua
