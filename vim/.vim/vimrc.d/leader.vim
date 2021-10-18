function! s:print_err(msg) abort
  execute 'normal! \<Esc>'
  echohl ErrorMsg
  echomsg a:msg
  echohl None
endfunction

function! s:dispatch(...) abort
  let cmd = printf('call CocAction("%s")', a:1)
  execute cmd
endfunction

function! s:find_references() abort
  call s:dispatch('jumpReferences')
endfunction

function! s:show_documentation() abort
  call s:dispatch('doHover')
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call s:dispatch('doHover')
  endif
endfunction

function! s:show_signature() abort
  call s:dispatch('showSignatureHelp')
endfunction

function! s:format_code() abort
  if exists(':ALEFix')
    ALEFix
  endif
endfunction

function! s:goto_implementation() abort
  call s:dispatch('jumpImplementation')
endfunction


function! NextHunkAllBuffers()
  let line = line('.')
  GitGutterNextHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bnext
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      1
      GitGutterNextHunk
      return
    endif
  endwhile
endfunction

function! PrevHunkAllBuffers()
  let line = line('.')
  GitGutterPrevHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bprevious
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! G
      GitGutterPrevHunk
      return
    endif
  endwhile
endfunction

nnoremap <silent> <Leader>q  :q<CR>
nnoremap <silent> <Leader>Q  :qa!<CR>

" Open shell in vim
if has('nvim') || has('terminal')
  map <silent> <Leader>' :terminal<CR>
else
  map <silent> <Leader>' :shell<CR>
endif


let g:which_key_map = {}

" Window shortcuts. Defined in vim-better-default
let g:which_key_map['w'] = {
    \ 'name' : '+windows' ,
    \ 'w' : ['<C-W>w'     , 'next-split']            ,
    \ 'r' : ['<C-W>r'     , 'rotate-right']          ,
    \ 'd' : ['<C-W>c'     , 'delete-window']         ,
    \ 'q' : ['<C-W>wq'    , 'close-save-split']      ,
    \ 'j' : ['<C-W>j'     , 'window-below']          ,
    \ 'k' : ['<C-W>k'     , 'window-up']             ,
    \ 'h' : ['<C-W>h'     , 'window-left']           ,
    \ 'l' : ['<C-W>l'     , 'window-right']          ,
    \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
    \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
    \ 'J' : [':resize +5' , 'expand-window-below']   ,
    \ 'K' : [':resize -5' , 'expand-window-up']      ,
    \ '=' : ['<C-W>='     , 'balance-window']        ,
    \ 's' : ['<C-W>s'     , 'split-window-below']    ,
    \ '-' : ['<C-W>s'     , 'split-window-below']    ,
    \ '|' : ['<C-W>v'     , 'split-window-right']    ,
    \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
    \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
    \ '?' : ['Windows'    , 'fzf-window']            ,
    \ }


" vim-commentary shortcuts
nmap <silent> <leader>/c gc
nmap <silent> <leader>// gcc

let g:which_key_map['/'] = {
    \ 'name' : '+comment' ,
    \ '/' : 'comment-line' ,
    \ 'c' : 'comment-verb' ,
    \ }


" auxiliary stuff
nnoremap <silent> <leader>at :NERDTreeToggle<CR>
nnoremap <silent> <Leader>ap :setlocal paste!<CR>
nnoremap <silent> <Leader>ao gx

let g:which_key_map['a'] = {
    \ 'name' : '+auxiliary'   ,
    \ 'p' : 'toggle-paste'    ,
    \ 't' : 'toggle-nerdtree' ,
    \ 'o' : 'open-link'       ,
    \ }


" coc shortcuts
nmap <silent> <leader>ch :call <SID>show_documentation()<CR>
nmap <silent> <leader>cr <Plug>(coc-rename)
nmap <silent> <leader>cg <Plug>(coc-definition)
nmap <silent> <leader>cR :call <SID>find_references()<CR>
nmap <silent> <leader>ci :call <SID>goto_implementation()<CR>
nmap <silent> <leader>cf :call <SID>format_code()<CR>
nmap <silent> <leader>cs :call <SID>show_signature()<CR>
nmap <silent> <leader>cc :call g:SaveAndExecutePython()<CR>
nnoremap <silent> <leader>cz :set foldlevel=0<CR>
nnoremap <silent> <leader>cZ :set foldlevel=100<CR>

let g:which_key_map['c'] = {
    \ 'name' : '+code' ,
    \ 'c' : 'execute-python'  ,
    \ 'h' : 'show-documentation'  ,
    \ 's' : 'show-signature'  ,
    \ 'r' : 'rename-variable'     ,
    \ 'g' : 'goto-definition'     ,
    \ 'i' : 'goto-implementation' ,
    \ 'R' : 'find-references'     ,
    \ 'f' : 'format-code'         ,
    \ 'z' : 'fold-code-(zip)'     ,
    \ 'Z' : 'unfold-code-(unzip)' ,
    \ }


