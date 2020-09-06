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

let g:ale_completion_enabled = 0

call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/RltvNmbr.vim'
Plug 'liuchengxu/vim-better-default'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!']  }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'frazrepo/vim-rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim',  {'branch': 'stable'}
Plug 'arcticicestudio/nord-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'

call plug#end()

set statusline^=%{coc#status()}
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline_powerline_fonts = 1


" Colorscheme
colorscheme nord
let g:airline_theme = 'nord'

let g:SimpylFold_docstring_preview=1

" ALE
let g:ale_echo_msg_format = '%linter%: %s'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \    '*': ['remove_trailing_lines', 'trim_whitespace'],
    \    'javascript': ['eslint', 'prettier'],
    \    'python': ['black', 'add_blank_lines_for_python_control_statements', 'isort']
    \}

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

let g:which_key_map = {}

autocmd! User vim-which-key call which_key#register(',', 'g:which_key_map')

 nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500


nnoremap Q q
nnoremap q <Nop>

nnoremap <silent> qq :q<cr>
nnoremap <silent> <C-s> :w<cr>
nnoremap <silent> wq :wqa! <cr>
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>
nmap <silent> <leader>r <Plug>(coc-rename)

function! s:show_documentation()
    if &filetype == 'vim'
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

nnoremap <silent> <C-F> za
nmap <silent> <leader>g <Plug>(coc-definition)

nnoremap <silent> <C-t> :NERDTreeToggle<CR>

nmap <silent> <leader>/ gcc

nnoremap ,v :vs<space>
nnoremap ,b :tabnew<space>
nnoremap ,n :split<space>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

let g:coc_snippet_next = '<tab>'

autocmd VimEnter * RainbowLoad
