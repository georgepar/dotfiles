local M = {}

-- nvim-autopairs configuration
M.autopairs = function()
	require("nvim-autopairs").setup({
		check_ts = true,
		enable_afterquote = true,
		enable_moveright = true,
		enable_check_bracket_line = true,
	})
end

--  vim-better-default configuration
M.better_default = function()
	vim.g.vim_better_default_fold_key_mapping = 0
	vim.g.vim_better_default_file_key_mapping = 0
	vim.g.vim_better_default_basic_key_mapping = 0
	vim.g.vim_better_default_buffer_key_mapping = 1
	vim.g.vim_better_default_window_key_mapping = 1
end

-- bufferline.nvim configuration
M.bufferline = function()
	require("bufferline").setup({
		options = {
			numbers = function(opts)
				return string.format("%s", opts.id)
			end,
			indicator_icon = "▎",
			buffer_close_icon = "", -- "",
			modified_icon = "●",
			close_icon = "", -- "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 20,
			max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
			tab_size = 25,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diagnostics_dict, _)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and "  " or (e == "warning" and "  " or "  ")
					s = s .. n .. sym
				end
				return s
			end,
			-- NOTE: this will be called a lot so don't do any heavy processing here
			custom_filter = function(buf_number)
				if vim.bo[buf_number].filetype ~= "dashboard" then
					return true
				end
			end,
			offsets = {
				{
					filetype = "Outline",
					text = "Symbols",
					text_align = "center",
				},
				{
					filetype = "packer",
					text = "Plugins manager",
					text_align = "center",
				},
			},
			show_buffer_icons = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			show_tab_indicators = true,
			persist_buffer_sort = true,
			separator_style = "thick",
			enforce_regular_tabs = true,
			always_show_bufferline = false,
			sort_by = "directory",
		},
	})
end

