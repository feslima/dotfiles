local M = {}

M.register_mappings = function(which_key)
	local nmaps = require("plugins.which-key.nmaps")
	which_key.add(nmaps.mappings)
end

return M
