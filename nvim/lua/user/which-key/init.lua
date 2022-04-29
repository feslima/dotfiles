local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	vim.notify("Couldn't load 'which-key' plugin!")
	return
end

-- https://github.com/folke/which-key.nvim#%EF%B8%8F-configuration
local setup_configs = {
	presets = {
		operators = false,
	},
	window = {
		border = "rounded",
	},
}

which_key.setup(setup_configs)

local nmaps = require("user.which-key.nmaps")
which_key.register(nmaps.mappings, nmaps.opts)

local vmaps = require("user.which-key.vmaps")
which_key.register(vmaps.mappings, vmaps.opts)
