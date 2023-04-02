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
	use({ "wbthomason/packer.nvim", commit = "dac4088c70f4337c6c40d1a2751266a324765797" }) -- Have packer manage itself
	use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }) -- An implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }) -- Useful lua functions used in lots of plugins
	use({ "windwp/nvim-autopairs", commit = "03580d758231956d33c8dd91e2be195106a79fa4" }) -- Autopairs, integrates with both nvim-cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "7bb563ff2d811a63b207e9de63e3e9c0877cb6d5" }) -- Smart commant actions for code

	-- Colorscheme
	use({ "Mofiqul/vscode.nvim", commit = "05725b48418cbd6f223e45a114c7a19d0c683fce" }) -- Very similar with VSCode colors (you need TreeSiter to have good syntax highlighting

	-- Code completion (cmp)
	use({ "hrsh7th/nvim-cmp", commit = "c49ad26e894e137e401b1d294948c46327877eaf" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }) -- path completions
	use({ "hrsh7th/cmp-cmdline", commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" }) -- additional sources of completion for the LSP client
	use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }) -- completion for nvim lua config files

	-- Snippets
	use({ "L3MON4D3/LuaSnip", commit = "5570fd797eae0790affb54ea669a150cad76db5d" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "1a6a02350568d6830bcfa167c72f9b6e75e454ae" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig", commit = "6b43ce561d97412cc512b569db6938e44529293e" }) -- enables LSP
	use({ "williamboman/nvim-lsp-installer", commit = "17e0bfa5f2c8854d1636fcd036dc8284db136baa" }) -- enables easy LSP configurations (e.g. UI, faster loading, etc.)
	use({ "tamago324/nlsp-settings.nvim", commit = "d652d2354a8ac32fc694a13143c8e302607079cd" }) -- completion for jsonls files
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "647a1eeeefc43ce15d941972642210637c370471" }) -- for formatting and linting
	use({ "ray-x/lsp_signature.nvim", commit = "1979f1118e2b38084e7c148f279eed6e9300a342" }) -- Shows LSP function signature as you type
	use({ "Vimjas/vim-python-pep8-indent", commit = "60ba5e11a61618c0344e2db190210145083c91f8" }) -- until https://github.com/nvim-treesitter/nvim-treesitter/issues/1136 is fixed

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "a606bd10c79ec5989c76c49cc6f736e88b63f0da" }) -- Highly customizable fuzzy finder
	use({ "nvim-telescope/telescope-media-files.nvim", commit = "513e4ee385edd72bf0b35a217b7e39f84b6fe93c" }) -- Allows Telescope to preview images, pdf, videos, etc.

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", commit = "168567efb8aa3874f3da8832dbcd3d1a4ff40d3b" })
	use({
		"nvim-treesitter/playground",
		requires = "nvim-treesitter/nvim-treesitter",
		commit = "8a887bcf66017bd775a0fb19c9d8b7a4d6759c48",
	})
	use({ "p00f/nvim-ts-rainbow", commit = "064fd6c0a15fae7f876c2c6dd4524ca3fad96750" })
	use({
		"lewis6991/spellsitter.nvim",
		requires = "nvim-treesitter/nvim-treesitter",
		commit = "4af8640d9d706447e78c13150ef7475ea2c16b30",
	}) -- enables builtin spellchecker into treesitter
	use({
		"nvim-treesitter/nvim-treesitter-context",
		requires = "nvim-treesitter/nvim-treesitter",
		commit = "d28654b012d4c56beafec630ef7143275dff76f8",
	})

	-- Additional comment utilities
	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "4a42b30376c1bd625ab5016c2079631d531d797a" }) -- To differentiate in files with multilanguages embedded (e.g. .tsx, .vue)

	-- Git plugins
	use({ "lewis6991/gitsigns.nvim", commit = "2ab3bdf0a40bab53033048c6be75bda86316b55d" }) -- git decorations similar to VSCode
	use({
		"sindrets/diffview.nvim",
		commit = "18f83302f71889b39403919b8be00d7244d1fcfc",
		requires = "nvim-lua/plenary.nvim",
	}) -- tabpage interface for diff cycling
	use({ "akinsho/git-conflict.nvim", commit = "77faa75c09a6af88e7b54d8d456327e06611f7ea" }) -- visualize and resolve git conflicts

	-- Nvim-Tree
	use({
		"kyazdani42/nvim-tree.lua", -- Better file explorer
		commit = "dcc344cc72a617ff01db950aedfd3b3430ba5b59",
		requires = { "kyazdani42/nvim-web-devicons" }, -- optional, for file icon
	})

	-- Bufferline
	use({
		"akinsho/bufferline.nvim",
		commit = "c7492a76ce8218e3335f027af44930576b561013",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Lualine
	use({ "nvim-lualine/lualine.nvim", commit = "32a7382a75a52e8ad05f4cec7eeb8bbfbe80d461" })

	-- Buffer Bye
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }) -- allows to delete buffers without closing windows

	-- Toggleterm
	use({ "akinsho/toggleterm.nvim", commit = "b02a1674bd0010d7982b056fd3df4f717ff8a57a" }) -- allows terminal use when editing in nvim
	use({
		"tknightz/telescope-termfinder.nvim",
		commit = "d639bfae1ff5e644700f20d208b2224648b573cf",
		requires = {
			"nvim-telescope/telescope.nvim",
			"akinsho/toggleterm.nvim",
		},
	})

	-- Project
	use({ "ahmedkhalf/project.nvim", commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4" }) -- allows project-like management

	-- Indentline
	use({ "lukas-reineke/indent-blankline.nvim", commit = "c4c203c3e8a595bc333abaf168fcb10c13ed5fb7" }) -- adds vertical indentation lines to code

	-- Alpha
	use({
		"goolord/alpha-nvim", -- Greeter for neovim when not opening files
		commit = "21a0f2520ad3a7c32c0822f943368dc063a569fb",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Which-Key
	use({ "folke/which-key.nvim", commit = "8682d3003595017cd8ffb4c860a07576647cc6f8" }) -- easy mappings reminder

	-- Debuggers
	use({ "mfussenegger/nvim-dap", commit = "69b7c684cd42e60b48875c580e616a70bccfdbe7" }) -- Debug Adapter Protocol client
	use({
		"nvim-telescope/telescope-dap.nvim",
		commit = "313d2ea12ae59a1ca51b62bf01fc941a983d9c9c",
		requires = {
			"nvim-telescope/telescope.nvim",
			"mfussenegger/nvim-dap",
		},
	})
	use({
		"rcarriga/nvim-dap-ui",
		commit = "54365d2eb4cb9cfab0371306c6a76c913c5a67e3",
		requires = { "mfussenegger/nvim-dap" },
	}) -- UI for nvim-dap
	use({
		"mfussenegger/nvim-dap-python",
		commit = "d4400d075c21ed8fb8e8ac6a5ff56f58f6e93531",
		requires = { "mfussenegger/nvim-dap" },
	})
	use({
		"leoluz/nvim-dap-go",
		commit = "8f10f347b3332d1f783a209813bf9b61f517256f",
		requires = "mfussenegger/nvim-dap",
	})

	-- Dressing
	use({ "stevearc/dressing.nvim", commit = "4436d6f41e2f6b8ada57588acd1a9f8b3d21453c" }) -- better input/select UI

	-- Notifications
	use({ "rcarriga/nvim-notify", commit = "b005821516f1f37801a73067afd1cef2dbc4dfe8" }) -- messages as notifications

	-- Trouble
	use({
		"folke/trouble.nvim",
		commit = "897542f90050c3230856bc6e45de58b94c700bbf",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- Testing
	use({
		"nvim-neotest/neotest",
		commit = "3deec0891f0b79f982188978c8eb51b65d9f1731",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"vim-test/vim-test",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-vim-test",
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-go",
			"markemmons/neotest-deno",
			"marilari88/neotest-vitest",
		},
	})

	-- Pretty-fold
	use({
		"anuvyklack/pretty-fold.nvim",
		commit = "a7d8b424abe0eedf50116c460fbe6dfd5783b1d5",
		requires = "anuvyklack/nvim-keymap-amend",
	}) -- enables code folding

	-- Todo-comments
	use({
		"folke/todo-comments.nvim",
		commit = "c1760010f46992165995aaa52ca967f473a2e8e6",
		requires = "nvim-lua/plenary.nvim",
	})

	-- Session management
	use({ "rmagatti/auto-session", commit = "c8b2f4048f846387361bd04cc185bf1aa7d2e3d1" })
	use({
		"rmagatti/session-lens",
		commit = "b15e36782d01abacf6cd44e12f3292632064ab91",
		requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
	})

	-- Code outlines
	use({ "simrat39/symbols-outline.nvim", commit = "6a3ed24c5631da7a5d418bced57c16b32af7747c" })

	-- Lightbulb
	use({ "kosayoda/nvim-lightbulb", commit = "56b9ce31ec9d09d560fe8787c0920f76bc208297" }) -- code actions like VSCode

	-- Environment variables
	use({
		"LinArcX/telescope-env.nvim",
		commit = "00a703cc7b713cdda0a981d88fddf3ce25502af5",
		requires = "nvim-telescope/telescope.nvim",
	})

	-- Refactoring
	use({
		"ThePrimeagen/refactoring.nvim",
		commit = "2c72385b627e46bb66f23b8a11da40b4bb127506",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- HTTP client
	use({
		"NTBBloodbath/rest.nvim",
		commit = "f94c795321b4ee77834db0300cf42f33d6605000",
		requires = "nvim-lua/plenary.nvim",
	})

	-- Search & Replace
	use({
		"windwp/nvim-spectre",
		commit = "68ea562b485b6593e325e7916c3bd6e833d433e7",
		requires = "nvim-lua/plenary.nvim",
	})

	-- Peek definitions/references
	use({
		"rmagatti/goto-preview",
		commit = "54a5e18f6a42b39021b7aef62aae4dda8680d666",
		requires = "nvim-telescope/telescope.nvim",
	})

	-- Mutliple cursor
	use({ "mg979/vim-visual-multi", commit = "724bd53adfbaf32e129b001658b45d4c5c29ca1a" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