nmap <Leader>en <Plug>(ale_next)
nmap <Leader>ep <Plug>(ale_previous)

let g:which_key_map['e'] = {
    \ 'name' : '+error' ,
    \ 'p' : 'previous-error' ,
    \ 'n' : 'next-error'     ,
    \ }


"  buffer shortcuts. Defined in vim-better-default
nnoremap <silent> <Leader>bc :tabnew<CR>

let g:which_key_map['b'] = {
    \ 'name' : '+buffer' ,
    \ 'p' : [':bprevious' , 'previous-buffer'] ,
    \ 'c' : [':tabnew'    , 'create-buffer']   ,
    \ 'n' : [':bnext'     , 'next-buffer']     ,
    \ 'f' : [':bfirst'    , 'first-buffer']    ,
    \ 'l' : [':blast'     , 'last-buffer']     ,
    \ 'd' : [':bd'        , 'delete-buffer']   ,
    \ 'k' : [':bw'        , 'kill-buffer']     ,
    \ }


" Version control
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gC :BCommits<CR>
nnoremap <silent> <Leader>gf :GFiles<CR>
nnoremap <silent> <Leader>gc :Git commit -sv<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>ge :Gedit<CR>
nnoremap <silent> <Leader>gl :Glog<CR>
nnoremap <silent> <Leader>gu :GitGutterUndoHunk<CR>
nnoremap <silent> <Leader>ga :GitGutterStageHunk<CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gP :Git pull<CR>
nnoremap <silent> <Leader>gp :Git push<CR>

let g:which_key_map['g'] = {
      \ 'name' : '+git/version-control' ,
      \ 'b' : 'fugitive-blame'             ,
      \ 'c' : 'commits-for-current-buffer' ,
      \ 'C' : 'fugitive-commit'            ,
      \ 'd' : 'fugitive-diff'              ,
      \ 'f' : 'fzf-git-files'              ,
      \ 'e' : 'fugitive-edit'              ,
      \ 'l' : 'fugitive-log'               ,
      \ 'r' : 'fugitive-read'              ,
      \ 's' : 'fugitive-status'            ,
      \ 'p' : 'fugitive-push'              ,
      \ 'P' : 'fugitive-pull'              ,
      \ 'u' : 'undo-hunk'                  ,
      \ 'a' : 'stage-hunk'                 ,
      \ }


nnoremap <silent> <leader>ff :Files<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fc :Commits<CR>
nmap <leader>fC :BCommits<CR>
nmap <leader>ft :BTags<CR>
nmap <leader>fT :Tags<CR>
nmap <leader>fr :RG<CR>
nmap <leader>fR :Rg<CR>
nmap <leader>fg :GFiles<CR>
nmap <leader>fG :GFiles?<CR>
nmap <leader>fh :History/<CR>
nmap <leader>fH :History<CR>
nmap <leader>fw :Windows<CR>


let g:which_key_map['f'] = {
      \ 'name' : '+fzf-search'             ,
      \ 'b' : 'search-buffers'             ,
      \ 'f' : 'search-files'               ,
      \ 'c' : 'show-commits'               ,
      \ 'C' : 'show-buffer-commits'        ,
      \ 't' : 'show-buffer-ctags'          ,
      \ 'T' : 'show-project-ctags'         ,
      \ 'r' : 'search-project-interactive' ,
      \ 'R' : 'search-project'             ,
      \ 'g' : 'git-ls-files'               ,
      \ 'G' : 'git-status'                 ,
      \ 'h' : 'search-history'             ,
      \ 'H' : 'open-recent'                ,
      \ 'w' : 'open-windows'               ,
      \ }

nmap <leader>[ :call NextHunkAllBuffers()<CR>
nmap <leader>] :call PrevHunkAllBuffers()<CR>

let g:which_key_map['['] = 'previous-hunk'
let g:which_key_map[']'] = 'next-hunk'


nmap <leader>db :call ToggleBreakPoint()<CR>
nmap <leader>dc :call ConditionalBreakPoint()<CR>
nmap <leader>dd :call g:LaunchDebugger()<CR>

let g:which_key_map['d'] = {
      \ 'name' : '+pudb-debug'             ,
      \ 'b' : 'toggle-breakpoint'          ,
      \ 'c' : 'conditional-breakpoint'     ,
      \ 'd' : 'run-debugger'               ,
      \ }



autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
" Put which key remap here
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500
