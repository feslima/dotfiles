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
		P = { "<cmd>Telescope projects<CR>", "Open projects" },
		b = {
			name = "+Buffers",
			c = { "<cmd>bdelete!<CR>", "Close buffer" },
			C = { "<cmd>wa <bar> %bd <bar> e# <bar> bd#<CR>", "Close all other buffers" },
			f = {
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
				"Navigate buffers (Telescope)",
			},
			g = { "<cmd>BufferLinePick<CR>", "Go to buffer" },
			n = { "<cmd>bn<CR>", "Next buffer" },
			p = { "<cmd>bp<CR>", "Previous buffer" },
			u = { "<cmd>checktime<CR>", "Update buffer" },
			x = { "<cmd>BufferLinePickClose<CR>", "Close a buffer (pick)" },
		},
		c = {
			name = "+Code",
			a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Show code actions" },
			d = { "<cmd>lua vim.diagnostic.open_float(0, { border = 'rounded' })<CR>", "Line diagnostics" },
			f = { "<cmd>Format<CR>", "Format buffer" },
			g = {
				name = "+Go to actions",
				d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition under cursor" },
				i = {
					"<cmd>lua vim.lsp.buf.implementation()<CR>",
					"Show in quickfix implementations of symbol under cursor",
				},
				n = {
					"<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>",
					"Go to next diagnostic",
				},
				p = {
					"<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>",
					"Go to previous diagnostic",
				},
				r = { "<cmd>Telescope lsp_references<CR>", "References under cursor" },
				v = {
					"<cmd>vsplit | lua vim.lsp.buf.definition()<CR>",
					"Open definition under cursor in vertical buffer",
				},
			},
			h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover information" },
			o = { "<cmd>SymbolsOutline<CR>", "Show code outlines" },
			q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Show Quickfix(es) list" },
			r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
			s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Show function signature help" },
			S = { "<cmd>Telescope lsp_document_symbols<CR>", "Show document symbols (Telescope)" },
			v = {
				name = "+Preview",
				d = {
					function()
						local goto_preview = require("goto-preview")
						goto_preview.goto_preview_definition()
					end,
					"Preview definition",
				},
				i = {
					function()
						local goto_preview = require("goto-preview")
						goto_preview.goto_preview_implementation()
					end,
					"Preview implementation",
				},
				r = {
					function()
						local goto_preview = require("goto-preview")
						goto_preview.goto_preview_references()
					end,
					"Preview references",
				},
			},
		},
		d = {
			name = "+Debugging",
			b = {
				name = "+Breakpoints",
				b = {
					"<cmd>DapToggleBreakpoint<CR>",
					"Toggle breakpoint at line",
				},
				c = {
					function()
						local dap = require("dap")
						vim.ui.input({ prompt = "Breakpoint condition:", default = "" }, function(input)
							dap.set_breakpoint(input)
						end)
					end,
					"Create conditional breakpoint",
				},
				l = {
					function()
						local dap = require("dap")
						dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
					end,
					"Create log breakpoint",
				},
			},
			c = { "<cmd>DapContinue<CR>", "Continue " },
			n = { "<cmd>DapStepOver<CR>", "Step over  (debugger)" },
			i = { "<cmd>DapStepInto<CR>", "Step into  (debugger)" },
			o = { "<cmd>DapStepOut<CR>", "Step out  (debugger)" },
			f = { "<cmd>Telescope dap configurations<CR>", "Select debugger configuration" },
			h = { "<cmd>lua require('dap.ui.widgets').hover()<CR>", "View expression value under cursor in hover" },
			p = {
				name = "+Panel controls",
				c = { "<cmd>DebuggerClose<CR>", "Close dubugger panel" },
				e = { "<cmd>DebuggerEval<CR>", "Evaluate one time expression in debbuger" },
				d = { "<cmd>DebuggerToggle<CR>", "Toggle dubugger panel" },
				o = { "<cmd>DebuggerOpen<CR>", "Open dubugger panel" },
			},
		},
		e = { "<cmd>NvimTreeToggle<CR>", "File Explorer" },
		f = {
			name = "+Find operations",
			a = { "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", "Find all" },
			b = { "<cmd>Telescope buffers<CR>", "Find buffers" },
			d = { "<cmd>Telescope diagnostics<CR>", "Find LSP diagnostics" },
			h = { "<cmd>Telescope help_tags<CR>", "Help page" },
			f = {
				"<cmd>lua require('telescope.builtin').find_files({find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>",
				"Find files",
			},
			o = { "<cmd>Telescope oldfiles<CR>", "Find oldfiles" },
			r = { "<cmd>Spectre<CR>", "Find & Replace (Spectre)" },
			t = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Find in current buffer" },
			T = { "<cmd>TodoTelescope<CR>", "Find TODO annotations" },
			w = { "<cmd>Telescope live_grep<CR>", "Live grep (find text)" },
		},
		g = {
			name = "+Git",
			c = {
				name = "+Conflicts tools",
				c = { "<cmd>GitConflictChooseOurs<CR>", "Select current changes" },
				i = { "<cmd>GitConflictChooseTheirs<CR>", "Select incoming changes" },
				b = { "<cmd>GitConflictChooseBoth<CR>", "Select both changes" },
				N = { "<cmd>GitConflictChooseNone<CR>", "Select none of the changes" },
				n = { "<cmd>GitConflictNextConflict<CR>", "Move to next conflict" },
				p = { "<cmd>GitConflictPrevConflict<CR>", "Move to previous conflict" },
				q = { "<cmd>GitConflictListQf<CR>", "Show all conflicts in quickfix" },
			},
			g = {
				require("plugins.octo").select_actions,
				"GitHub",
			},
			l = {
				function()
					if vim.fn.executable("lazygit") then
						local term_configs = require("plugins.toggleterm")
						local Terminal = term_configs.get_terminal_instance()
						local lazygit = term_configs.create_lazygit_term(Terminal)
						lazygit:toggle()
					end
				end,
				"Toggle LazyGit Terminal",
			},
			h = {
				name = "Hunk operations (Gitsigns)",
				j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
				k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
				l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame line" },
				p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
				r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
				R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
				s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
				u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "Undo Stage Hunk" },
			},
		},
		h = { "<cmd>nohlsearch<CR>", "Clear highlight search" },
		m = {
			name = "+Monitoring",
			e = { "<cmd>Telescope env<CR>", "Current environment variables" },
			i = { "<cmd>Inspect<CR>", "Inspect under cursor" },
			l = {
				name = "+LSP",
				i = { "<cmd>LspInfo<CR>", "Open LSP info panel" },
				l = { "<cmd>LspLog<CR>", "LSP logs" },
				r = { "<cmd>LspRestart<CR>", "Restart LSP server" },
			},
		},
		O = { "<cmd>only<CR>", "Close all other windows except the current one" },
		p = {
			name = "+Plugins (Mason, Lazy, etc)",
			l = { "<cmd>Lazy<CR>", "Open lazy.nvim panel" },
			m = { "<cmd>Mason<CR>", "Open mason.nvim panel" },
		},
		q = { "<cmd>q<CR>", "Quit" },
		s = { "<cmd> set eventignore=BufWritePost | write | set eventignore= <CR>", "Save without events" },
		S = {
			name = "+Session management",
			s = { "<cmd>SaveSession<CR>", "Save session" },
			r = { "<cmd>RestoreSession<CR>", "Restore session" },
			d = { "<cmd>DeleteSession<CR>", "Delete session" },
		},
		t = {
			name = "+Test utilities",
			a = {
				"<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<CR>",
				"Run all tests in file",
			},
			A = {
				"<cmd>lua require('neotest').run.run({ vim.fn.getcwd()})<CR>",
				"Run all tests in suite (project root)",
			},
			d = {
				"<cmd>lua require('neotest').run.run({ strategy = 'dap'})<CR>",
				"Debug nearest test to cursor",
			},
			n = {
				"<cmd>Neotest run<CR>",
				"Run nearest test to cursor",
			},
			p = { "<cmd>lua require('neotest').summary.toggle()<CR>", "Toggle test summary panel" },
			s = { "<cmd>lua require('neotest').run.stop()<CR>", "Stop all running jobs for current file" },
			o = { "<cmd>lua require('neotest').output.open({short=true})<CR>", "Output of test nearest to cursor" },
			O = {
				"<cmd>lua require('neotest').output.open({enter=true})<CR>",
				"Output (scrollable) of test nearest to cursor",
			},
			C = {
				name = "+Configurations",
			},
		},
		T = {
			name = "+Trouble",
			t = { "<cmd>TodoTrouble<CR>", "Open TODOs in trouble" },
			p = { "<cmd>TroubleToggle<CR>", "Toggle trouble panel" },
			R = { "<cmd>TroubleRefresh<CR>", "Refresh active trouble list" },
			d = { "<cmd>TroubleToggle document_diagnostics<CR>", "Toggle document diagnostics" },
			w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Toggle workspace diagnostics" },
			q = { "<cmd>TroubleToggle quickfix<CR>", "Toggle quickfix items" },
			l = { "<cmd>TroubleToggle loclist<CR>", "Toggle window's location list items" },
			r = { "<cmd>TroubleToggle lsp_references<CR>", "Toggle references of word" },
			D = { "<cmd>TroubleToggle lsp_definitions<CR>", "Toggle definitions of word" },
		},
		u = {
			name = "+Terminal utils",
			a = { "<cmd>ToggleTermToggleAll<CR>", "Toggle all terminals" },
			d = {
				function()
					if vim.fn.executable("lazydocker") then
						local term_configs = require("plugins.toggleterm")
						local Terminal = term_configs.get_terminal_instance()
						local lazydocker = term_configs.create_lazydocker_term(Terminal)
						lazydocker:toggle()
					end
				end,
				"Toggle LazyDocker Terminal",
			},
			f = { "<cmd>Telescope termfinder<CR>", "Find terminals" },
			n = {
				function()
					if vim.fn.executable("lazydocker") then
						local term_configs = require("plugins.toggleterm")
						local Terminal = term_configs.get_terminal_instance()
						local term = term_configs.create_floating_term(Terminal)
						term:toggle()
					end
				end,
				"Toggle floating Terminal",
			},
		},
		x = { "<cmd>bdelete!<CR>", "Close buffer" },
		w = { "<cmd>w<CR>", "Save" },
	},
}

return M
