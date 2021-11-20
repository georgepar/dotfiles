DOTCONFIG=$(HOME)/.config
LOCAL=$(HOME)/opt
LOCALBIN=$(LOCAL)/bin
CHEAT_VERSION=4.0.4
CHEAT_BINARY=$(LOCALBIN)/cheat
GO_VERSION=1.17.2
MINICONDA_VERSION=4.10.3


.ONESHELL:

all: deps configall my-python-deps
deps: must-have-deps nice-to-have-deps
system-deps: basic-system-deps extra-system-deps
must-have-deps: initialize n fzf config-refs lsps shellcheck miniconda rust go nvim python-deps config-stow
nice-to-have-deps: rust-utils cheat glow doom-emacs

config: config-zsh config-tmux config-vim

clean: clean-lsps clean-nvim clean-zsh clean-git clean-cheat clean-tmux clean-local clean-rust clean-stow

initialize:
	mkdir -p $(HOME)/.local/share/fonts
	mkdir -p $(LOCALBIN)

shellcheck:
	wget https://github.com/koalaman/shellcheck/releases/download/stable/shellcheck-stable.linux.x86_64.tar.xz
	tar xvf shellcheck-stable.linux.x86_64.tar.xz
	mv shellcheck-stable/shellcheck $(LOCALBIN)/shellcheck
	chmod +x $(LOCALBIN)/shellcheck
	rm -r shellcheck-stable shellcheck-stable.linux.x86_64.tar.xz

go:
	wget -qO- https://dl.google.com/go/go$(GO_VERSION).linux-amd64.tar.gz | tar xzv -C $(LOCAL)/

glow:
	wget https://github.com/charmbracelet/glow/releases/download/v1.4.1/glow_1.4.1_linux_x86_64.tar.gz -O /tmp/glow.tar.gz
	cd /tmp && tar xvf glow.tar.gz && mv glow $(LOCALBIN)/ && rm glow.tar.gz && cd -

obsidian:
	wget https://github.com/obsidianmd/obsidian-releases/releases/download/v0.12.19/Obsidian-0.12.19.AppImage -O $(LOCALBIN)/obsidian
	chmod +x $(LOCALBIN)/obsidian

rust:
	curl https://sh.rustup.rs -sSf | sh -s -- -y

nvim:
	wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -O $(LOCALBIN)/nvim || wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -O $(LOCALBIN)/nvim
	chmod +x $(LOCALBIN)/nvim

fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git $(LOCAL)/fzf
	$(LOCAL)/fzf/install --all --no-fish
	ln -s $(LOCAL)/fzf/bin/fzf $(LOCALBIN)/
	ln -s $(LOCAL)/fzf/bin/fzf-tmux $(LOCALBIN)/

basic-system-deps:
	pacman -S git curl wget base base-devel cmake unzip tmux awesome xterm stow

extra-system-deps:
	pacman -S git-lfs imagemagick alacritty ffmpeg sox isync msmtp pass emacs
	yay -S direnv mu mu-wizard-git

doom-emacs:
	git clone --depth 1 https://github.com/hlissner/doom-emacs $(HOME)/.emacs.d
	$(HOME)/.emacs.d/bin/doom install
	$(HOME)/.emacs.d/bin/doom sync

rust-utils:
	$(HOME)/.cargo/bin/cargo install du-dust fd-find exa ripgrep git-delta bat procs grex cargo-cache
	curl -sS https://webinstall.dev/zoxide | bash
	wget https://github.com/dbrgn/tealdeer/releases/download/v1.4.1/tldr-linux-x86_64-musl -O $(LOCALBIN)/tldr
	chmod +x $(LOCALBIN)/tldr
	$(HOME)/.cargo/bin/cargo cache -a

n:
	curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o $(LOCALBIN)/n
	N_PREFIX=$(LOCAL) bash $(LOCALBIN)/n latest

miniconda:
	wget https://repo.anaconda.com/miniconda/Miniconda3-py38_$(MINICONDA_VERSION)-Linux-x86_64.sh -O miniconda.sh
	bash miniconda.sh -b -p $(LOCAL)/miniconda3
	rm miniconda.sh

python-deps:
	$(LOCAL)/miniconda3/bin/pip install -Ur .scripts/requirements.txt

my-python-deps:
	$(LOCAL)/miniconda3/bin/pip install -Ur .scripts/prog-requirements.txt

cheat:
	wget -O - https://github.com/cheat/cheat/releases/download/$(CHEAT_VERSION)/cheat-linux-amd64.gz | gunzip > $(LOCALBIN)/cheat
	chmod +x $(LOCALBIN)/cheat
	mkdir -p $(DOTCONFIG)/cheat
	mkdir -p $(DOTCONFIG)/cheat/cheatsheets
	git clone https://github.com/cheat/cheatsheets $(DOTCONFIG)/cheat/cheatsheets/community
	$(LOCALBIN)/cheat --init > $(DOTCONFIG)/cheat/conf.yml

config-refs:
	mkdir $(HOME)/bib
	git clone https://github.com/citation-style-language/styles $(HOME)/bib/styles

config-vim:
	./.scripts/setup-vim

config-zsh:
	./.scripts/setup-zsh
	chmod -R g-w,o-w $(HOME)/.oh-my-zsh/cache/completions || echo "No folder cache completions"

config-tmux:
	git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm
	$(HOME)/.tmux/plugins/tpm/bin/install_plugins

config-stow:
	stow .

lsps:
	./.scripts/setup-lsps

clean-cheat:
	rm $(LOCALBIN)/cheat || echo "Nothing to clean for cheat"
	rm -rf $(DOTCONFIG)/cheat || echo "Nothing to clean for cheat"

clean-stow:
	stow -D .

clean-rust:
	rm -rf $(HOME)/.cargo || echo "Nothing to clean for cargo"

clean-local:
	rm -rf $(LOCAL) || echo "Cannot remove ~/opt"

clean-tmux:
	rm -rf $(HOME)/.tmux/plugins/tpm || echo "Nothing to clean for tmux plugins"

clean-zsh:
	rm -rf $(HOME)/.oh-my-zsh || echo "Nothing to clean for oh my zsh"

clean-nvim:
	rm -rf $(HOME)/.local/share/nvim/* || echo "Nothing to clean for nvim"

clean-lsps:
	rm $(HOME)/go/bin/gopls || echo "Nothing to clean for gopls"
	rm -rf $(HOME)/pkg/mod/golang.org/x/tools/gopls* || echo "Nothing to clean for gopls"
	npm uninstall -g bash-language-server \
		diagnostic-languageserver \
		dockerfile-language-server-nodejs \
		vscode-langservers-extracted \
		pyright \
		typescript \
		typescript-language-server \
		yaml-language-server
	$(HOME)/opt/miniconda3/bin/pip uninstall cmake-language-server
	rm $(LOCALBIN)/clangd || echo "Nothing to clean for clangd"
	rm $(LOCALBIN)/rust-analyzer || echo "Nothing to clean for rust-analyzer"
	rm $(LOCALBIN)/texlab || echo "Nothing to clean for texlab"
	rm $(LOCALBIN)/zeta-note-linux || echo "Nothing to clean for zeta note"
	rm $(LOCALBIN)/lua-language-server || echo "Nothing to clean for lua-language-server"
	rm $(LOCAL)/sumneko_lua || echo "Nothing to clean fro sumneko_lua"
