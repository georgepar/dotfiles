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

-- galaxyline.nvim configuration
M.eviline = function()
	local gl = require("galaxyline")
	local gls = gl.section
	-- local extension = require("galaxyline.provider_extensions")
	-- local lsp = require("galaxyline.provider_lsp")

	local function setContains(set, key)
		if key == nil then
			return false
		end

		if set[key] == nil then
			return false
		end

		return true
	end

	gl.short_line_list = {
		"LuaTree",
		"vista",
		"dbui",
		"startify",
		"term",
		"nerdtree",
		"fugitive",
		"fugitiveblame",
		"plug",
	}

	-- VistaPlugin = extension.vista_nearest
	local colors = {
		bg = "#282c34",
		line_bg = "#353644",
		fg = "#8FBCBB",
		fg_green = "#65a380",

		yellow = "#fabd2f",
		cyan = "#008080",
		darkblue = "#081633",
		green = "#afd700",
		orange = "#FF8800",
		purple = "#5d4d7a",
		magenta = "#c678dd",
		blue = "#51afef",
		red = "#ec5f67",
	}

	-- local function get_lsp()
	-- 	if lsp.get_lsp_client() ~= "No Active Lsp" then
	-- 		return " " .. lsp.get_lsp_client():gsub("^%l", string.upper)
	-- 	else
	-- 		-- Use the filetype instead and capitalize it
	-- 		return " " .. (vim.bo.filetype:gsub("^%l", string.upper))
	-- 	end
	-- end

	local function trailing_whitespace()
		local trail = vim.fn.search("\\s$", "nw")
		if trail ~= 0 then
			return " "
		else
			return nil
		end
	end

	-- LspStatus = get_lsp
	TrailingWhiteSpace = trailing_whitespace

	local function has_file_type()
		local f_type = vim.bo.filetype
		if not f_type or f_type == "" then
			return false
		end
		return true
	end

	local buffer_not_empty = function()
		if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
			return true
		end
		return false
	end

	gls.left[1] = {
		FirstElement = {
			provider = function()
				return " "
			end,
			highlight = { colors.blue, colors.line_bg },
		},
	}
	gls.left[2] = {
		ViMode = {
			provider = function()
				-- auto change color according the vim mode
				local alias = {
					n = "NORMAL",
					i = "INSERT",
					c = "COMMAND",
					V = "VISUAL",
					v = "VISUAL",
					["r?"] = ":CONFIRM",
					rm = "--MORE",
					R = "REPLACE",
					Rv = "VIRTUAL",
					s = "SELECT",
					S = "SELECT",
					["r"] = "HIT-ENTER",
					[""] = "SELECT",
					t = "TERMINAL",
					["!"] = "SHELL",
				}
				local mode_color = {
					n = colors.green,
					i = colors.blue,
					v = colors.magenta,
					V = colors.blue,
					no = colors.magenta,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					R = colors.purple,
					Rv = colors.purple,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.green,
					t = colors.green,
					c = colors.purple,
				}
				local vim_mode = vim.fn.mode()
				if not setContains(alias, vim_mode) then
					vim.api.nvim_command("hi GalaxyViMode guifg=" .. colors.red)
					return "VISUAL BLOCK" .. "   "
				end
				vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim_mode])
				return alias[vim_mode] .. "   "
			end,
			highlight = { colors.red, colors.line_bg, "bold" },
		},
	}
	gls.left[3] = {
		FileIcon = {
			provider = "FileIcon",
			condition = buffer_not_empty,
			highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.line_bg },
		},
	}
	gls.left[4] = {
		FileName = {
			provider = { "FileName", "FileSize" },
			condition = buffer_not_empty,
			highlight = { colors.fg, colors.line_bg, "bold" },
		},
	}

	gls.left[5] = {
		GitIcon = {
			provider = function()
				return "  "
			end,
			condition = require("galaxyline.provider_vcs").check_git_workspace,
			highlight = { colors.orange, colors.line_bg },
		},
	}
	gls.left[6] = {
		GitBranch = {
			provider = "GitBranch",
			condition = require("galaxyline.provider_vcs").check_git_workspace,
			highlight = { "#8FBCBB", colors.line_bg, "bold" },
		},
	}

	local checkwidth = function()
		local squeeze_width = vim.fn.winwidth(0) / 2
		if squeeze_width > 40 then
			return true
		end
		return false
	end

	gls.left[7] = {
		DiffAdd = {
			provider = "DiffAdd",
			condition = checkwidth,
			icon = " ",
			highlight = { colors.green, colors.line_bg },
		},
	}
	gls.left[8] = {
		DiffModified = {
			provider = "DiffModified",
			condition = checkwidth,
			icon = " ",
			highlight = { colors.orange, colors.line_bg },
		},
	}
	gls.left[9] = {
		DiffRemove = {
			provider = "DiffRemove",
			condition = checkwidth,
			icon = " ",
			highlight = { colors.red, colors.line_bg },
		},
	}
	gls.left[10] = {
		LeftEnd = {
			provider = function()
				return ""
			end,
			separator = "",
			separator_highlight = { colors.bg, colors.line_bg },
			highlight = { colors.line_bg, colors.line_bg },
		},
	}

	gls.left[11] = {
		TrailingWhiteSpace = {
			provider = TrailingWhiteSpace,
			icon = "  ",
			highlight = { colors.yellow, colors.bg },
		},
	}

	gls.left[12] = {
		DiagnosticError = {
			provider = "DiagnosticError",
			icon = "  ",
			highlight = { colors.red, colors.bg },
		},
	}
	gls.left[13] = {
		Space = {
			provider = function()
				return " "
			end,
		},
	}
	gls.left[14] = {
		DiagnosticWarn = {
			provider = "DiagnosticWarn",
			icon = "  ",
			highlight = { colors.yellow, colors.bg },
		},
	}

	-- gls.left[15] = {
	-- 	LspClient = {
	-- 		provider = LspStatus,
	-- 		condition = function()
	-- 			local tbl = { ["dashboard"] = true, [""] = true }
	-- 			if tbl[vim.bo.filetype] then
	-- 				return false
	-- 			end
	-- 			return true
	-- 		end,
	-- 		highlight = { colors.green, colors.bg },
	-- 		icon = "  🗱",
	-- 	},
	-- }

	gls.right[1] = {
		FileFormat = {
			provider = "FileFormat",
			separator = " ",
			separator_highlight = { colors.bg, colors.line_bg },
			highlight = { colors.fg, colors.line_bg, "bold" },
		},
	}
	gls.right[4] = {
		LineInfo = {
			provider = "LineColumn",
			separator = " | ",
			separator_highlight = { colors.blue, colors.line_bg },
			highlight = { colors.fg, colors.line_bg },
		},
	}
	gls.right[5] = {
		PerCent = {
			provider = "LinePercent",
			separator = " ",
			separator_highlight = { colors.line_bg, colors.line_bg },
			highlight = { colors.cyan, colors.darkblue, "bold" },
		},
	}
	--
	-- gls.right[3] = {
	--   Vista = {
	--     provider = VistaPlugin,
	--     separator = ' ',
	--     separator_highlight = {colors.bg,colors.line_bg},
	--     highlight = {colors.fg,colors.line_bg,'bold'},
	--   }
	-- }

	gls.short_line_left[1] = {
		BufferType = {
			provider = "FileTypeName",
			separator = "",
			condition = has_file_type,
			separator_highlight = { colors.purple, colors.bg },
			highlight = { colors.fg, colors.purple },
		},
	}

	gls.short_line_right[1] = {
		BufferIcon = {
			provider = "BufferIcon",
			separator = "",
			condition = has_file_type,
			separator_highlight = { colors.purple, colors.bg },
			highlight = { colors.fg, colors.purple },
		},
	}
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
-- neorg
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

