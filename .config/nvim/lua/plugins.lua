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

vim.cmd([[ packadd packer.nvim ]])

local packer = require("packer")

-- Change some defaults
packer.init({
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

packer.startup(function(use)
	local config = require("configuration")
	-- packer can manage itself
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "nvim-lua/popup.nvim" })

	-- setup treesitter
	use({ "romgrk/nvim-treesitter-context", config = config.treesitter_context })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	use({ "rrethy/nvim-treesitter-textsubjects" })
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSInstall all",
		branch = "master",
		config = config.treesitter,
	})

	-- classic vim utilities
	use({ "tpope/vim-commentary" })
	use({ "michaeljsmith/vim-indent-object" })
	use({ "mbbill/undotree" })
	use({ "tpope/vim-surround" })
	use({ "meain/vim-printer", config = config.vim_printer })
	-- git
	use({ "tpope/vim-fugitive" })
	use({ "lewis6991/gitsigns.nvim", config = config.gitsigns })

	use({
		"timuntersberger/neogit",
		config = config.neogit,
		cmd = "neogit",
		module = "neogit",
		requires = { "sindrets/diffview.nvim" },
		opt = false,
	})

	-- nvim utilities
	use({ "ellisonleao/glow.nvim" })
	use({ "max397574/better-escape.nvim", config = config.better_escape })
	use({
		"jghauser/mkdir.nvim",
		config = function()
			require("mkdir")
		end,
	})
	use({ "folke/which-key.nvim", config = config.whichkey })
	use({ "nvim-telescope/telescope.nvim", config = config.telescope })
	use({ "fedepujol/move.nvim" })
	use({ "akinsho/toggleterm.nvim", config = config.toggleterm })
	use({ "windwp/nvim-autopairs", config = config.autopairs, event = "insertenter" })
	use({
		"folke/persistence.nvim",
		event = "bufreadpre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = config.persistence,
	})
	use({ "nvim-neorg/neorg", config = config.neorg })

	-- code interaction + lsp + autocomplete
	use({ "lukas-reineke/format.nvim", config = config.format, event = "bufwinenter" })
	use({ "ray-x/lsp_signature.nvim", config = config.lsp_signature })
	use({ "neovim/nvim-lspconfig", config = config.lspconfig })
	use({ "onsails/lspkind-nvim" })
	use({ "folke/trouble.nvim", config = config.trouble })

	use({ "l3mon4d3/luasnip" })
	use({
		{ "kdheepak/cmp-latex-symbols" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
	})
	use({ "hrsh7th/nvim-cmp", config = config.cmp })
	use({ "saadparwaiz1/cmp_luasnip" })

	use({ "simrat39/symbols-outline.nvim" })
	use({ "vim-scripts/indentpython.vim" })

	-- Code Runners
	use({ "rcarriga/nvim-notify" })
	use({ "michaelb/sniprun", run = "bash install.sh", config = config.sniprun })
	use({ "dccsillag/magma-nvim", run = ":UpdateRemotePlugins", config = config.magma })

	--

	-- ui
	use({ "romgrk/doom-one.vim" })
	use({ "marko-cerovac/material.nvim" })

	use({ "glepnir/dashboard-nvim", config = config.dashboard })

	use({ "nvim-lualine/lualine.nvim", config = config.evilinelua })

	use({ "akinsho/bufferline.nvim", config = config.bufferline })
	use({ "pocco81/truezen.nvim", config = config.zen })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
