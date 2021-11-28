. "$HOME/.cargo/env"

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

export NVIM_TUI_ENABLE_TRUE_COLOR=1
export FZF_DEFAULT_COMMAND=fd
export SKIM_DEFAULT_COMMAND=fd

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
