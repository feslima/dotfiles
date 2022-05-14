local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	vim.notify("Couldn't load 'which-key' plugin for http filetype!")
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
		H = {
			name = "HTTP Utils",
			e = {
				function()
					vim.ui.input({ prompt = "Type the file path", completion = "file" }, function(input)
						if input == nil then
							vim.notify("File path not specified!", "error")
							return
						end
						_G.set_http_env_from_file(input)
					end)
				end,
				"Load HTTP environment variables from file",
			},
			r = { "<cmd>lua require('rest-nvim').run()<CR>", "Run request under cursor" },
			p = { "<cmd>lua require('rest-nvim').run(true)<CR>", "Preview request cURL command" },
			l = { "<cmd>lua require('rest-nvim').last()<CR>", "Re-run last request" },
		},
	},
}
which_key.register(nmaps.mappings, nmaps.opts)