M.cmp = function()
	vim.g.completeopt = "menu,menuone,noselect"
	local luasnip = require("luasnip")
	local cmp = require("cmp")
	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	cmp.setup({
		-- experimental = {
		-- 	-- ghost_text = true,
		-- 	active_preview = true,
		-- },
		completion = {
			autocomplete = true,
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "path" },
			{ name = "nvim_lua" },
			{ name = "cmdline" },
			{ name = "latex_symbols" },
			{ name = "luasnip" }, -- For luasnip users.
		}, {
			{ name = "buffer" },
		}),
		mapping = {
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			-- ["<C-x>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
		},
	})

	-- Use buffer source for `/`.
	cmp.setup.cmdline("/", {
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':'.
	cmp.setup.cmdline(":", {
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	vim.cmd([[autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }]])
end

-- dashboard-nvim configuration
M.dashboard = function()
	local dashboard_custom_colors = {
		header_color = "#581298",
		center_color = "#51afef",
		shortcut_color = "#a9a1e1",
		footer_color = "#586268",
	}
	vim.g.dashboard_custom_header = {
		"███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
		"████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
		"██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
		"██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
		"██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
		"██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
		"╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
	}
	vim.g.dashboard_default_executive = "telescope"

	vim.cmd("hi! dashboardHeader   guifg=" .. dashboard_custom_colors.header_color)
	vim.cmd("hi! dashboardCenter   guifg=" .. dashboard_custom_colors.center_color)
	vim.cmd("hi! dashboardShortcut guifg=" .. dashboard_custom_colors.shortcut_color)
	vim.cmd("hi! dashboardFooter   guifg=" .. dashboard_custom_colors.footer_color)
end

-- lualine.nvim evil configuration
M.evilinelua = function()
	-- Eviline config for lualine
	-- Author: shadmansaleh
	-- Credit: glepnir
	local lualine = require("lualine")

    -- Color table for highlights
    -- stylua: ignore
    local colors = {
      bg       = '#402540',
      fg       = '#bbc2cf',
      yellow   = '#ECBE7B',
      cyan     = '#008080',
      darkblue = '#081633',
      green    = '#98be65',
      orange   = '#FF8800',
      violet   = '#a9a1e1',
      magenta  = '#c678dd',
      blue     = '#51afef',
      red      = '#ec5f67',
    }

	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
		check_git_workspace = function()
			local filepath = vim.fn.expand("%:p:h")
			local gitdir = vim.fn.finddir(".git", filepath .. ";")
			return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}

	-- Config
	local config = {
		options = {
			-- Disable sections and component separators
			component_separators = "",
			section_separators = "",
			theme = {
				-- We are going to use lualine_c an lualine_x as left and
				-- right section. Both are highlighted by c theme .  So we
				-- are just setting default looks o statusline
				normal = { c = { fg = colors.fg, bg = colors.bg } },
				inactive = { c = { fg = colors.fg, bg = colors.bg } },
			},
		},
		sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			-- These will be filled later
			lualine_c = {},
			lualine_x = {},
		},
		inactive_sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_v = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
	}

	-- Inserts a component in lualine_c at left section
	local function ins_left(component)
		table.insert(config.sections.lualine_c, component)
	end

	-- Inserts a component in lualine_x ot right section
	local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	end

	ins_left({
		function()
			return "▊"
		end,
		color = { fg = colors.blue }, -- Sets highlighting of component
		padding = { left = 0, right = 1 }, -- We don't need space before this
	})

	ins_left({
		-- mode component
		function()
			-- auto change color according to neovims mode
			local mode_color = {
				n = colors.red,
				i = colors.green,
				v = colors.blue,
				[""] = colors.blue,
				V = colors.blue,
				c = colors.magenta,
				no = colors.red,
				s = colors.orange,
				S = colors.orange,
				ic = colors.yellow,
				R = colors.violet,
				Rv = colors.violet,
				cv = colors.red,
				ce = colors.red,
				r = colors.cyan,
				rm = colors.cyan,
				["r?"] = colors.cyan,
				["!"] = colors.red,
				t = colors.red,
			}
			vim.api.nvim_command("hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg)
			return ""
		end,
		color = "LualineMode",
		padding = { right = 1 },
	})

	ins_left({
		-- filesize component
		"filesize",
		cond = conditions.buffer_not_empty,
	})

	ins_left({
		"filename",
		cond = conditions.buffer_not_empty,
		color = { fg = colors.magenta, gui = "bold" },
	})

	ins_left({ "location" })

	ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

	ins_left({
		"diagnostics",
		sources = { "nvim_lsp" },
		symbols = { error = " ", warn = " ", info = " " },
		diagnostics_color = {
			color_error = { fg = colors.red },
			color_warn = { fg = colors.yellow },
			color_info = { fg = colors.cyan },
		},
	})

	-- Insert mid section. You can make any number of sections in neovim :)
	-- for lualine it's any number greater then 2
	ins_left({
		function()
			return "%="
		end,
	})

	ins_left({
		-- Lsp server name .
		function()
			local msg = "No Active Lsp"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
			return msg
		end,
		icon = " LSP:",
		color = { fg = "#ffffff", gui = "bold" },
	})

	-- Add components to right sections
	ins_right({
		"o:encoding", -- option component same as &encoding in viml
		fmt = string.upper, -- I'm not sure why it's upper case either ;)
		cond = conditions.hide_in_width,
		color = { fg = colors.green, gui = "bold" },
	})

	ins_right({
		"fileformat",
		fmt = string.upper,
		icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
		color = { fg = colors.green, gui = "bold" },
	})

	ins_right({
		"branch",
		icon = "",
		color = { fg = colors.violet, gui = "bold" },
	})

	ins_right({
		"diff",
		-- Is it me or the symbol for modified us really weird
		symbols = { added = " ", modified = "柳 ", removed = " " },
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.orange },
			removed = { fg = colors.red },
		},
		cond = conditions.hide_in_width,
	})

	ins_right({
		function()
			return "▊"
		end,
		color = { fg = colors.blue },
		padding = { left = 1 },
	})

	-- Now don't forget to initialize lualine
	lualine.setup(config)
end

