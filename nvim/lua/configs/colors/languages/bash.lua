---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		["@variable.bash"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@constant.bash"] = { fg = c.vscLightBlue, bg = c.vscNone },
	}
end

return set_colors
