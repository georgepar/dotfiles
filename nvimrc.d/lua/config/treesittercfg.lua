return function()
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
		-- context_commentstring = { enable = true },
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
	})
end
