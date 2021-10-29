vim.g.python_highlight_all = 1
vim.o.ttimeout = true
vim.o.ttimeoutlen = 200
vim.o.termguicolors = true
vim.o.textwidth = 0
vim.o.wrapmargin = 0

-- Switch formatting for different set of files
vim.api.nvim_command([[
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2
]])

vim.cmd([[
augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END
]])

vim.cmd([[autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>]])

vim.cmd([[autocmd VimEnter * colorscheme doom-one]])
-- vim.cmd[[autocmd VimEnter * colorscheme dracula]]

vim.g.mapleader = " "
