function! g:SaveAndExecutePython()

    " get file path of current file
    let s:current_buffer_file_path = expand("%")
    call SetupBuffer()
    call EqualBuffer()
    " add the console output
    silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)

   execute 'resize' . line('$')

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
endfunction


function! g:LaunchDebugger()

    " get file path of current file
    let s:current_buffer_file_path = expand("%")
    call SetupBuffer()
    call FullScreenBuffer()
    silent execute 'tab' 'terminal' "python -m pudb " . shellescape(s:current_buffer_file_path, 1)
    setlocal readonly
    setlocal nomodifiable
endfunction

function! SetupBuffer()
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " save and reload current file
    silent execute "update | edit"

    let s:output_buffer_name = "python"
    " let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    " silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""
    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _
endfunction


function! FullScreenBuffer()
    setlocal noequalalways
    setlocal winheight=200
endfunction


function! EqualBuffer()
    setlocal equalalways
    setlocal winfixheight
endfunction
