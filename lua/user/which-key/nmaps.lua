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
		F = { "<cmd>Telescope live_grep theme=ivy<CR>", "Find Text" },
		P = { "<cmd>Telescope projects<CR>", "Open projects" },
		b = {
			name = "Buffers",
			c = { "<cmd>Bdelete!<CR>", "Close buffer" },
			f = {
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
				"Navigate buffers (Telescope)",
			},
			n = { "<cmd>bn<CR>", "Next buffer" },
			p = { "<cmd>bp<CR>", "Previous buffer" },
			u = { "<cmd>checktime<CR>", "Update buffer" },
		},
		c = {
			name = "Code",
			a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Show code actions" },
			d = { "<cmd>lua vim.diagnostic.open_float(0, { border = 'rounded' })<CR>", "Line diagnostics" },
			f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format buffer" },
			g = {
				name = "Go to actions",
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
			q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Show Quickfix(es) list" },
			r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
			s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Show function signature help" },
			S = { "<cmd>Telescope lsp_document_symbols<CR>", "Show document symbols (Telescope)" },
		},
		d = {
			name = "Debugging",
			d = { "<cmd>DebuggerToggle<CR>", "Toggle dubugger panel" },
			c = { "<cmd>DebuggerClose<CR>", "Close dubugger panel" },
			e = { "<cmd>DebuggerEval<CR>", "Evaluate one time expression in debbuger" },
			h = { "<cmd>lua require('dap.ui.widgets').hover()<CR>", "View expression value under cursor in hover" },
			o = { "<cmd>DebuggerOpen<CR>", "Open dubugger panel" },
		},
		e = { "<cmd>NvimTreeToggle<CR>", "File Explorer" },
		f = {
			"<cmd>lua require('telescope.builtin').find_files({find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>",
			"Find files",
		},
		g = {
			name = "Git",
			b = { "<cmd>Telescope git_branches<CR>", "List branches" },
			c = { "<cmd>Telescope git_commits<CR>", "List commits" },
			C = {
				name = "Conflicts tools",
				c = { "<cmd>GitConflictChooseOurs<CR>", "Select current changes" },
				i = { "<cmd>GitConflictChooseTheirs<CR>", "Select incoming changes" },
				b = { "<cmd>GitConflictChooseBoth<CR>", "Select both changes" },
				N = { "<cmd>GitConflictChooseNone<CR>", "Select none of the changes" },
				n = { "<cmd>GitConflictNextConflict<CR>", "Move to next conflict" },
				p = { "<cmd>GitConflictPrevConflict<CR>", "Move to previous conflict" },
				q = { "<cmd>GitConflictListQf<CR>", "Show all conflicts in quickfix" },
			},
			d = {
				name = "Diff view",
				c = { "<cmd>DiffviewClose<CR>", "Close the current diffview" },
				f = { "<cmd>DiffviewFileHistory<CR>", "Opens the current file history view" },
				h = {
					function()
						vim.ui.input(
							{ prompt = "Enter number of commits (x) from HEAD [HEAD~x]:", default = "1" },
							function(input)
								vim.cmd("DiffviewOpen HEAD~" .. input)
							end
						)
					end,
					"Open diffview against HEAD",
				},
			},
			s = { "<cmd>Telescope git_status<CR>", "Show git status" },
			l = { "<cmd> lua _LAZYGIT_TOGGLE()<CR>", "Toggle LazyGit Terminal" },
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
		l = {
			name = "LSP",
			i = { "<cmd>LspInfo<CR>", "LSP Info" },
			I = { "<cmd>LspInstallInfo<CR>", "LSP Installer Info" },
			n = { "<cmd>NullLsInfo<CR>", "Null-LS info" },
			r = { "<cmd>LspRestart<CR>", "Restart LSP server" },
		},
		m = {
			name = "Minimap",
			o = { "<cmd>Minimap<CR>", "Show minimap window" },
			c = { "<cmd>MinimapClose<CR>", "Close minimap window" },
			t = { "<cmd>MinimapToggle<CR>", "Toggle minimap window" },
			r = { "<cmd>MinimapRefresh<CR>", "Refresh minimap window" },
			u = { "<cmd>MinimapUpdateHightlight<CR>", "Update minimap highlight" },
			s = { "<cmd>MinimapRescan<CR>", "Recalculate minimap scaling ratio" },
		},
		o = { "<cmd>only<CR>", "Close all other windows except the current one" },
		p = {
			name = "Packer",
			c = { "<cmd>PackerCompile<CR>", "Compile" },
			i = { "<cmd>PackerInstall<CR>", "Install" },
			s = { "<cmd>PackerSync<CR>", "Sync" },
			S = { "<cmd>PackerStatus<CR>", "Status" },
			u = { "<cmd>PackerUpdate<CR>", "Update" },
		},
		q = { "<cmd>q<CR>", "Quit" },
		s = {
			name = "Search (help, keymaps, etc)",
			a = { "<cmd>Telescope autocommands<CR>", "Autocommands" },
			c = { "<cmd>Telescope commands<CR>", "Commands" },
			h = { "<cmd>Telescope help_tags<CR>", "List available help tags" },
			n = { "<cmd>Telescope notify theme=ivy<CR>", "Notifications history" },
			r = { "<cmd>Telescope oldfiles<CR>", "Open Recent Files" },
			s = { "<cmd>Telescope session-lens search_session<CR>", "Sessions" },
			k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
			t = { "<cmd>TodoTelescope<CR>", "TODOs" },
		},
		S = {
			name = "Session management",
			s = { "<cmd>SaveSession<CR>", "Save session" },
			r = { "<cmd>RestoreSession<CR>", "Restore session" },
			d = { "<cmd>DeleteSession<CR>", "Delete session" },
		},
		t = {
			name = "Test utilities",
			a = { "<cmd>Ultest<CR>", "Run all tests in file" },
			A = { "<cmd>TestSuite<CR>", "Run all tests in suite" },
			d = { "<cmd>UltestDebugNearest<CR>", "Debug nearest test to cursor" },
			n = { "<cmd>UltestNearest<CR>", "Run nearest test to cursor" },
			c = { "<cmd>UltestClear<CR>", "Clear test results" },
			p = { "<cmd>UltestSummary<CR>", "Toggle test summary panel" },
			s = { "<cmd>UltestStop<CR>", "Stop all running jobs for current file" },
			o = { "<cmd>UltestOutput<CR>", "Output of test nearest to cursor" },
			O = { "<cmd>call ultest#output#jumpto()<CR>", "Output (scrollable) of test nearest to cursor" },
		},
		T = {
			name = "Trouble",
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
			name = "Terminal utils",
			a = { "<cmd>ToggleTermToggleAll<CR>", "Toggle all terminals" },
			c = { "<cmd>lua _CYPRESS_TOGGLE()<CR>", "Open/toggle cypress panel" },
			d = { "<cmd>lua _LAZYDOCKER_TOGGLE()<CR>", "Toggle LazyDocker Terminal" },
			f = { "<cmd>Telescope termfinder<CR>", "Find terminals" },
		},
		w = { "<cmd>w<CR>", "Save" },
	},
}

return M
