---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		NotifyBackground = { fg = c.vscNone, bg = c.vscPopupBack },
	}
end

return set_colors
