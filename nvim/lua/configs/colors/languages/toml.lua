---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		["@property.toml"] = { fg = c.vscLightBlue, bg = c.vscNone },
	}
end

return set_colors
