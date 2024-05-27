---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		["@function.builtin.asm"] = { fg = c.vscBlue, bg = c.vscNone },
	}
end

return set_colors
