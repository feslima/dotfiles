local fn = vim.fn


-- Automatically install install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Couldn't import packer during plugin loading!")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- You must define your plugins in the block below
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used in lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both nvim-cmp and treesitter
  use "numToStr/Comment.nvim" -- Smart commant actions for code

  -- Colorscheme
  use "LunarVim/darkplus.nvim" -- Very similar with VSCode colors (you need TreeSiter to have good syntax highlighting

  -- Code completion (cmp)
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- additional sources of completion for the LSP client
  use "hrsh7th/cmp-nvim-lua" -- completion for nvim lua config files

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enables LSP
  use "williamboman/nvim-lsp-installer" -- enables easy LSP configurations (e.g. UI, faster loading, etc.)
  use "tamago324/nlsp-settings.nvim" -- completion for jsonls files
  use "jose-elias-alvarez/null-ls.nvim" -- for formatting and linting
  use "ray-x/lsp_signature.nvim" -- Shows LSP function signature as you type

  -- Telescope
  use "nvim-telescope/telescope.nvim" -- Highly customizable fuzzy finder
  use "nvim-telescope/telescope-media-files.nvim" -- Allows Telescope to preview images, pdf, videos, etc.

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "p00f/nvim-ts-rainbow"

  -- Additional comment utilities
  use "JoosepAlviste/nvim-ts-context-commentstring" -- To differentiate in files with multilanguages embedded (e.g. .tsx, .vue)

  -- Git plugins
  use "lewis6991/gitsigns.nvim" -- git decorations similar to VSCode

  -- Nvim-Tree
  use {
    "kyazdani42/nvim-tree.lua", -- Better file explorer
    requires = { "kyazdani42/nvim-web-devicons" }, -- optional, for file icon
  }

  -- Bufferline
  use {
    "akinsho/bufferline.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  }

  -- Lualine
  use "nvim-lualine/lualine.nvim"

  -- Buffer Bye
  use "moll/vim-bbye" -- allows to delete buffers without closing windows

  -- Toggleterm
  use "akinsho/toggleterm.nvim" -- allows terminal use when editing in nvim

  -- Project
  use "ahmedkhalf/project.nvim" -- allows project-like management

  -- Indentline
  use "lukas-reineke/indent-blankline.nvim" -- adds vertical indentation lines to code

  -- Alpha
  use { "goolord/alpha-nvim", -- Greeter for neovim when not opening files
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Which-Key
  use "folke/which-key.nvim" -- easy mappings reminder

  -- Debuggers
  use "mfussenegger/nvim-dap" -- Debug Adapter Protocol client
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} } -- UI for nvim-dap

  -- Dressing
  use "stevearc/dressing.nvim" -- better input/select UI

  -- Notifications
  use "rcarriga/nvim-notify" -- messages as notifications

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
