---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		["@keyword"] = { fg = c.vscPink, bg = c.vscNone },
	}
end

return set_colors
