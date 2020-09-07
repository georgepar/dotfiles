" My vimrc
let mapleader= " "
let python_highlight_all=1
highlight BadWhitespace ctermbg=red guibg=darkred
" Enable folding
set foldmethod=indent
set foldlevel=99

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set termguicolors

" Indentation
set textwidth=99

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2

" Flag extra whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
