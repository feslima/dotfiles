local plugins = {
	{ "nvim-lua/plenary.nvim", lazy = false },
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		opts = require("plugins.nvim-treesitter"),
		build = { ":TSUpdate" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function(_, opts)
			require("colorizer").setup(opts)

			-- execute colorizer as soon as possible
			vim.defer_fn(function()
				require("colorizer").attach_to_buffer(0)
			end, 0)
		end,
	},
	{
		"stevearc/dressing.nvim",
		lazy = false,
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lspconfig")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("plugins.luasnip")(opts)
				end,
			},

			-- autopairing of (){}[] etc
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			return require("plugins.cmp")
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		opts = require("plugins.nvim-tree"),
		config = function(_, opts)
			require("nvim-tree").setup(opts)
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
		opts = function()
			return require("plugins.mason")
		end,
		config = function(_, opts)
			require("mason").setup(opts)

			-- custom nvchad cmd to install all mason binaries listed
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
			end, {})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
		cmd = "Telescope",
		opts = function()
			return require("plugins.telescope")
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			-- load extensions
			for _, ext in ipairs(opts.extensions_list) do
				telescope.load_extension(ext)
			end
		end,
	},
	{
		"rmagatti/goto-preview",
		dependencies = "nvim-telescope/telescope.nvim",
		config = function()
			require("goto-preview").setup({})
		end,
	},
	{
		"mfussenegger/nvim-dap",
		init = function()
			-- enable close hover on q (https://github.com/mfussenegger/nvim-dap/issues/415#issuecomment-1017180055)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "dap-float",
				command = "nnoremap <buffer><silent> q <cmd>close!<CR>",
			})
		end,
		cmd = { "DapToggleBreakpoint", "DapStepOver", "DapContinue", "DapStepInto", "DapStepOut" },
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		cmd = { "DebuggerToggle", "DebuggerOpen", "DebuggerClose", "DebuggerEval" },
		init = function()
			require("plugins.dap-ui").configure_hls_and_signs()
		end,
		opts = require("plugins.dap-ui").default_opts_table,
		config = function(_, opts)
			local dapui = require("dapui")
			dapui.setup(opts)

			require("plugins.dap-ui").setup_autocmds(dapui)
		end,
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"mfussenegger/nvim-dap",
		},
		cmd = { "Telescope" },
		config = function()
			require("telescope").load_extension("dap")
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = "mfussenegger/nvim-dap",
		opts = require("plugins.dap").load_dap_python_options,
		keys = { "<leader>td" },
		config = function(_, opts)
			if opts.python_path ~= nil then
				require("dap-python").setup(opts.python_path)
				local dap = require("dap")
				local dap_configs = require("plugins.dap")
				dap_configs.load_python_configurations(dap, opts.python_path)
				dap_configs.load_python_adapters(dap, opts.python_path)
			end
		end,
	},
	{
		"mhartington/formatter.nvim",
		event = { "BufWritePost" },
		cmd = { "FormatWrite" },
		init = function()
			-- format on save
			vim.cmd([[
      augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost * FormatWrite
      augroup END
      ]])
		end,
		opts = require("plugins.formatter"),
		config = function(_, opts)
			local formatter = require("formatter")
			formatter.setup(opts)
		end,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-go",
		},
		cmd = { "Neotest" },
		opts = require("plugins.neotest"),
		config = function(_, opts)
			require("neotest").setup(opts)
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		ft = { "gitcommit", "diff" },
		init = function()
			-- load gitsigns only when a git file is opened
			vim.api.nvim_create_autocmd({ "BufRead" }, {
				group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
				callback = function()
					vim.fn.system("git -C " .. '"' .. vim.fn.expand("%:p:h") .. '"' .. " rev-parse")
					if vim.v.shell_error == 0 then
						vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
						vim.schedule(function()
							require("lazy").load({ plugins = { "gitsigns.nvim" } })
						end)
					end
				end,
			})
		end,
		opts = function()
			return require("plugins.gitsigns")
		end,
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		cmd = {
			"GitConflictChooseOurs",
			"GitConflictChooseTheirs",
			"GitConflictChooseBoth",
			"GitConflictChooseNone",
			"GitConflictNextConflict",
			"GitConflictPrevConflict",
			"GitConflictListQf",
		},
		config = function(_, opts)
			require("git-conflict").setup(opts)
		end,
	},
	{ "mg979/vim-visual-multi", branch = "master", lazy = false },
	{
		"numToStr/Comment.nvim",
		keys = {
			{ "gcc", mode = "n", desc = "Comment toggle current line" },
			{ "gcc", mode = "x", desc = "Comment toggle linewise (visual)" },
		},
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},
	{ "nvim-pack/nvim-spectre", cmd = { "Spectre" } },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "TodoTrouble", "TodoTelescope" },
		config = function(_, opts)
			require("todo-comments").setup(opts)
		end,
	},
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		cmd = { "Octo" },
		config = function(_, opts)
			require("octo").setup(opts)
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require("plugins.lualine"),
		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = require("plugins.bufferline"),
	},
	{
		"rmagatti/auto-session",
		cmd = {
			"SessionSave",
			"SessionRestore",
			"SessionRestoreFromFile",
			"SessionDelete",
			"Autosession",
		},
		init = function()
			vim.cmd("SessionRestore")
		end,
		opts = require("plugins.auto-session"),
		config = function(_, opts)
			require("auto-session").setup(opts)
			vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "ToggleTermToggleAll" },
		config = function(_, opts)
			require("toggleterm").setup(opts)
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		cmd = { "SymbolsOutline" },
		opts = require("plugins.symbols-outline"),
		config = function(_, opts)
			require("symbols-outline").setup(opts)
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = false,
		opts = require("plugins.indent-blankline"),
		config = function(_, opts)
			require("indent_blankline").setup(opts)
		end,
	},
	{
		"folke/which-key.nvim",
		keys = { "<leader>", "<c-r>", '"', "'", "`", "c", "v", "g" },
		cmd = "WhichKey",
		opts = { window = { border = "rounded" } },
		config = function(_, opts)
			local which_key = require("which-key")
			which_key.setup(opts)

			local custom_configs = require("plugins.which-key")
			custom_configs.register_mappings(which_key)
		end,
	},
}

return plugins
