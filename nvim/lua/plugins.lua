vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

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
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-- Language servers / Coc plugins
	-- use {'neoclide/coc.nvim', branch = 'release'}
	-- use {'fannheyward/coc-pyright', run = 'yarn install --frozen-lockfile'}
	-- use {'josa42/coc-lua', run = 'yarn install --frozen-lockfile'}
	-- use {'josa42/coc-sh', run = 'yarn install --frozen-lockfile'}
	-- use {'clangd/coc-clangd', run = 'yarn install --frozen-lockfile'}
	-- use {'josa42/coc-go', run = 'yarn install --frozen-lockfile'}
	-- use {'neoclide/coc-json', run = 'yarn install --frozen-lockfile'}
	-- use {'fannheyward/coc-markdownlint', run = 'yarn install --frozen-lockfile'}
	-- use {'fannheyward/coc-rust-analyzer', run = 'yarn install --frozen-lockfile'}
	-- use {'Onichandame/coc-proto3', run = 'yarn install --frozen-lockfile'}
	-- use {'kkiyama117/coc-toml', run = 'yarn install --frozen-lockfile'}
	-- use {'neoclide/coc-yaml', run = 'yarn install --frozen-lockfile'}
	--use "junegunn/fzf.vim"
	--use({
	--  'ibhagwan/fzf-lua',
	--  requires = {
	--    'vijaymarupudi/nvim-fzf',
	--   'kyazdani42/nvim-web-devicons' } -- optional for icons
	--})

	-- Utilities
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({
		"romgrk/nvim-treesitter-context",
		config = require("config.treesittercontextcfg"),
	})
	use({ "liuchengxu/vim-better-default", config = require("config.betterdefaultcfg") })
	use({ "tmhedberg/SimpylFold", config = require("config.simpylfoldcfg") })
	use({
		"lukas-reineke/format.nvim",
		config = require("config.formatcfg"),
		event = 'BufWinEnter'
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitsigns").setup()
		end,
	})
	-- use {
	--     'kyazdani42/nvim-tree.lua',
	--     requires = 'kyazdani42/nvim-web-devicons',
	--     config = function() require'nvim-tree'.setup {} end
	-- }
	use("tpope/vim-commentary")
	use({
		"folke/which-key.nvim",
		config = require("config.whichkeycfg"),
	})
	-- use {'liuchengxu/vim-clap', run = './install.sh', config = require('config.clapcfg')}
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = require("config.telescopecfg"),
	})

	use("michaeljsmith/vim-indent-object")
	use("vim-scripts/indentpython.vim")
	use("mbbill/undotree")
	use("tpope/vim-surround")
	use("tpope/vim-fugitive")
	use({ "akinsho/toggleterm.nvim", config = require("config.toggletermcfg") })

	use({ "sindrets/diffview.nvim" })

	use({
		"TimUntersberger/neogit",
		config = function()
			require("neogit").setup({
				disable_commit_confirmation = true,
				integrations = {
					diffview = true,
				},
			})
		end,
		cmd = "Neogit",
		module = "neogit",
	})
	use({
		"windwp/nvim-autopairs",
		config = require("config.autopairscfg"),
		event = "InsertEnter",
	})
	use({
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("persistence").setup({ dir = vim.fn.stdpath("data") .. "/sessions/" })
		end,
	})

	-- LSP + autocomplete

	use({
		"ms-jpq/coq_nvim",
		branch = "coq",
		event = "VimEnter",
		run = ":COQdeps",
		config = "vim.cmd[[COQnow]]",
	})
	use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
	use({
		"ms-jpq/coq.thirdparty",
		branch = "3p",
		config = function()
			require("coq_3p")({
				{ src = "nvimlua", short_name = "nvLua" },
				{
					src = "repl",
					sh = "zsh",
					shell = { P = "perl", p = "python", s = "bash" },
					unsafe = { "rm", "mv", "dd" },
				},
				{ src = "bc", short_name = "MATH", precision = 4 },
			})
		end,
	})

	use({ "neovim/nvim-lspconfig", config = require("config.lspcfg") })
	use({ "williamboman/nvim-lsp-installer", config = require("config.lspinstallercfg") })
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({ "simrat39/symbols-outline.nvim" })

	--

	-- UI
	use({ "dracula/vim", as = "dracula" })
	use({ "romgrk/doom-one.vim" })
	use({ "GustavoPrietoP/doom-themes.nvim", event = "ColorSchemePre" })
	use({ "glepnir/dashboard-nvim", config = require("config.dashboardcfg") })
	use({
		"glepnir/galaxyline.nvim",
		branch = "main",
		-- your statusline
		config = function()
			require("config.eviline")
		end,
		-- some optional icons
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = require("config.bufferlinecfg"),
	})
	use({ "Pocco81/TrueZen.nvim", config = require("config.zencfg") })
end)