-- nvim-lspconfig configuration
M.lspconfig = function()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		signs = true,
		update_in_insert = false,
	})
end

-- nvim-lsp-installer configuration
M.lspinstaller = function()
	local lsp_installer = require("nvim-lsp-installer")

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.preselectSupport = true
	capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
	capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
	capabilities.textDocument.completion.completionItem.deprecatedSupport = true
	capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
	capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}

	-- Provide settings first!
	lsp_installer.settings({
		ui = {
			icons = {
				server_installed = "✓",
				server_pending = "➜",
				server_uninstalled = "✗",
			},
		},
	})

	local lsp_installer_servers = require("nvim-lsp-installer.servers")

	local langs = {
		bashls = {},
		clangd = {},
		cmake = {},
		dockerls = {},
		gopls = {},
		html = {},
		jsonls = {},
		pyright = {},
		rust_analyzer = {},
		sumneko_lua = {},
		texlab = {},
		tsserver = {},
		yamlls = {},
	}

	lsp_installer.on_server_ready(function(server)
		local config = {
			capabilities = capabilities,
			flags = {
				debounce_text_changes = 500,
			},
			root_dir = function(fname)
				local util = require("lspconfig.util")
				local root_files = {
					".git",
					".vimrc",
					"setup.py",
					"setup.cfg",
					"pyrightconfig.json",
					"pyproject.toml",
					"requirements.txt",
					"package.json",
					"Makefile",
					"CMakeLists.txt",
					"init.lua",
				}
				local root = util.root_pattern(unpack(root_files))(fname) or util.path.dirname(fname)
				local bits = vim.split(root, "/")
				if root == vim.loop.os_homedir() or bits[2] ~= "home" or #bits < 5 then
					root = nil
				end
				return root
			end,
		}

		local function buf_setopt(...)
			vim.api.nvim_buf_set_option(vim.bufnr, ...)
		end

		buf_setopt("omnifunc", "v:lua.vim.lsp.omnifunc")
		require("which-key").register({
			["c"] = {
				name = "+code",
				["H"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "hover-text" },
				-- ["d"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto definition" },
				["d"] = { ":Telescope lsp_definitions<cr>", "find-definitions" },
				-- ["r"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "List references" },
				["r"] = { ":Telescope lsp_references<cr>", "find-references" },
				["D"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "goto-declaration" },
				-- ["i"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto implementation" },
				["i"] = { ":Telescope lsp_implementations<cr>", "find-implementations" },
				["h"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "signature-help" },
				["E"] = { ":Telescope lsp_workspace_diagnostics<cr>", "workspace-diagnostics" },
				-- ["E"] = {
				-- 	"<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",
				-- 	"List all diagnostics",
				-- },
				["e"] = {
					name = "+errors",
					["e"] = { ":Telescope lsp_document_diagnostics<cr>", "document-diagnostics" },
					["p"] = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "prev-diagnostic" },
					["n"] = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "next-diagnostic" },
				},
				-- ["e"] = {
				-- 	"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
				-- 	"Show line diagnostics",
				-- },
				-- ["a"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
				["a"] = { ":Telescope lsp_code_actions<cr>", "code-actions" },
				["R"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
				-- ["t"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
				["t"] = { ":Telescope lsp_type_definitions<cr>", "type-definitions" },
				["s"] = { ":SymbolsOutline<cr>", "document-symbols" },
				["S"] = { ":Telescope lsp_workspace_symbols<cr>", "workspace-symbols" },
			},
		}, {
			prefix = "<leader>",
			buffer = vim.bufnr,
		})

		-- for k,v in pairs(langs[server]) do
		--     config[k] = v
		-- end

		local coq = require("coq")
		server:setup(coq.lsp_ensure_capabilities(vim.tbl_deep_extend("force", config, {})))
		vim.cmd([[ do User LspAttachBuffers ]])
	end)

	for lsp, _ in pairs(langs) do
		local ok, server = lsp_installer_servers.get_server(lsp)
		if ok then
			if not server:is_installed() then
				server:install()
			end
		end
	end
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
		["g"] = {
			name = "+git",
			["g"] = { ":Neogit<cr>", "neogit" },
			["d"] = { ":DiffviewOpen<cr>", "git-diff" },
			["D"] = { ":DiffviewOpen master<cr>", "git-diff-master" },
			["l"] = { ":Neogit log<cr>", "git-log" },
			["p"] = { ":Neogit pull<cr>", "git-pull" },
			["P"] = { ":Neogit push<cr>", "git-push" },
		},
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
