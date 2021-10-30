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
	local config = require("configuration")
	-- packer can manage itself
	use({ "wbthomason/packer.nvim" })

	-- setup treesitter
	use({
		"romgrk/nvim-treesitter-context",
		config = config.treesitter_context,
	})
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	use({ "rrethy/nvim-treesitter-textsubjects" })
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":tsupdate",
		branch = "0.5-compat",
		config = config.treesitter,
	})

	-- classic vim utilities
	use({ "liuchengxu/vim-better-default", config = config.better_default })
	use({ "tmhedberg/simpylfold", config = config.simpylfold })
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
		config = config.gitsigns,
	})

	use({
		"timuntersberger/neogit",
		config = config.neogit,
		cmd = "neogit",
		module = "neogit",
		requires = { "sindrets/diffview.nvim" },
		opt = false,
	})
	-- nvim utilities
	use({
		"folke/which-key.nvim",
		config = config.whichkey,
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = config.telescope,
	})
	use({ "fedepujol/move.nvim" })
	use({ "akinsho/toggleterm.nvim", config = config.toggleterm })
	use({
		"windwp/nvim-autopairs",
		config = config.autopairs,
		event = "insertenter",
	})
	use({
		"folke/persistence.nvim",
		event = "bufreadpre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = config.persistence,
	})
	use({
		"nvim-neorg/neorg",
		config = config.neorg,
		requires = "nvim-lua/plenary.nvim",
	})

	-- code interaction + lsp + autocomplete
	use({
		"lukas-reineke/format.nvim",
		config = config.format,
		event = "bufwinenter",
	})

	-- use({
	-- 	"ms-jpq/coq_nvim",
	-- 	branch = "coq",
	-- 	event = "vimenter",
	-- 	run = ":coqdeps",
	-- 	config = config.coq,
	-- })
	-- use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
	-- use({
	-- 	"ms-jpq/coq.thirdparty",
	-- 	branch = "3p",
	-- 	config = config.coq3p,
	-- })

	use({
		"ray-x/lsp_signature.nvim",
		config = config.lsp_signature,
	})
	use({ "neovim/nvim-lspconfig", config = config.lspconfig })
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = config.trouble,
	})

	use({ "l3mon4d3/luasnip", config = function() end })
	use({
		{ "kdheepak/cmp-latex-symbols" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
	})
	use({
		"hrsh7th/nvim-cmp",
		config = config.cmp,
	})
	use({ "saadparwaiz1/cmp_luasnip" })

	use({ "simrat39/symbols-outline.nvim" })
	--

	-- ui
	use({ "romgrk/doom-one.vim" })
	use({ "glepnir/dashboard-nvim", config = config.dashboard })

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = config.evilinelua,
	})

	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = config.bufferline,
	})
	use({ "pocco81/truezen.nvim", config = config.zen })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
