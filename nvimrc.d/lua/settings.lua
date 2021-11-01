vim.o.ttimeout = true
vim.o.ttimeoutlen = 200
vim.o.wrapmargin = 0
vim.o.formatoptions = "croqnlt"
vim.o.report = 0
-- see vim-better-default
vim.o.shortmess = "atOI"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolljump = 5
vim.o.scrolloff = 3
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.autowrite = true
vim.o.hidden = true

vim.o.wrap = false
vim.o.ruler = true
vim.o.showcmd = true
vim.o.showmode = true
vim.o.showmatch = true
vim.o.matchtime = 5
vim.o.linespace = 0
vim.o.pumheight = 40
vim.o.expandtab = true
vim.o.winminheight = 0
vim.o.background = "dark"
vim.o.termguicolors = true
vim.o.textwidth = 0

vim.o.whichwrap = "b,s,<,>,h,l"
vim.o.fileencoding = "utf-8"

vim.o.foldenable = true
vim.o.foldlevel = 0
vim.o.foldmethod = "marker"
vim.o.foldlevelstart = 99
vim.o.cursorline = true
vim.o.fileformats = "unix,dos,mac"
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus,unnamed"
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.undoreload = 10000

vim.cmd([[command! W w !sudo tee % > /dev/null]])

vim.cmd([[highlight clear SignColumn]])

vim.cmd([[
    set t_Co=256
    set t_ut=nil

]])

vim.g.python_highlight_all = 1

vim.cmd([[
    if exists('$TMUX') && $TERM != 'xterm-kitty'
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    endif
]])

-- Switch formatting for different set of files
vim.api.nvim_command([[
au BufNewFile,BufRead *.html, *.css
    \ set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2
]])

if vim.fn.getenv("NVIM_RUNNING_FIRST_TIME_SETUP") == vim.NIL then
	vim.cmd([[autocmd VimEnter * colorscheme doom-one]])
	-- vim.g.material_style = "palenight"
	-- vim.cmd([[autocmd VimEnter * colorscheme material]])

	vim.cmd([[
    augroup Format
        autocmd!
        autocmd BufWritePost * FormatWrite
    augroup END
    ]])
	vim.cmd([[autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>]])

	-- For some reason neogit & autopairs are not loaded by default
	vim.cmd([[autocmd VimEnter * :PackerLoad neogit]])
	vim.cmd([[autocmd VimEnter * :PackerLoad nvim-autopairs]])
end

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

vim.g.mapleader = " "
