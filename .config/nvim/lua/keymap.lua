M = {}

M.setup = function()
	local map = vim.api.nvim_set_keymap
	map("n", "Q", "q", { noremap = true })
	map("n", "q", "<Nop>", { noremap = true })
	map("n", "qq", ":q<CR>", { noremap = true, silent = true })
	map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
	map("n", ",v", ":vs<space>", { noremap = true })
	map("n", ",b", ":tabnew<space>", { noremap = true })
	map("n", ",n", ":split<space>", { noremap = true })
	map("n", "H", "^", { noremap = true })
	map("n", "L", "$", { noremap = true })
	map("n", "U", "<C-r>", { noremap = true })
	map("n", "<C-F>", "za", { noremap = true })
	map("n", "J", ":MoveLine(1)<CR>=gv", { noremap = true, silent = true })
	map("n", "K", ":MoveLine(-1)<CR>=gv", { noremap = true, silent = true })

	map("i", "<Tab>", [[pumvisible() ? '<C-n>' : '<Tab>']], { silent = true, expr = true }) -- next selection on autocomplete menu
	map("i", "<S-Tab>", [[pumvisible() ? '<C-p>' : '<S-Tab>']], { silent = true, expr = true }) -- previous selection on autocomplete menu
	map("i", "<M-h>", "<Left>", { noremap = true })
	map("i", "<M-l>", "<Right>", { noremap = true })
	map("i", "<M-j>", "<Down>", { noremap = true })
	map("i", "<M-k>", "<Up>", { noremap = true })
	map("i", "<C-a>", "<Home>", { noremap = true })
	map("i", "<C-e>", "<End>", { noremap = true })
	-- map("i", "kj", "<Esc><Right>", { noremap = true })
	-- map("i", "jk", "<Esc><Right>", { noremap = true })

	map("c", "<M-h>", "<Left>", { noremap = true })
	map("c", "<M-l>", "<Right>", { noremap = true })
	map("c", "<M-j>", "<Down>", { noremap = true })
	map("c", "<M-k>", "<Up>", { noremap = true })
	map("c", "<C-a>", "<Home>", { noremap = true })
	map("c", "<C-e>", "<End>", { noremap = true })
	-- map("c", "kj", "<C-c>", { noremap = true })
	-- map("c", "jk", "<C-c>", { noremap = true })

	map("v", "v", "<Esc>", { noremap = true })
	map("v", "J", ":MoveBlock(1)<CR>=gv", { noremap = true, silent = true })
	map("v", "K", ":MoveBlock(-1)<CR>=gv", { noremap = true, silent = true })

	-- vim-better-default
	map("v", "<", "<gv", { noremap = true })
	map("v", ">", ">gv", { noremap = true })
end

M.leaderkm = {}
M.leaderkm.git = {
	["g"] = {
		name = "+git",
		["g"] = { ":Neogit<cr>", "neogit" },
		["d"] = { ":DiffviewOpen<cr>", "git-diff" },
		["D"] = { ":DiffviewOpen master<cr>", "git-diff-master" },
		["l"] = { ":Neogit log<cr>", "git-log" },
		["p"] = { ":Neogit pull<cr>", "git-pull" },
		["P"] = { ":Neogit push<cr>", "git-push" },
		["s"] = { '<cmd>lua require"gitsigns".stage_hunk()<CR>', "stage-hunk" },
		["u"] = { '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', "unstage-hunk" },
		["r"] = { '<cmd>lua require"gitsigns".reset_hunk()<CR>', "reset-hunk" },
		["R"] = { '<cmd>lua require"gitsigns".reset_buffer()<CR>', "reset-buffer" },
		["v"] = { '<cmd>lua require"gitsigns".preview_hunk()<CR>', "preview-hunk" },
		["b"] = { '<cmd>lua require"gitsigns".blame_line(true)<CR>', "blame-line" },
		["S"] = { '<cmd>lua require"gitsigns".stage_buffer()<CR>', "stage-buffer" },
		["U"] = { '<cmd>lua require"gitsigns".reset_buffer_index()<CR>', "reset-buffer" },
	},
}

M.leaderkm.gitvisual = {
	["g"] = {
		["s"] = { "stage-hunk" },
		["r"] = { "reset-hunk" },
	},
}

