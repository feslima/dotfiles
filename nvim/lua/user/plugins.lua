local fn = vim.fn

-- Automatically install install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("Couldn't import packer during plugin loading!")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- You must define your plugins in the block below
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used in lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both nvim-cmp and treesitter
	use("numToStr/Comment.nvim") -- Smart commant actions for code

	-- Colorscheme
	-- use("Mofiqul/vscode.nvim") -- Very similar with VSCode colors (you need TreeSiter to have good syntax highlighting
	use({ "deforde/vscode.nvim", branch = "bugfix/issue-90" }) -- until https://github.com/Mofiqul/vscode.nvim/issues/90 is merged

	-- Code completion (cmp)
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- additional sources of completion for the LSP client
	use("hrsh7th/cmp-nvim-lua") -- completion for nvim lua config files

	-- Snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enables LSP
	use("williamboman/nvim-lsp-installer") -- enables easy LSP configurations (e.g. UI, faster loading, etc.)
	use("tamago324/nlsp-settings.nvim") -- completion for jsonls files
	use("jose-elias-alvarez/null-ls.nvim") -- for formatting and linting
	use("ray-x/lsp_signature.nvim") -- Shows LSP function signature as you type
	use("Vimjas/vim-python-pep8-indent") -- until https://github.com/nvim-treesitter/nvim-treesitter/issues/1136 is fixed

	-- Telescope
	use("nvim-telescope/telescope.nvim") -- Highly customizable fuzzy finder
	use("nvim-telescope/telescope-media-files.nvim") -- Allows Telescope to preview images, pdf, videos, etc.

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/playground", requires = "nvim-treesitter/nvim-treesitter" })
	use("p00f/nvim-ts-rainbow")
	use({ "lewis6991/spellsitter.nvim", requires = "nvim-treesitter/nvim-treesitter" }) -- enables builtin spellchecker into treesitter

	-- Additional comment utilities
	use("JoosepAlviste/nvim-ts-context-commentstring") -- To differentiate in files with multilanguages embedded (e.g. .tsx, .vue)

	-- Git plugins
	use("lewis6991/gitsigns.nvim") -- git decorations similar to VSCode
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }) -- tabpage interface for diff cycling
	use("akinsho/git-conflict.nvim") -- visualize and resolve git conflicts

	-- Nvim-Tree
	use({
		"kyazdani42/nvim-tree.lua", -- Better file explorer
		requires = { "kyazdani42/nvim-web-devicons" }, -- optional, for file icon
	})

	-- Bufferline
	use({
		"akinsho/bufferline.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Lualine
	use("nvim-lualine/lualine.nvim")

	-- Buffer Bye
	use("moll/vim-bbye") -- allows to delete buffers without closing windows

	-- Toggleterm
	use("akinsho/toggleterm.nvim") -- allows terminal use when editing in nvim
	use({
		"tknightz/telescope-termfinder.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
			"akinsho/toggleterm.nvim",
		},
	})

	-- Project
	use("ahmedkhalf/project.nvim") -- allows project-like management

	-- Indentline
	use("lukas-reineke/indent-blankline.nvim") -- adds vertical indentation lines to code

	-- Alpha
	use({
		"goolord/alpha-nvim", -- Greeter for neovim when not opening files
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Which-Key
	use("folke/which-key.nvim") -- easy mappings reminder

	-- Debuggers
	use("mfussenegger/nvim-dap") -- Debug Adapter Protocol client
	use({
		"nvim-telescope/telescope-dap.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
			"mfussenegger/nvim-dap",
		},
	})
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }) -- UI for nvim-dap
	use({ "mfussenegger/nvim-dap-python", requires = { "mfussenegger/nvim-dap" } })

	-- Dressing
	use("stevearc/dressing.nvim") -- better input/select UI

	-- Notifications
	use("rcarriga/nvim-notify") -- messages as notifications

	-- Trouble
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })

	-- Testing
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"vim-test/vim-test",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-vim-test",
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-go",
		},
	})

	-- Pretty-fold
	use({ "anuvyklack/pretty-fold.nvim", requires = "anuvyklack/nvim-keymap-amend" }) -- enables code folding

	-- Todo-comments
	use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Session management
	use("rmagatti/auto-session")
	use({ "rmagatti/session-lens", requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" } })

	-- Code outlines
	use("simrat39/symbols-outline.nvim")

	-- Lightbulb
	use("kosayoda/nvim-lightbulb") -- code actions like VSCode

	-- Environment variables
	use({ "LinArcX/telescope-env.nvim", requires = "nvim-telescope/telescope.nvim" })

	-- Refactoring
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- HTTP client
	use({ "NTBBloodbath/rest.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Search & Replace
	use({ "windwp/nvim-spectre", requires = "nvim-lua/plenary.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
