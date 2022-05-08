local M = {
	opts = {
		mode = "v", -- VISUAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	},
	mappings = {
		c = {
			name = "Code",
			a = { "<cmd>lua vim.lsp.buf.range_code_action()<CR>", "Code action for selected range" },
			f = { "<cmd>lua vim.lsp.buf.range_formatting()<CR>", "Format selected range" },
			r = {
				name = "Refactoring",
				f = { "<cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract function" },
				F = {
					"<cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
					"Extract to function to file",
				},
				v = { "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract variable" },
			},
		},
	},
}

return M