-- format.nvim configuration
M.format = function()
	local fmt = string.format
	require("format").setup({
		["*"] = {
			-- remove trailing whitespaces
			{
				cmd = {
					"sed -i 's/[ \t]*$//'",
				},
			},
		},
		lua = {
			{
				cmd = {
					function(file)
						return fmt("stylua %s", file)
					end,
				},
			},
		},
		python = {
			{
				cmd = {
					function(file)
						return fmt("black %s", file)
					end,
					function(file)
						return fmt("isort %s", file)
					end,
				},
			},
		},
		go = {
			{
				cmd = {
					"gofmt -w",
					"goimports -w",
				},
				tempfile_postfix = ".tmp",
			},
		},
		typescript = {
			{
				cmd = { "prettier -w --parser typescript" },
			},
		},
		html = {
			{
				cmd = { "prettier -w --parser html" },
			},
		},
		markdown = {
			{
				cmd = { "prettier -w --parser markdown" },
			},
			{
				cmd = {
					"black",
				},
				start_pattern = "^```python$",
				end_pattern = "^```$",
				target = "current",
			},
		},
		css = {
			{
				cmd = { "prettier -w --parser css" },
			},
		},
		scss = {
			{
				cmd = { "prettier -w --parser scss" },
			},
		},
		json = {
			{
				cmd = { "prettier -w --parser json" },
			},
		},
		toml = {
			{
				cmd = { "prettier -w --parser toml" },
			},
		},
		yaml = {
			{
				cmd = { "prettier -w --parser yaml" },
			},
		},
	})
end

