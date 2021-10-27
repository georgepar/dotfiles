return function()
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

	local on_ready = lsp_installer.on_server_ready(function(server)
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
			vim.api.nvim_buf_set_option(bufnr, ...)
		end

		buf_setopt("omnifunc", "v:lua.vim.lsp.omnifunc")
		require("which-key").register({
			["c"] = {
				name = "+code",
				["H"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover text" },
				["d"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto definition" },
				["r"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "List references" },
				["D"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declaration" },
				["i"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto implementation" },
				["s"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
				["["] = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Prev diagnostic" },
				["]"] = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next diagnostic" },
				["E"] = {
					"<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",
					"List all diagnostics",
				},
				["e"] = {
					"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
					"Show line diagnostics",
				},
				["a"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
				["R"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
				["t"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
			},
		}, {
			prefix = "<leader>",
			buffer = bufnr,
		})

		-- for k,v in pairs(langs[server]) do
		--     config[k] = v
		-- end

		local coq = require("coq")
		server:setup(coq.lsp_ensure_capabilities(vim.tbl_deep_extend("force", config, {})))
		vim.cmd([[ do User LspAttachBuffers ]])
	end)

	for lsp, overrides in pairs(langs) do
		local ok, server = lsp_installer_servers.get_server(lsp)
		if ok then
			if not server:is_installed() then
				server:install()
			end
		end

		-- nvim_lsp[lsp].setup(config)
	end
end
