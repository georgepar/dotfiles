# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# zmodload zsh/zprof

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# If you come from bash you might have to change your $PATH.

export LANG=en_US.UTF-8
export PATH=${HOME}/opt/bin:${HOME}/.local/bin/:$PATH
export PATH=${HOME}/.cargo/bin:${PATH}
export KALDI_ROOT=${HOME}/projects/kaldi
if [ -f ${KALDI_ROOT}/tools/env.sh ]
then
    source  ${KALDI_ROOT}/tools/env.sh
    source  ${KALDI_ROOT}/tools/config/common_path.sh
    export PATH=$PWD/utils/:$KALDI_ROOT/tools/openfst/bin:$PWD:$PATH
fi
export GOROOT=${HOME}/opt/go
export GOPATH=${HOME}/go
export PATH=${GOROOT}/bin:${GOPATH}/bin:${PATH}

[ -d /usr/lib/cuda ] && export CUDA_PATH=/usr/lib/cuda/ || export CUDA_PATH=/usr/local/cuda/
export PATH=${PATH}:${CUDA_PATH}/bin
export MKLROOT=/opt/intel/mkl

# NODE_VERSION=v17.0.1
# Just need nvm for the installed utilities / LSPs
# Setting the path is enough since it adds significant delay in
# terminal loading time
# version is hardcoded & ugly but it's enough
# export PATH=${PATH}:/home/geopar/.nvm/versions/node/${NODE_VERSION}/bin

export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_DISABLE_COMPFIX=true
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
ZSH_THEME="powerlevel10k"
HYPHEN_INSENSITIVE="true"
# ENABLE_CORRECTION="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

command -v kitty > /dev/null && TERM=kitty || TERM=xterm-256color

export NVM_LAZY_LOAD=false
export NVM_COMPLETION=false

plugins=(
    # zsh-nvm
    zsh-vi-mode
    git
    colored-man-pages
    command-not-found
    copybuffer
    copydir
    copyfile
    direnv
    fancy-ctrl-z
    history
    last-working-dir
    pip
    python
    safe-paste
    sprunge
    sudo
    taskwarrior
    tmux
    web-search
    zsh-interactive-cd
)

source $ZSH/oh-my-zsh.sh

ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOSTART_ONCE=false
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOQUIT=false

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ${HOME}/opt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source ${HOME}/opt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


command -v nvim > /dev/null && export EDITOR='nvim' || export EDITOR="vim"
command -v emacs > /dev/null && export VISUAL='emacs' || export VISUAL="vim"

command -v exa > /dev/null && alias l="exa -la" || alias l="ls -alh"
command -v exa > /dev/null && alias ll="exa -la" || alias ll="ls -alh"
command -v bat > /dev/null && alias cat="bat"
command -v nvim > /dev/null && alias vim=nvim
alias ln="ln -v"
alias mkdir="mkdir -p"
alias e="$EDITOR"
alias v="$VISUAL"
command -v dust > /dev/null && alias du="dust"
command -v ranger > /dev/null && alias lf="ranger"
command -v kitty > /dev/null && alias ssh="kitty +kitten ssh"
if (command -v zoxide > /dev/null)
then
    eval "$(zoxide init zsh)"
    alias cd=z
fi

alias pacman-clean="echo 'sudo pacman -Rsn \$(pacman -Qdtq)'"
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"

alias download_playlist='youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --output "%(title)s.%(ext)s" --yes-playlist'

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

neofetch

# zprof
