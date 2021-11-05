# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# zmodload zsh/zprof
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# If you come from bash you might have to change your $PATH.
export PATH=${HOME}/opt/bin:${HOME}/.local/bin/:$PATH
export PATH=${HOME}/.cargo/bin:${PATH}
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_DISABLE_COMPFIX=true

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k"
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#TERM=xterm-256color
command -v kitty > /dev/null && TERM=kitty || TERM=xterm-256color


export NVM_LAZY_LOAD=true
export NVM_COMPLETION=false

plugins=(
    zsh-nvm
    git
    alias-finder
    autopep8
    catimg
    colored-man-pages
    colorize
    command-not-found
    copybuffer
    copydir
    copyfile
    direnv
    extract
    fancy-ctrl-z
    git-extras
    git-prompt
    gitignore
    history
    jsontools
    last-working-dir
    magic-enter
    percol
    pep8
    pip
    pylint
    python
    safe-paste
    sprunge
    sudo
    taskwarrior
    timer
    tmux
    web-search
    zsh-interactive-cd
    zsh-navigation-tools
)

source $ZSH/oh-my-zsh.sh

ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOSTART_ONCE=false
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOQUIT=false

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

command -v nvim > /dev/null && export EDITOR='nvim' || export EDITOR="vim"
command -v nvim > /dev/null && export VISUAL='nvim' || export VISUAL="vim"
# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#     export EDITOR='vim'
# else
#     export EDITOR='code'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

command -v exa > /dev/null && alias l="exa -la" || alias l="ls -alh"
command -v exa > /dev/null && alias ll="exa -la" || alias ll="ls -alh"
command -v bat > /dev/null && alias cat="bat"
alias ln="ln -v"
alias mkdir="mkdir -p"
alias e="$EDITOR"
alias v="$VISUAL"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

command -v nvim > /dev/null && alias vim=nvim

export NVIM_TUI_ENABLE_TRUE_COLOR=1

[ -d /usr/lib/cuda ] && export CUDA_PATH=/usr/lib/cuda/ || export CUDA_PATH=/usr/local/cuda/

export PATH=${PATH}:${CUDA_PATH}/bin

export MKLROOT=/opt/intel/mkl

export GOROOT=${HOME}/opt/go
export GOPATH=${HOME}/go
export PATH=${GOROOT}/bin:${GOPATH}/bin:${PATH}


lazy_conda_aliases=('python' 'conda')

load_conda() {
  for lazy_conda_alias in $lazy_conda_aliases
  do
    unalias $lazy_conda_alias
  done

  __conda_prefix="$HOME/opt/miniconda3" # Set your conda Location

  # >>> conda initialize >>>
  __conda_setup="$("$__conda_prefix/bin/conda" 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "$__conda_prefix/etc/profile.d/conda.sh" ]; then
          . "$__conda_prefix/etc/profile.d/conda.sh"
      else
          export PATH="$__conda_prefix/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<

  unset __conda_prefix
  unfunction load_conda
}

for lazy_conda_alias in $lazy_conda_aliases
do
  alias $lazy_conda_alias="load_conda && $lazy_conda_alias"
done


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/geopar/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/geopar/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/geopar/opt/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/geopar/opt/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<
#
#
#
export KALDI_ROOT=${HOME}/projects/kaldi
if [ -f ${KALDI_ROOT}/tools/env.sh ]
then
    source  ${KALDI_ROOT}/tools/env.sh
    source  ${KALDI_ROOT}/tools/config/common_path.sh
    export PATH=$PWD/utils/:$KALDI_ROOT/tools/openfst/bin:$PWD:$PATH
fi

command -v dust > /dev/null && alias du="dust"
command -v ranger > /dev/null && alias lf="ranger"
command -v kitty > /dev/null && alias ssh="kitty +kitten ssh"

[ -f ${HOME}/opt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source ${HOME}/opt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# [ -f ${HOME}/opt/bin/colorscript ] && colorscript -e space-invaders

[ -f ${HOME}/opt/zsh-syntax-highlighting.git/zsh-syntax-highlighting.zsh ] && source ${HOME}/opt/zsh-syntax-highlighting.git/zsh-syntax-highlighting.zsh

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

if [ -f ${HOME}/.local/bin/zoxide ]
then
     eval "$(zoxide init zsh)"
     alias cd=z
fi

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}"  ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh" # This loads nvm



# zprof