-- gitsigns.nvim configuration
M.gitsigns = function()
	require("which-key").register({
		["g"] = {
			name = "+git",
			["g"] = { ":Neogit<cr>", "neogit" },
			["d"] = { ":DiffviewOpen<cr>", "git-diff" },
			["D"] = { ":DiffviewOpen master<cr>", "git-diff-master" },
			["l"] = { ":Neogit log<cr>", "git-log" },
			["p"] = { ":Neogit pull<cr>", "git-pull" },
			["P"] = { ":Neogit push<cr>", "git-push" },
			["]"] = { "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'", "next-hunk" },
			["["] = { "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'", "prev-hunk" },
			["s"] = { '<cmd>lua require"gitsigns".stage_hunk()<CR>', "stage-hunk" },
			["u"] = { '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', "unstage-hunk" },
			["r"] = { '<cmd>lua require"gitsigns".reset_hunk()<CR>', "reset-hunk" },
			["R"] = { '<cmd>lua require"gitsigns".reset_buffer()<CR>', "reset-buffer" },
			["v"] = { '<cmd>lua require"gitsigns".preview_hunk()<CR>', "preview-hunk" },
			["b"] = { '<cmd>lua require"gitsigns".blame_line(true)<CR>', "blame-line" },
			["S"] = { '<cmd>lua require"gitsigns".stage_buffer()<CR>', "stage-buffer" },
			["U"] = { '<cmd>lua require"gitsigns".reset_buffer_index()<CR>', "reset-buffer" },
		},
	}, {
		prefix = "<leader>",
	})

	require("gitsigns").setup({
		keymaps = {
			-- Default keymap options
			noremap = true,

			["n ]c"] = {
				expr = true,
				"&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'",
			},
			["n [c"] = {
				expr = true,
				"&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'",
			},

			["v <leader>gs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
			["v <leader>gr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',

			-- Text objects
			["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
			["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
		},
	})
end

M.neogit = function()
	require("neogit").setup({
		disable_commit_confirmation = true,
		integrations = {
			diffview = true,
		},
	})
end

-- neorg configuration
M.neorg = function()
	require("neorg").setup({
		-- Tell Neorg what modules to load
		load = {
			["core.defaults"] = {}, -- Load all the default modules
			["core.norg.concealer"] = {}, -- Allows for use of icons
			["core.keybinds"] = { -- Configure core.keybinds
				config = {
					default_keybinds = true, -- Generate the default keybinds
					neorg_leader = ",o", -- This is the default if unspecified
				},
			},
			["core.norg.dirman"] = { -- Manage your directories with Neorg
				config = {
					workspaces = {
						my_workspace = "~/neorg",
					},
				},
			},
		},
	})
end

-- lsp_signature.nvim configuration
M.lsp_signature = function()
	require("lsp_signature").setup({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		handler_opts = {
			border = "single",
		},
	})
end

-- nvim-lspconfig configuration
M.lspconfig = function()
	local lspconfig = require("lspconfig")
	local util = require("lspconfig.util")
	local langs = {
		bashls = { cmd = "bash-language-server", root_pattern = {} },
		clangd = { cmd = "clangd", root_pattern = { "CMakeLists.txt", "Makefile" } },
		cmake = { cmd = "cmake-language-server", root_pattern = { "CMakeLists.txt" } },
		dockerls = { cmd = "docker-langserver", root_pattern = { "Dockerfile" } },
		gopls = { cmd = "gopls", root_pattern = { "Makefile" } },
		html = { cmd = "vscode-html-language-server", root_pattern = { "index.html", "package.json" } },
		jsonls = { cmd = "vscode-json-language-server", root_pattern = {} },
		pyright = {
			cmd = "pyright-langserver",
			root_pattern = { "setup.py", "setup.cfg", "pyproject.toml", "pyrightconfig.json", "requirements.txt" },
		},
		rust_analyzer = { cmd = "rust-analyzer", root_pattern = "Cargo.toml" },
		sumneko_lua = { cmd = "lua-language-server", root_pattern = { "lua" } },
		texlab = { cmd = "texlab", root_pattern = { "refs.bib", "main.tex" } },
		tsserver = { cmd = "typescript-language-server", root_pattern = { "package.json" } },
		yamlls = { cmd = "yaml-language-server", root_pattern = {} },
		zeta_note = { cmd = "zeta-note-linux", root_pattern = { "README.md", "index.md" } },
	}

	for lang, overrides in pairs(langs) do
		local attach_cb = function()
			local bufnr = vim.bufnr
			local function buf_setopt(...)
				vim.api.nvim_buf_set_option(bufnr, ...)
			end

			buf_setopt("omnifunc", "v:lua.vim.lsp.omnifunc")
			require("which-key").register({
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
				},
			}, {
				prefix = "<leader>",
				buffer = bufnr,
			})
		end

		local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

		local config = {
			capabilities = capabilities,
			flags = {
				debounce_text_changes = 500,
			},
			on_attach = attach_cb,
			root_dir = function(fname)
				local root_files = {
					".git",
					"Makefile",
				}

				if overrides.root_pattern ~= nil then
					for _, v in pairs(overrides.root_pattern) do
						table.insert(root_files, v)
					end
				end
				local root = util.root_pattern(unpack(root_files))(fname) or util.path.dirname(fname)
				if root == vim.loop.os_homedir() then
					root = nil
				end
				return root
			end,
		}
		if lang == "sumneko_lua" then
			config.cmd = {
				vim.loop.os_homedir() .. "/opt/sumneko_lua/bin/Linux/lua-language-server",
				"-E",
				vim.loop.os_homedir() .. "/opt/sumneko_lua/bin/Linux/main.lua",
			}
		elseif lang == "zeta_note" then
			config.cmd = {
				vim.loop.os_homedir() .. "/opt/bin/zeta-note-linux",
			}
		end
		lspconfig[lang].setup(config)
	end

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		signs = true,
		update_in_insert = false,
	})
end

M.persistence = function()
	require("persistence").setup({ dir = vim.fn.stdpath("data") .. "/sessions/" })
	require("which-key").register({
		["s"] = {
			name = "+session",
			["s"] = { '<cmd>lua require("persistence").load()<cr>', "restore-curr-dir-session" },
			["l"] = { '<cmd>lua require("persistence").load({ last = true })<cr>', "restore-last-session" },
		},
	})
end

-- SimpylFold configuration
M.simpylfold = function()
	vim.g.SimpylFold_docstring_preview = 1
end

-- telescope.nvim configuration
M.telescope = function()
	require("which-key").register({
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
	}, {
		prefix = "<leader>",
	})
end

-- toggleterm.nvim configuration
M.toggleterm = function()
	require("toggleterm").setup({
		size = 15,
		open_mapping = [[<F4>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		start_in_insert = true,
		persist_size = true,
		direction = "horizontal",
		close_on_exit = true,
		float_opts = {
			border = "curved",
			width = 70,
			height = 15,
			winblend = 0,
			highlights = {
				border = "Special",
				background = "Normal",
			},
		},
	})
end

-- nvim-treesitter configuration
M.treesitter = function()
	require("nvim-treesitter.configs").setup({
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gs",
				node_incremental = "gh",
				node_decremental = "gH",
				scope_incremental = "gj",
			},
		},
		highlight = { enable = true },
		autopairs = {
			enable = true,
		},
		indent = { enable = true },
		tree_docs = { enable = true },
		autotag = {
			enable = true,
			filetypes = {
				"html",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"svelte",
				"vue",
				"python",
				"lua",
				"markdown",
			},
		},
		textsubjects = {
			enable = true,
			keymaps = {
				["."] = "textsubjects-smart",
				[";"] = "textsubjects-container-outer",
			},
		},
		textobjects = {
			select = {
				enable = true,

				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,

				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
					["il"] = "@loop.inner",
					["al"] = "@loop.outer",
				},
			},
			lsp_interop = {
				enable = true,
				border = "none",
				peek_definition_code = {
					["<leader>df"] = "@function.outer",
					["<leader>dF"] = "@class.outer",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
		},
	})
end

-- nvim-treesitter-context configuration
M.treesitter_context = function()
	require("treesitter-context").setup({
		pattern = {
			default = {
				"class",
				"function",
				"method",
				"for",
				"while",
				"if",
			},
		},
	})
end

-- trouble.nvim configuration
M.trouble = function()
	require("trouble").setup({
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	})
end

-- which-key.nvim configuration
M.whichkey = function()
	local wk = require("which-key")

	wk.setup({
		plugins = {
			marks = false,
			registers = false,
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = true,
				g = true,
			},
		},
		operators = {
			["g~"] = "Toggle case",
			["gu"] = "Lowercase",
			["gU"] = "Uppercase",
			["<lt>"] = "Indent left",
			["zf"] = "Create fold",
			["!"] = "Filter though external program",
		},
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
		},
		key_labels = {
			["<space>"] = "SPC",
			["<cr>"] = "RET",
			["<tab>"] = "TAB",
		},
		window = {
			padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
		},
		layout = {
			height = { min = 1, max = 10 }, -- min and max height of the columns
			spacing = 3,
			align = "left",
		},
		hidden = {
			"<silent>",
			"<Cmd>",
			"<cmd>",
			"<Plug>",
			"call",
			"lua",
			"^:",
			"^ ",
		}, -- hide mapping boilerplate
		show_help = true, -- show help message on the command line when the popup is visible
		triggers = "auto", -- automatically setup triggers
	})

	local mappings = {
		["<leader>"] = { "<Nop>", "leave-pane" },
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
		["t"] = { ":ToggleTerm<cr>", "terminal" },
		["r"] = { '<cmd>lua require("runner").run_code()<CR>', "run-code" },
	}

	wk.register(mappings, { prefix = "<leader>" })
end

-- TrueZen.nvim configuration
M.zen = function()
	require("true-zen").setup({
		ui = {
			bottom = {
				laststatus = 0,
				ruler = false,
				showmode = false,
				showcmd = false,
				cmdheight = 1,
			},
			top = {
				showtabline = 0,
			},
			left = {
				number = false,
				relativenumber = false,
				signcolumn = "no",
			},
		},
		modes = {
			ataraxis = {
				left_padding = 30,
				right_padding = 30,
				top_padding = 0,
				bottom_padding = 0,
				ideal_writing_area_width = { 0 },
				just_do_it_for_me = true,
				keep_default_fold_fillchars = true,
				custome_bg = "",
				bg_configuration = true,
			},
			focus = {
				margin_of_error = 5,
				focus_method = "experimental",
			},
		},
		integrations = {
			galaxyline = true,
			tmux = true,
			gitsigns = true,
			nvim_bufferline = true,
		},
		misc = {
			on_off_commands = false,
			ui_elements_commands = false,
			cursor_by_mode = false,
		},
	})
end

return M
