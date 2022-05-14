local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	vim.notify("Couldn't load 'which-key' plugin for typescriptreact filetype!")
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
		u = {
			name = "Terminal utils",
			c = { "<cmd>lua _CYPRESS_TOGGLE()<CR>", "Open/toggle cypress panel" },
		},
	},
}
which_key.register(nmaps.mappings, nmaps.opts)
