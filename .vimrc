set nocompatible              " required
filetype off                  " required

syntax enable
colorscheme Monokai

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set nu
set splitbelow
set splitright
set encoding=utf-8
let mapleader= " "
let python_highlight_all=1
syntax on
highlight BadWhitespace ctermbg=red guibg=darkred


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
noremap <space> za

let g:SimpylFold_docstring_preview=1

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=99
set expandtab
set autoindent
set fileformat=unix
"au BufNewFile,BufRead *.py, *.pyx set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
			\ set tabstop=2
			\| set softtabstop=2
			\| set shiftwidth=2

" Flag extra whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_semantic_triggers = {
			\   'python': [ 're!\w{2}' ]
			\ }


"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    with open(activate_this, 'r') as fd:
        code = fd.read()
    exec(code, dict(__file__=activate_this))
EOF


let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v\.(exe|so|dll)$',
			\ 'link': 'some_bad_symbolic_links',
			\ }

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

