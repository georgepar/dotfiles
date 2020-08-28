set nocompatible              " required
filetype off                  " required

let g:ale_completion_enabled = 0

" function! BuildYCM(info)
"     if a:info.status == 'installed' || a:info.force
"        ~/opt/anaconda3/bin/python install.py --clang-completer
"    endif
" endfunction


syntax enable
" colorscheme Monokai

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim/
" call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
" Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'neoclide/coc.nvim',  {'branch': 'release'}

" Plugin 'vim-syntastic/syntastic'
" Plugin 'nvie/vim-flake8'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'vim-airline/vim-airline'
Plug 'patstockwell/vim-monokai-tasty'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...
call plug#end()

" All of your Plugins must be added before the following line
" call vundle#end()            " required
" filetype plugin indent on    " required


" Colorscheme
let g:airline_powerline_fonts = 1
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty
let g:airline_theme='monokai_tasty'


" Various settings for better editing
set nu
set splitbelow
set splitright
set encoding=utf-8
let mapleader= " "
let python_highlight_all=1
syntax on
highlight BadWhitespace ctermbg=red guibg=darkred


" Tmux + nvim color fixes
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


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


" ALE
let g:ale_echo_msg_format = '%linter%: %s'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \    '*': ['remove_trailing_lines', 'trim_whitespace'],
    \    'javascript': ['eslint', 'prettier'],
    \    'python': ['black', 'add_blank_lines_for_python_control_statements', 'isort']
    \}


" YCM
let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_semantic_triggers = {
    \   'python': [ 're!\w{2}' ]
    \ }

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
