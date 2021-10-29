local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

vim.cmd([[ packadd packer.nvim ]])

CONFIG = require("configuration")

-- Change some defaults
require("packer").init({
	git = {
		clone_timeout = 300, -- 5 mins
		subcommands = {
			-- Prevent packer from downloading all branches metadata to reduce cloning cost
			-- for heavy size plugins like plenary (removed the '--no-single-branch' git flag)
			install = "clone --depth %i --progress",
		},
	},
	profile = {
		enable = true,
	},
})

require("packer").startup(function(use)
	-- Packer can manage itself
	use({ "wbthomason/packer.nvim" })

	-- Setup Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		branch = "0.5-compat",
		config = CONFIG.treesitter,
	})
	use({
		"romgrk/nvim-treesitter-context",
		config = CONFIG.treesitter_context,
	})
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	use({ "RRethy/nvim-treesitter-textsubjects" })

	-- Classic vim utilities
	use({ "liuchengxu/vim-better-default", config = CONFIG.better_default })
	use({ "tmhedberg/SimpylFold", config = CONFIG.simpylfold })
	use({ "tpope/vim-commentary" })
	use({ "michaeljsmith/vim-indent-object" })
	use({ "vim-scripts/indentpython.vim" })
	use({ "mbbill/undotree" })
	use({ "tpope/vim-surround" })

	-- git
	use({ "tpope/vim-fugitive" })
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = CONFIG.gitsigns,
	})
	use({
		"TimUntersberger/neogit",
		config = CONFIG.neogit,
		cmd = "Neogit",
		module = "neogit",
	})
	use({ "sindrets/diffview.nvim" })

	-- Nvim utilities
	use({
		"folke/which-key.nvim",
		config = CONFIG.whichkey,
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = CONFIG.telescope,
	})
	use({ "fedepujol/move.nvim" })
	use({ "akinsho/toggleterm.nvim", config = CONFIG.toggleterm })
	use({
		"windwp/nvim-autopairs",
		config = CONFIG.autopairs,
		event = "InsertEnter",
	})
	use({
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = CONFIG.persistence,
	})
	use({
		"nvim-neorg/neorg",
		config = CONFIG.neorg,
		requires = "nvim-lua/plenary.nvim",
	})

	-- Code interaction + LSP + autocomplete
	use({
		"lukas-reineke/format.nvim",
		config = CONFIG.format,
		event = "BufWinEnter",
	})

	-- use({
	-- 	"ms-jpq/coq_nvim",
	-- 	branch = "coq",
	-- 	event = "VimEnter",
	-- 	run = ":COQdeps",
	-- 	config = CONFIG.coq,
	-- })
	-- use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
	-- use({
	-- 	"ms-jpq/coq.thirdparty",
	-- 	branch = "3p",
	-- 	config = CONFIG.coq3p,
	-- })

	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({
				bind = true, -- This is mandatory, otherwise border config won't get registered.
				handler_opts = {
					border = "single",
				},
			})
		end,
	})
	use({ "neovim/nvim-lspconfig", config = CONFIG.lspconfig })
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = CONFIG.trouble,
	})
	use({
		"hrsh7th/nvim-cmp",
		requires = {

			{ "kdheepak/cmp-latex-symbols" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" },
		},
		config = CONFIG.cmp,
	})
	use({ "simrat39/symbols-outline.nvim" })
	--

	-- UI
	use({ "dracula/vim", as = "dracula" })
	use({ "romgrk/doom-one.vim" })
	use({ "GustavoPrietoP/doom-themes.nvim", event = "ColorSchemePre" })
	use({ "glepnir/dashboard-nvim", config = CONFIG.dashboard })
	use({
		"glepnir/galaxyline.nvim",
		branch = "main",
		-- your statusline
		config = CONFIG.eviline,
		-- some optional icons
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = CONFIG.bufferline,
	})
	use({ "Pocco81/TrueZen.nvim", config = CONFIG.zen })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