M.leaderkm.code = {
	["c"] = {
		name = "+code",
		["H"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "hover-text" },
		["d"] = { ":Telescope lsp_definitions<cr>", "find-definitions" },
		["r"] = { ":Telescope lsp_references<cr>", "find-references" },
		["D"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "goto-declaration" },
		["i"] = { ":Telescope lsp_implementations<cr>", "find-implementations" },
		["h"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "signature-help" },
		["E"] = { ":Trouble lsp_workspace_diagnostics<cr>", "workspace-diagnostics" },
		["e"] = { ":Trouble lsp_document_diagnostics<cr>", "document-diagnostics" },
		["a"] = { ":Telescope lsp_code_actions<cr>", "code-actions" },
		["R"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		["t"] = { ":Telescope lsp_type_definitions<cr>", "type-definitions" },
		["s"] = { ":SymbolsOutline<cr>", "document-symbols" },
		["S"] = { ":Telescope lsp_workspace_symbols<cr>", "workspace-symbols" },
		["q"] = { ":Trouble quickfix<cr>", "quickfix" },
		["l"] = { ":Trouble loclist<cr>", "location-list" },
		["x"] = { ":<cmd>lua require'sniprun'.run('v')<cr>", "run-snippet" },
		["p"] = { "peek-definition-function" }, -- Defined by treesitter-textobjects
		["P"] = { "peek-definition-class" }, -- Defined by treesitter-textobjects
	},
}

M.leaderkm.session = {
	["s"] = {
		name = "+session",
		["s"] = { '<cmd>lua require("persistence").load()<cr>', "restore-curr-dir-session" },
		["l"] = { '<cmd>lua require("persistence").load({ last = true })<cr>', "restore-last-session" },
	},
}
M.leaderkm.telescope = {
	["f"] = {
		name = "+find",
		["B"] = { ":Telescope buffers<cr>", "buffers" },
		["b"] = { ":Telescope current_buffer_fuzzy_find<cr>", "current-buffer" },
		["m"] = { ":Telescope man_pages<cr>", "man-pages" },
		["f"] = { ":Telescope find_files<cr>", "files" },
		["F"] = { ":Telescope file_browser<cr>", "file-browser" },
		["c"] = { ":Telescope git_commits<cr>", "commits" },
		["C"] = { ":Telescope git_bcommits<cr>", "buffer-commits" },
		["s"] = { ":Telescope git_status<cr>", "modified-files" },
		["t"] = { ":Telescope treesitter<cr>", "treesitter" },
		["x"] = { ":Telescope command_history<cr>", "command-history" },
		["/"] = { ":Telescope live_grep<cr>", "grep" },
		["y"] = { ":Telescope registers<cr>", "recent-yanks" },
		["H"] = { ":Telescope help_tags<cr>", "recent-files" },
		["h"] = { ":Telescope search_history<cr>", "search-history" },
		["g"] = { ":Telescope git_files<cr>", "git-files" },
	},
}

M.leaderkm.dashboard = {
	["s"] = {
		name = "+start",
		["l"] = { '<cmd>lua require("persistence").load()<cr>', "restore-current-dir-session" },
		["L"] = { '<cmd>lua require("persistence").load({ last = true })<cr>', "restore-last-session" },
		["h"] = { ":DashboardFindHistory<CR>", "recent-files" },
		["o"] = { ":DashboardFindFile<CR>", "open-file" },
		["n"] = { ":DashboardNewFile<CR>", "new-file" },
		["/"] = { ":DashboardFindWord<CR>", "find-word" },
		["c"] = { ":DashboardChangeColorscheme<CR>", "change-colorscheme" },
		["b"] = { ":DashboardJumpMark<CR>", "jump-bookmark" },
	},
}

M.leaderkm.magma = {
	["j"] = {
		name = "+jupyter",
		["p"] = { ":MagmaShowOutput<CR>", "print-output" },
		["c"] = { ":MagmaReevaluateCell<CR>", "evaluate-cell-again" },
		["j"] = { ":MagmaEvaluateLine<CR>", "evaluate-line" },
		["s"] = { ":MagmaInit<CR>", "start-jupyter-client" },
	},
}

M.leaderkm.magma_x = {
	["j"] = {
		name = "+jupyter",
		["j"] = { ":<C-u>MagmaEvaluateVisual<CR>", "evaluate-visual" },
	},
}

M.leaderkm.base = {
	["<leader>"] = { "<nop>", "leave-pane" },
	["q"] = {
		name = "+quit",
		["q"] = { ":qa!<cr>", "quit-all" },
		["w"] = { ":wqa!<cr>", "write-quit-all" },
	},
	["/"] = {
		name = "+comment",
		["/"] = { ":Commentary<cr>", "comment-line" },
	},
	["p"] = { ":setlocal paste!<cr>", "set-paste" },
	["t"] = { ":toggleterm<cr>", "terminal" },
	["b"] = {
		name = "+buffer",
		["p"] = { ":bprevious<CR>", "previous" },
		["n"] = { ":bnext<CR>", "next" },
		["f"] = { ":bfirst<CR>", "first" },
		["l"] = { ":blast<CR>", "last" },
		["d"] = { ":bd<CR>", "delete" },
		["D"] = { ":bd!<CR>", "delete!" },
		["/"] = { ":Telescope buffers<cr>", "buffers" },
	},
	["w"] = {
		name = "+window",
		["w"] = { "<C-W>w", "switch" },
		["s"] = { "<C-W>s", "horizontal-split" },
		["v"] = { "<C-W>v", "vertical-split" },
		["q"] = { "<C-W>q", "quit" },
		["="] = { "<C-W>=", "resize-equal" },
		["H"] = { "<C-W>H", "make-primary" },
		["f"] = { "<C-W>T", "focus" },
		["F"] = { "<C-W>q", "unfocus" }, -- todo: use this https://github.com/gitusp/yanked-buffer/blob/master/plugin/yanked-buffer.vim
		["o"] = { "<C-W>o", "make-only" },
		["j"] = { "<C-W>j", "down" },
		["k"] = { "<C-W>k", "up" },
		["h"] = { "<C-W>h", "left" },
		["l"] = { "<C-W>l", "right" },
		[">"] = { ':exe "resize " . --[[ --[[ (winwidth(0) * 3/2) ]] ]]<CR>', "increase-width" },
		["<"] = { ':exe "resize " . (winwidth(0) * 2/3)<CR>', "decrease-width" },
		["+"] = { ':exe "resize " . (winheight(0) * 3/2)<CR>', "increase-height" },
		["-"] = { ':exe "resize " . (winheight(0) * 2/3)<CR>', "decrease-height" },
	},
}

return M
