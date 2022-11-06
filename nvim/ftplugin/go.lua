local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	vim.notify("Couldn't load 'which-key' plugin for typescript filetype!")
	return
end

local setup_configs = {
	presets = {
		operators = false,
	},
	window = {
		border = "rounded",
	},
}

which_key.setup(setup_configs)

local nmaps = {
	opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	},
	mappings = {
		t = {
			name = "Test utilities",
			-- FIXME: Remove this after neotest-go has dap strategy/support
			-- https://github.com/nvim-neotest/neotest-go/pull/13
			-- https://github.com/nvim-neotest/neotest-go/issues/12
			d = { "<cmd>lua require('dap-go').debug_test()<CR>", "Debug nearest test to cursor" },
		},
	},
}
which_key.register(nmaps.mappings, nmaps.opts)
