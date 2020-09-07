let g:ale_completion_enabled = 0

call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/RltvNmbr.vim'
Plug 'liuchengxu/vim-better-default'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!']  }
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
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

let g:vim_better_default_fold_key_mapping = 0
let g:vim_better_default_file_key_mapping = 0
let g:vim_better_default_basic_key_mapping = 0
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline_powerline_fonts = 1

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

" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = {
"     \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"     \ 'file': '\v\.(exe|so|dll)$',
"     \ 'link': 'some_bad_symbolic_links',
"     \ }

" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:coc_snippet_next = '<tab>'
autocmd VimEnter * RainbowLoad
