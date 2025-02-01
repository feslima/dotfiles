local M = {
	opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	},
	mappings = {
		{ "<leader>P", "<cmd>Telescope projects<CR>", desc = "Open projects" },

		{ "<leader>b", group = "+Buffers" },
		{ "<leader>bc", "<cmd>bdelete!<CR>", desc = "Close buffer" },
		{ "<leader>bC", "<cmd>wa <bar> %bd <bar> e# <bar> bd#<CR>", desc = "Close all other buffers" },
		{
			"<leader>bf",
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
			desc = "Navigate buffers (Telescope)",
		},
		{ "<leader>bg", "<cmd>BufferLinePick<CR>", desc = "Go to buffer" },
		{ "<leader>bn", "<cmd>bn<CR>", desc = "Next buffer" },
		{ "<leader>bp", "<cmd>bp<CR>", desc = "Previous buffer" },
		{ "<leader>bu", "<cmd>checktime<CR>", desc = "Update buffer" },
		{ "<leader>bx", "<cmd>BufferLinePickClose<CR>", desc = "Close a buffer (pick)" },

		{ "<leader>c", group = "+Code" },
		{ "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Show code actions" },
		{ "<leader>cc", "<cmd>CompilerOpen<CR>", desc = "Open compilation options" },
		{
			"<leader>cd",
			"<cmd>lua vim.diagnostic.open_float(0, { border = 'rounded' })<CR>",
			desc = "Line diagnostics",
		},
		{ "<leader>cf", "<cmd>Format<CR>", desc = "Format buffer" },
		{ "<leader>cg", group = "+Go to actions" },
		{ "<leader>cgd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition under cursor" },
		{
			"<leader>cgi",
			"<cmd>lua vim.lsp.buf.implementation()<CR>",
			desc = "Show in quickfix implementations of symbol under cursor",
		},
		{
			"<leader>cgn",
			"<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>",
			desc = "Go to next diagnostic",
		},
		{
			"<leader>cgp",
			"<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>",
			desc = "Go to previous diagnostic",
		},
		{ "<leader>cgr", "<cmd>Telescope lsp_references<CR>", desc = "References under cursor" },
		{
			"<leader>cgv",
			"<cmd>vsplit | lua vim.lsp.buf.definition()<CR>",
			desc = "Open definition under cursor in vertical buffer",
		},
		{ "<leader>ch", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Show hover information" },
		{ "<leader>co", "<cmd>Navbuddy<CR>", desc = "Show code outlines" },
		{ "<leader>cq", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Show Quickfix(es) list" },
		{ "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
		{ "<leader>cs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Show function signature help" },
		{ "<leader>cS", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Show document symbols (Telescope)" },
		{ "<leader>cv", group = "+Preview" },
		{
			"<leader>cvd",
			function()
				local goto_preview = require("goto-preview")
				goto_preview.goto_preview_definition()
			end,
			desc = "Preview definition",
		},
		{
			"<leader>cvi",
			function()
				local goto_preview = require("goto-preview")
				goto_preview.goto_preview_implementation()
			end,
			desc = "Preview implementation",
		},
		{
			"<leader>cvr",
			function()
				local goto_preview = require("goto-preview")
				goto_preview.goto_preview_references()
			end,
			desc = "Preview references",
		},

		{ "<leader>d", group = "+Debugging" },
		{ "<leader>db", group = "+Breakpoints" },
		{ "<leader>dbb", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle breakpoint at line" },
		{
			"<leader>dbc",
			function()
				local dap = require("dap")
				vim.ui.input({ prompt = "Breakpoint condition:", default = "" }, function(input)
					dap.set_breakpoint(input)
				end)
			end,
			desc = "Create conditional breakpoint",
		},
		{
			"<leader>dbl",
			function()
				local dap = require("dap")
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
			desc = "Create log breakpoint",
		},
		{ "<leader>dc", "<cmd>DapContinue<CR>", desc = "Continue " },
		{ "<leader>dn", "<cmd>DapStepOver<CR>", desc = "Step over  (debugger)" },
		{ "<leader>di", "<cmd>DapStepInto<CR>", desc = "Step into  (debugger)" },
		{ "<leader>do", "<cmd>DapStepOut<CR>", desc = "Step out  (debugger)" },
		{ "<leader>df", "<cmd>Telescope dap configurations<CR>", desc = "Select debugger configuration" },
		{
			"<leader>dh",
			"<cmd>lua require('dap.ui.widgets').hover()<CR>",
			desc = "View expression value under cursor in hover",
		},
		{ "<leader>dp", group = "+Panel controls" },
		{ "<leader>dpc", "<cmd>DebuggerClose<CR>", desc = "Close dubugger panel" },
		{ "<leader>dpe", "<cmd>DebuggerEval<CR>", desc = "Evaluate expression in debugger" },
		{ "<leader>dpi", "<cmd>DebuggerEvalInput<CR>", desc = "Evaluate one time expression in debugger" },
		{ "<leader>dpd", "<cmd>DebuggerToggle<CR>", desc = "Toggle dubugger panel" },
		{ "<leader>dpo", "<cmd>DebuggerOpen<CR>", desc = "Open dubugger panel" },

		{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "File Explorer" },

		{ "<leader>f", group = "+Find operations" },
		{
			"<leader>fa",
			"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
			desc = "Find all files",
		},
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
		{ "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Find LSP diagnostics" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help page" },
		{
			"<leader>ff",
			"<cmd>lua require('telescope.builtin').find_files({find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>",
			desc = "Find files",
		},
		{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Find oldfiles" },
		{ "<leader>fr", "<cmd>Spectre<CR>", desc = "Find & Replace (Spectre)" },
		{ "<leader>ft", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Find in current buffer" },
		{ "<leader>fT", "<cmd>TodoTelescope<CR>", desc = "Find TODO annotations" },
		{ "<leader>fw", "<cmd>Telescope live_grep<CR>", desc = "Live grep (find text)" },

		{ "<leader>g", group = "+Git" },
		{ "<leader>gc", group = "+Conflicts tools" },
		{ "<leader>gcc", "<cmd>GitConflictChooseOurs<CR>", desc = "Select current changes" },
		{ "<leader>gci", "<cmd>GitConflictChooseTheirs<CR>", desc = "Select incoming changes" },
		{ "<leader>gcb", "<cmd>GitConflictChooseBoth<CR>", desc = "Select both changes" },
		{ "<leader>gcN", "<cmd>GitConflictChooseNone<CR>", desc = "Select none of the changes" },
		{ "<leader>gcn", "<cmd>GitConflictNextConflict<CR>", desc = "Move to next conflict" },
		{ "<leader>gcp", "<cmd>GitConflictPrevConflict<CR>", desc = "Move to previous conflict" },
		{ "<leader>gcq", "<cmd>GitConflictListQf<CR>", desc = "Show all conflicts in quickfix" },
		{ "<leader>gg", require("plugins.octo").select_actions, desc = "GitHub" },
		{
			"<leader>gl",
			function()
				if vim.fn.executable("lazygit") then
					local term_configs = require("plugins.toggleterm")
					local Terminal = term_configs.get_terminal_instance()
					local lazygit = term_configs.create_lazygit_term(Terminal)
					lazygit:toggle()
				end
			end,
			desc = "Toggle LazyGit Terminal",
		},
		{ "<leader>gh", group = "+Hunk operations (Gitsigns)" },
		{ "<leader>ghi", "<cmd>lua require 'gitsigns'.next_hunk()<CR>", desc = "Next Hunk" },
		{ "<leader>ghk", "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", desc = "Prev Hunk" },
		{ "<leader>ghl", "<cmd>lua require 'gitsigns'.blame_line()<CR>", desc = "Blame line" },
		{ "<leader>ghp", "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", desc = "Preview Hunk" },
		{ "<leader>ghr", "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", desc = "Reset Hunk" },
		{ "<leader>ghR", "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", desc = "Reset Buffer" },
		{ "<leader>ghs", "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", desc = "Stage Hunk" },
		{ "<leader>ghu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", desc = "Undo Stage Hunk" },

		{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "Clear highlight search" },

		{ "<leader>m", group = "+Monitoring" },
		{ "<leader>me", "<cmd>Telescope env<CR>", desc = "Current environment variables" },
		{ "<leader>mi", "<cmd>Inspect<CR>", desc = "Inspect under cursor" },
		{ "<leader>mt", "<cmd>InspectTree<CR>", desc = "Inspect tree" },
		{ "<leader>ml", group = "+LSP" },
		{ "<leader>mli", "<cmd>LspInfo<CR>", desc = "Open LSP info panel" },
		{ "<leader>mll", "<cmd>LspLog<CR>", desc = "LSP logs" },
		{ "<leader>mlr", "<cmd>LspRestart<CR>", desc = "Restart LSP server" },

		{ "<leader>O", "<cmd>only<CR>", desc = "Close all other windows except the current one" },

		{ "<leader>p", group = "+Plugins (Mason, Lazy, etc)" },
		{ "<leader>pl", "<cmd>Lazy<CR>", desc = "Open lazy.nvim panel" },
		{ "<leader>pm", "<cmd>Mason<CR>", desc = "Open mason.nvim panel" },

		{ "<leader>q", "<cmd>q<CR>", desc = "Quit" },

		{
			"<leader>s",
			"<cmd> set eventignore=BufWritePost | write | set eventignore= <CR>",
			desc = "Save without events",
		},

		{ "<leader>S", group = "+Session management" },
		{ "<leader>Ss", "<cmd>SessionSave<CR>", desc = "Save session" },
		{ "<leader>Sr", "<cmd>SessionRestore<CR>", desc = "Restore session" },
		{ "<leader>Sd", "<cmd>SessionDelete<CR>", desc = "Delete session" },

		{ "<leader>t", group = "+Test utilities" },
		{
			"<leader>ta",
			"<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<CR>",
			desc = "Run all tests in file",
		},
		{
			"<leader>tA",
			"<cmd>lua require('neotest').run.run({ vim.fn.getcwd()})<CR>",
			desc = "Run all tests in suite (project root)",
		},
		{
			"<leader>td",
			"<cmd>lua require('neotest').run.run({ strategy = 'dap'})<CR>",
			desc = "Debug nearest test to cursor",
		},
		{ "<leader>tn", "<cmd>Neotest run<CR>", desc = "Run nearest test to cursor" },
		{ "<leader>tp", "<cmd>lua require('neotest').summary.toggle()<CR>", desc = "Toggle test summary panel" },
		{ "<leader>ts", "<cmd>lua require('neotest').run.stop()<CR>", desc = "Stop all running jobs for current file" },
		{
			"<leader>to",
			"<cmd>lua require('neotest').output.open({short=true})<CR>",
			desc = "Output of test nearest to cursor",
		},
		{
			"<leader>tO",
			"<cmd>lua require('neotest').output.open({enter=true})<CR>",
			desc = "Output (scrollable) of test nearest to cursor",
		},

		{ "<leader>T", group = "+Trouble" },
		{ "<leader>Tt", "<cmd>TodoTrouble<CR>", desc = "Open TODOs in trouble" },
		{ "<leader>Tp", "<cmd>TroubleToggle<CR>", desc = "Toggle trouble panel" },
		{ "<leader>TR", "<cmd>TroubleRefresh<CR>", desc = "Refresh active trouble list" },
		{ "<leader>Td", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Toggle document diagnostics" },
		{ "<leader>Tw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Toggle workspace diagnostics" },
		{ "<leader>Tq", "<cmd>TroubleToggle quickfix<CR>", desc = "Toggle quickfix items" },
		{ "<leader>Tl", "<cmd>TroubleToggle loclist<CR>", desc = "Toggle window's location list items" },
		{ "<leader>Tr", "<cmd>TroubleToggle lsp_references<CR>", desc = "Toggle references of word" },
		{ "<leader>TD", "<cmd>TroubleToggle lsp_definitions<CR>", desc = "Toggle definitions of word" },

		{ "<leader>u", group = "+Terminal utils" },
		{ "<leader>ua", "<cmd>ToggleTermToggleAll<CR>", desc = "Toggle all terminals" },
		{
			"<leader>ud",
			function()
				if vim.fn.executable("lazydocker") then
					local term_configs = require("plugins.toggleterm")
					local Terminal = term_configs.get_terminal_instance()
					local lazydocker = term_configs.create_lazydocker_term(Terminal)
					lazydocker:toggle()
				end
			end,
			desc = "Toggle LazyDocker Terminal",
		},
		{ "<leader>uf", "<cmd>Telescope termfinder<CR>", desc = "Find terminals" },
		{
			"<leader>un",
			function()
				if vim.fn.executable("lazydocker") then
					local term_configs = require("plugins.toggleterm")
					local Terminal = term_configs.get_terminal_instance()
					local term = term_configs.create_floating_term(Terminal)
					term:toggle()
				end
			end,
			desc = "Toggle floating Terminal",
		},

		{ "<leader>x", "<cmd>bdelete!<CR>", desc = "Close buffer" },

		{ "<leader>w", "<cmd>w<CR>", desc = "Save" },
	},
}

return M
